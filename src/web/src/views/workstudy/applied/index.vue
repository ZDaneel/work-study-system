<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="岗位" prop="chooseJob">
        <el-cascader
          filterable
          :props="{ checkStrictly: true }"
          v-model="queryParams.chooseJob"
          :options="options"
        />
      </el-form-item>

      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择状态"
          clearable
        >
          <el-option
            v-for="dict in business_effective"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Download" @click="handleExport"
          >导出酬金发放单</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="appliedList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column label="部门" align="center" prop="employmentPartyA" />
      <el-table-column label="岗位" align="center" prop="jobName" />
      <el-table-column label="姓名" align="center" prop="studentName" />
      <el-table-column
        label="开始时间"
        align="center"
        prop="startTime"
        width="120"
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.startTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="结束时间"
        align="center"
        prop="endTime"
        width="120"
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.endTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="月标准工作天数"
        align="center"
        prop="standardDays"
        width="120"
      />
      <el-table-column label="日工作时长" align="center" prop="hours" />
      <el-table-column label="基础工资" align="center" prop="baseSalary" />
      <el-table-column
        label="绩效工资"
        align="center"
        prop="performanceSalary"
      />
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="business_effective" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="EditPen"
            @click="handleLink(scope.row.id)"
            >考核</el-button
          >
          <el-button
            link
            type="warning"
            icon="SwitchButton"
            @click="handleTerminate(scope.row)"
            v-if="scope.row.status === 1"
            >终止</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script setup name="Applied">
import { listAllEmployment } from "@/api/workstudy/employment";
import { listApplied, terminateApplication } from "@/api/workstudy/application";
import { getAssessmentCount } from "@/api/workstudy/assessment";
import { ElMessage, ElMessageBox } from "element-plus";
import { useRouter } from "vue-router";

const router = useRouter();
const { proxy } = getCurrentInstance();
const { business_effective } = proxy.useDict("business_effective");

const appliedList = ref([]);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const loading = ref(false);
const total = ref(0);
const options = ref([]);

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    status: null,
    chooseJob: null,
    jobId: null,
    employmentId: null,
  },
});

const { queryParams } = toRefs(data);

/** 查询用工计划列表 */
function getList() {
  loading.value = true;
  listApplied(queryParams.value).then((response) => {
    appliedList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 获取用工计划和岗位列表 */
function getJobs() {
  listAllEmployment().then((res) => {
    if (res.code === 200) {
      const employmentJobs = res.data;
      options.value = employmentJobs.map((item) => ({
        value: item.id,
        label: item.department,
        children: item.employmentJobs.map((job) => ({
          value: job.jobId,
          label: job.jobName,
        })),
      }));
    }
  });
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  if (queryParams.value.chooseJob) {
    const num = queryParams.value.chooseJob.length;
    if (num === 1) {
      queryParams.value.employmentId = queryParams.value.chooseJob[0];
      queryParams.value.jobId = null;
    } else if (num === 2) {
      queryParams.value.employmentId = queryParams.value.chooseJob[0];
      queryParams.value.jobId = queryParams.value.chooseJob[1];
    }
  }
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  queryParams.value.employmentId = null;
  queryParams.value.jobId = null;
  handleQuery();
}

/** 导出酬金发放单 */
function handleExport() {
  ElMessageBox.prompt("请输入年月, 格式如2023-06", "导出酬金发放单", {
    confirmButtonText: "OK",
    cancelButtonText: "Cancel",
    inputPattern: /\d{4}-(0[1-9]|1[0-2])/,
    inputValue: "2023-06",
    inputErrorMessage: "无效月份",
  })
    .then(({ value }) => {
      const totalNum = total.value;
      const year = value.split("-")[0];
      const month = value.split("-")[1];
      // 从appliedList中获取所有的合同id
      const appliedIds = appliedList.value.map((item) => item.id);
      const countParams = {
        appliedIds,
        year,
        month,
      };
      // 判断选择的年月对应的合同是否都完成了考核
      getAssessmentCount(countParams)
        .then((res) => {
          if (res.code === 200) {
            console.log(res);
            const count = res.data;
            if (count === totalNum) {
              const params = {
                ...queryParams.value,
                year,
                month,
              };
              proxy.download(
                "workstudy/salary/export",
                {
                  ...params,
                },
                `酬金发放单_${value}.xlsx`
              );
            } else {
              ElMessage({
                type: "warning",
                message: "存在未考核的合同",
              });
            }
          }
        })
        .catch((e) => {
          console.log(e);
          ElMessage({
            type: "error",
            message: "导出失败",
          });
        });
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "取消导出",
      });
    });
}

/** 跳转路由 */
function handleLink(id) {
  router.push({
    path: `/application/applied-assess/index/${id}`,
  });
}

/** 终止合同 */
function handleTerminate(row) {
  terminateApplication({ id: row.id }).then((res) => {
    if (res.code === 200) {
      ElMessage({
        type: "success",
        message: "终止成功",
      });
      getList();
    }
  });
}

getJobs();
getList();
</script>
