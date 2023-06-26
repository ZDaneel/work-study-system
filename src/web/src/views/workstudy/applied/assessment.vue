<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
    >
      <el-form-item label="年月" prop="createdTime">
        <el-date-picker
          v-model="queryParams.yearMonth"
          type="month"
          placeholder="选择月份"
          value-format="YYYY-MM"
        />
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
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Close" @click="handleClose"
          >关闭</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="assessmentList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="年份" align="center" prop="year" />
      <el-table-column label="月份" align="center" prop="month" />
      <el-table-column
        label="技术要求达成率"
        width="120"
        align="center"
        prop="techRequireScore"
      />
      <el-table-column
        label="工作失误率"
        align="center"
        prop="workErrorScore"
      />
      <el-table-column
        label="协作能力"
        align="center"
        prop="collaborativeAbilityScore"
      />
      <el-table-column
        label="交办事项完成率"
        width="120"
        align="center"
        prop="assignedCompletionScore"
      />
      <el-table-column
        label="工作态度"
        align="center"
        prop="workingAttitudeScore"
      />
      <el-table-column label="总分" align="center" prop="totalScore" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Download"
            @click="handleExport(scope.row)"
            >导出</el-button
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

    <!-- 添加月考核对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form
        ref="assessmentRef"
        :model="form"
        :rules="rules"
        label-width="180px"
      >
        <el-form-item label="月份" prop="yearMonth">
          <el-date-picker
            v-model="form.yearMonth"
            type="month"
            placeholder="选择月份"
            value-format="YYYY-MM"
          />
        </el-form-item>
        <el-divider />
        <el-descriptions style="margin-left: 15em">
          <el-descriptions-item label="总分">
            <span class="total-score">{{ totalScore }}</span>
          </el-descriptions-item>
        </el-descriptions>
        <el-form-item label="技术要求达成率 25" prop="techRequireScore">
          <el-input-number v-model="form.techRequireScore" :min="0" :max="25" />
        </el-form-item>
        <el-form-item label="工作失误率 20" prop="workErrorScore">
          <el-input-number v-model="form.workErrorScore" :min="0" :max="20" />
        </el-form-item>
        <el-form-item label="协作能力 20" prop="collaborativeAbilityScore">
          <el-input-number
            v-model="form.collaborativeAbilityScore"
            :min="0"
            :max="20"
          />
        </el-form-item>
        <el-form-item label="交办事项完成率 20" prop="assignedCompletionScore">
          <el-input-number
            v-model="form.assignedCompletionScore"
            :min="0"
            :max="20"
          />
        </el-form-item>
        <el-form-item label="工作态度 15" prop="workingAttitudeScore">
          <el-input-number
            v-model="form.workingAttitudeScore"
            :min="0"
            :max="15"
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

<script setup name="Assessment">
import { listAssessment, addAssessment } from "@/api/workstudy/assessment";
import { reactive } from "vue";

const { proxy } = getCurrentInstance();

const assessmentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const title = ref("");
const total = ref(0);
const route = useRoute();
const applicationId = ref(route.params.applicationId);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    yearMonth: null,
    year: null,
    month: null,
    applicationId: applicationId.value,
  },
  rules: null,
});

const { queryParams, form, rules } = toRefs(data);

const totalScore = computed(() => {
  return (
    form.value.techRequireScore +
    form.value.workErrorScore +
    form.value.collaborativeAbilityScore +
    form.value.assignedCompletionScore +
    form.value.workingAttitudeScore
  );
});

/** 查询月考核列表 */
function getList() {
  loading.value = false;
  if (queryParams.value.yearMonth) {
    queryParams.value.year = queryParams.value.yearMonth.split("-")[0];
    queryParams.value.month = queryParams.value.yearMonth.split("-")[1];
  }
  listAssessment(queryParams.value).then((response) => {
    assessmentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    yearMonth: null,
    year: null,
    month: null,
    applicationId: applicationId.value,
    techRequireScore: 25,
    workErrorScore: 20,
    collaborativeAbilityScore: 20,
    assignedCompletionScore: 20,
    workingAttitudeScore: 15,
    totalScore: 100,
  };
  proxy.resetForm("assessmentRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加月考核";
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["assessmentRef"].validate((valid) => {
    if (valid) {
      if (form.value.yearMonth) {
        form.value.year = form.value.yearMonth.split("-")[0];
        form.value.month = form.value.yearMonth.split("-")[1];
      } else {
        proxy.$message.error("请选择月份");
      }
      form.value.totalScore = totalScore.value;
      console.log(form.value);
      addAssessment(form.value).then((response) => {
        if (response.code == 200) {
          proxy.$message.success("添加成功");
          open.value = false;
          getList();
        } else {
          proxy.$message.error(response.msg);
        }
      });
    }
  });
}

/** 返回按钮操作 */
function handleClose() {
  const obj = { path: "/application/applied" };
  proxy.$tab.closeOpenPage(obj);
}

/** 导出按钮操作 */
function handleExport(row) {
  console.log(row);
    proxy.download('workstudy/assessment/export', {
      ...row
    }, `月考核表_${new Date().getTime()}.xlsx`)
}

getList();
</script>

<style>
/* 加粗总分的字体 */
.total-score {
  font-weight: bold;
}
</style>
