<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="60px"
    >
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学号" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学院" prop="department">
        <el-select
          v-model="queryParams.department"
          placeholder="请选择学院"
          clearable
        >
          <el-option
            v-for="dict in college"
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
          v-hasPermi="['workstudy:student:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['workstudy:student:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['workstudy:student:remove']"
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
      :data="studentList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
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
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['workstudy:student:edit']"
            >修改</el-button
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

    <!-- 添加或修改学生申请对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form
        ref="studentRef"
        :model="form"
        :rules="rules"
        label-width="100px"
      >
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="学号" prop="studentId">
          <el-input v-model="form.studentId" placeholder="请输入学号" />
        </el-form-item>
        <el-form-item label="联系方式" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系方式" />
        </el-form-item>
        <el-form-item label="学院" prop="department">
          <el-select
            v-model="form.department"
            placeholder="请选择学院"
            clearable
          >
            <el-option
              v-for="dict in college"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="专业班级" prop="major">
          <el-input v-model="form.major" placeholder="请输入专业班级" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio
              v-for="dict in sys_user_sex"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否经济困难" prop="isEcoHard">
          <el-radio-group v-model="form.isEcoHard">
            <el-radio
              v-for="dict in business_yes_no"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否接受分配" prop="isAssignedAccept">
          <el-radio-group v-model="form.isAssignedAccept">
            <el-radio
              v-for="dict in business_yes_no"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="岗位意向" prop="jobIntentions">
          <el-select
            v-model="form.jobIntentions"
            multiple
            filterable
            allow-create
            default-first-option
            :reserve-keyword="false"
            placeholder="请选择岗位意向"
          >
            <el-option
              v-for="item in jobs"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            />
          </el-select>
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

<script setup name="Student">
import {
  listStudent,
  getStudent,
  delStudent,
  addStudent,
  updateStudent,
} from "@/api/workstudy/student";

import { listJob, addJobs } from "@/api/workstudy/job";
import { reactive } from "vue";

const { proxy } = getCurrentInstance();
const { sys_user_sex } = proxy.useDict("sys_user_sex");
const { college } = proxy.useDict("college");
const { business_yes_no } = proxy.useDict("business_yes_no");

const studentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const jobs = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    status: 0,
    name: null,
    studentId: null,
    department: null,
  },
  rules: {
    name: [{ required: true, message: "请输入姓名", trigger: "blur" }],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询学生申请列表 */
function getList() {
  loading.value = true;
  listStudent(queryParams.value).then((response) => {
    studentList.value = response.rows;
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
    name: null,
    studentId: null,
    phone: null,
    department: null,
    major: null,
    sex: null,
    isEcoHard: null,
    isAssignedAccept: null,
    jobIntentions: null,
  };
  proxy.resetForm("studentRef");
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
  title.value = "添加学生申请";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value;
  getStudent(_id).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改学生申请";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["studentRef"].validate((valid) => {
    if (valid) {
      const newJobs = reactive([]);
      const chooseJobs = form.value.jobIntentions;
      const jobNames = jobs.value.map((item) => item.name);
      chooseJobs.forEach((item) => {
        if (!jobNames.includes(item)) {
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
            addOrUpdate();
          });
      } else {
        addOrUpdate();
      }
    }
  });
}

/** 新增或更新 */
function addOrUpdate() {
  if (form.value.id != null) {
    updateStudent(form.value).then((response) => {
      proxy.$modal.msgSuccess("修改成功");
      open.value = false;
      getList();
    });
  } else {
    addStudent(form.value).then((response) => {
      proxy.$modal.msgSuccess("新增成功");
      open.value = false;
      getList();
    });
  }
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal
    .confirm('是否确认删除学生申请编号为"' + _ids + '"的数据项？')
    .then(function () {
      return delStudent(_ids);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}

getList();
getJobs();
</script>
