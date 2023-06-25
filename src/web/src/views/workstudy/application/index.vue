<template>
  <div class="app-container">
    <el-form :inline="true" label-width="60px">
      <el-form-item label="岗位">
        <el-cascader filterable v-model="chooseJob" :options="options" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleGenerate"
          >生成候选名单</el-button
        >
      </el-form-item>
    </el-form>

    <el-row v-if="open" style="margin: 1em;">
      岗位限制数量：{{chooseJobDetail.limitNumber}}
      <br />
      岗位当前已招聘人数：{{chooseJobDetail.currentNumber}} 
    </el-row>

    <el-table v-loading="loading" :data="studentList" v-if="open">
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="学号" align="center" prop="studentId" />
      <el-table-column label="学院" align="center" prop="department">
        <template #default="scope">
          <dict-tag :options="college" :value="scope.row.department" />
        </template>
      </el-table-column>
      <el-table-column label="专业班级" align="center" prop="major" />
      <el-table-column label="性别" align="center" prop="sex">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.sex" />
        </template>
      </el-table-column>
      <el-table-column label="联系方式" align="center" prop="phone" />
      <el-table-column label="是否经济困难" align="center" prop="isEcoHard">
        <template #default="scope">
          <dict-tag :options="business_yes_no" :value="scope.row.isEcoHard" />
        </template>
      </el-table-column>
      <el-table-column
        label="是否接受分配"
        align="center"
        prop="isAssignedAccept"
      >
        <template #default="scope">
          <dict-tag
            :options="business_yes_no"
            :value="scope.row.isAssignedAccept"
          />
        </template>
      </el-table-column>
      <el-table-column label="得分" align="center" prop="score" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Aim"
            @click="handleChoose(scope.row)"
            >选择</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <!-- 填写应聘合同信息 -->
    <el-dialog
      title="填写合同信息"
      v-model="openDialog"
      width="500px"
      append-to-body
    >
      <el-form ref="applicationRef" :model="form" label-width="120px">
        <el-form-item label="开始时间" prop="startTime">
          <el-date-picker
            clearable
            v-model="form.startTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择开始时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker
            clearable
            v-model="form.endTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择结束时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="日工作时长" prop="hours">
          <el-input-number v-model="form.hours" :min="1" :max="4" />
        </el-form-item>
        <el-form-item label="基础工资" prop="baseSalary">
          <el-input-number
            v-model="form.baseSalary"
            :precision="1"
            :step="100"
          />
        </el-form-item>
        <el-form-item label="绩效工资" prop="performanceSalary">
          <el-input-number
            v-model="form.performanceSalary"
            :precision="1"
            :step="100"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Application">
import { listAllValidEmployment } from "@/api/workstudy/employment";
import { listCandidate, addApplication } from "@/api/workstudy/application";
import { getJobDetail } from "@/api/workstudy/job";
import { reactive } from "vue";

const { proxy } = getCurrentInstance();
const { sys_user_sex } = proxy.useDict("sys_user_sex");
const { college } = proxy.useDict("college");
const { business_yes_no } = proxy.useDict("business_yes_no");

const studentList = ref([]);
const open = ref(false);
const openDialog = ref(false);
const loading = ref(true);
const options = ref([]);
const chooseJob = ref(null);
const chooseJobDetail = ref(null);

const data = reactive({
  form: {},
});

const { queryParams, form } = toRefs(data);

/** 获取用工计划和岗位列表 */
function getJobs() {
  listAllValidEmployment().then((res) => {
    if (res.code === 200) {
      const employmentJobs = res.data;
      options.value = employmentJobs.map((item) => ({
        value: item.id,
        label: item.content,
        children: item.employmentJobs.map((job) => ({
          value: job.jobId,
          label: job.jobName,
        })),
      }));
    }
  });
}

/** 处理候选名单的生成 */
function handleGenerate() {
  if (!chooseJob.value) {
    return;
  }
  const [employmentId, jobId] = chooseJob.value;
  getJobDetail({
    employmentId,
    jobId,
  }).then((res) => {
    if (res.code === 200) {
      chooseJobDetail.value = res.data; 
    }
  });
  listCandidate({
    employmentId,
    jobId,
  }).then((res) => {
    if (res.code === 200) {
      studentList.value = res.data;
      open.value = true;
      loading.value = false;
    }
  });
}

/** 处理选择 */
function handleChoose(row) {
  reset();
  form.value.studentId = row.id;
  form.value.employmentId = chooseJob.value[0];
  form.value.jobId = chooseJob.value[1];
  openDialog.value = true;
}

// 取消按钮
function cancel() {
  openDialog.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    studentId: null,
    employmentId: null,
    jobId: null,
    startTime: null,
    endTime: null,
    hours: null,
    baseSalary: null,
    performanceSalary: null,
  };
  proxy.resetForm("applicationRef");
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["applicationRef"].validate((valid) => {
    if (valid) {
      addApplication(form.value).then((res) => {
        if (res.code === 200) {
          proxy.$message.success("添加成功");
          openDialog.value = false;
          handleGenerate();
          const applicationId = res.data;
          // 下载合同
          handleExport(applicationId);
        }
      });
    }
  });
}

/** 导出合同书 */
function handleExport(applicationId) {
  proxy.download(
    "workstudy/application/export",
    {
      id: applicationId,
    },
    `劳动合同书_${new Date().getTime()}.docx`
  );
}

getJobs();
</script>
