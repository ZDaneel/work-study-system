<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="部门" prop="department">
        <el-input
          v-model="queryParams.department"
          placeholder="请输入部门"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择是否生效"
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
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['workstudy:employment:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['workstudy:employment:remove']"
          >删除</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="employmentList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="部门" align="center" prop="department" />
      <el-table-column label="内容" align="center" prop="content" />
      <el-table-column
        label="开始时间"
        align="center"
        prop="startTime"
        width="180"
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.startTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="结束时间"
        align="center"
        prop="endTime"
        width="180"
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.endTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
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
            icon="More"
            @click="handleDetail(scope.row)"
            v-hasPermi="['workstudy:employment:edit']"
            >详情</el-button
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

    <!-- 用工计划详情 -->
    <el-dialog
      title="用工计划详情"
      v-model="openDetail"
      width="750px"
      append-to-body
      class="detail-dialog"
    >
      <el-descriptions column="1" border>
        <el-descriptions-item label="部门">
          <span class="detail-content">{{ formDetail.department }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="内容">
          <span class="detail-content">{{ formDetail.content }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="开始时间">
          <span class="detail-content">{{ formDetail.startTime }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="结束时间">
          <span class="detail-content">{{ formDetail.endTime }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="岗位" class="job-section">
          <div
            v-for="(employmentJob, index) in formDetail.employmentJobs"
            :key="employmentJob.key"
            class="job-item"
          >
            <strong>岗位{{ 1 + index }}:</strong> {{ employmentJob.jobName }}
            <br />
            <strong>限制人数:</strong> {{ employmentJob.limitNumber }}
            <br />
            <strong>当前人数:</strong> {{ employmentJob.currentNumber }}
          </div>
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>

    <!-- 添加用工计划对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form
        ref="employmentRef"
        :model="form"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item label="部门" prop="department">
          <el-input v-model="form.department" placeholder="请输入部门" />
        </el-form-item>
        <el-form-item label="内容">
          <el-input v-model="form.content" placeholder="请输入内容" />
        </el-form-item>
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
        <br />
        <h3>岗位</h3>
        <el-form-item
          v-for="(employmentJob, index) in form.employmentJobs"
          :label="'岗位' + (1 + index)"
          :key="employmentJob.key"
          :prop="'employmentJobs.' + index + '.jobName'"
          :rules="[
            { required: true, message: '请输入岗位名称', trigger: 'blur' },
          ]"
        >
          <el-select
            v-model="employmentJob.jobName"
            filterable
            allow-create
            default-first-option
            :reserve-keyword="false"
            placeholder="请选择岗位"
          >
            <el-option
              v-for="item in jobs"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            />
          </el-select>
          <el-input-number v-model="employmentJob.limitNumber" :min="1" />
          <el-button @click.prevent="removeForm(employmentJob)">删除</el-button>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="success" @click="add(1)">+1</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Employment">
import {
  listEmployment,
  getEmployment,
  delEmployment,
  addEmployment,
  updateEmployment,
} from "@/api/workstudy/employment";

import { listJob, addJobs } from "@/api/workstudy/job";

const { proxy } = getCurrentInstance();
const { business_effective } = proxy.useDict("business_effective");

const employmentList = ref([]);
const open = ref(false);
const openDetail = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const jobs = ref([]);
const formDetail = ref({});

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    department: null,
    status: null,
  },
  rules: {},
});

const { queryParams, form, rules } = toRefs(data);

/** 查询用工计划列表 */
function getList() {
  loading.value = true;
  listEmployment(queryParams.value).then((response) => {
    employmentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 获取岗位列表 */
function getJobs() {
  return listJob().then((response) => {
    jobs.value = response.rows;
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
    department: null,
    content: null,
    startTime: null,
    endTime: null,
    status: null,
    employmentJobs: [],
  };
  proxy.resetForm("employmentRef");
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
  title.value = "添加用工计划";
}

/** 详情按钮操作 */
function handleDetail(row) {
  reset();
  const _id = row.id;
  getEmployment(_id).then((response) => {
    formDetail.value = response.data;
    console.log(formDetail.value);
    openDetail.value = true;
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["employmentRef"].validate((valid) => {
    if (valid) {
      console.log(form.value.employmentJobs);
      const newJobs = reactive([]);
      const jobNames = jobs.value.map((item) => item.name);
      form.value.employmentJobs.forEach((item) => {
        if (!jobNames.includes(item.jobName)) {
          newJobs.push(item);
        }
      });
      if (newJobs.length > 0) {
        addJobs(newJobs)
          .then(() => {
            return getJobs();
          })
          .then(() => {
            // 只有新增岗位成功后才能新增或修改学生申请
            insert();
          });
      } else {
        insert();
      }
    }
  });
}

/** 新增或更新 */
function insert() {
  // 判断开始时间是否大于结束时间
  if (form.value.startTime > form.value.endTime) {
    proxy.$modal.msgError("开始时间不能大于结束时间");
    return;
  }
  addEmployment(form.value).then((response) => {
    proxy.$modal.msgSuccess("新增成功");
    open.value = false;
    getList();
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal
    .confirm('是否确认删除用工计划编号为"' + _ids + '"的数据项？')
    .then(function () {
      return delEmployment(_ids);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}
/** 表单添加 */
function add(num) {
  for (let i = 0; i < num; i++) {
    form.value.employmentJobs.push({ jobName: "", limitNumber: 0 });
  }
}
/* 表单删除一行 */
function removeForm(item) {
  let index = form.value.employmentJobs.indexOf(item);
  if (index !== -1) {
    form.value.employmentJobs.splice(index, 1);
  }
}

getList();
getJobs();
</script>

<style scoped>
.detail-dialog {
  padding: 20px;
}

.detail-content {
  font-size: 14px;
  color: #333;
}

.job-section {
  background-color: #f9f9f9;
  padding: 10px;
  border-radius: 5px;
}

.job-item {
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.job-item:last-child {
  border-bottom: none;
}
</style>
