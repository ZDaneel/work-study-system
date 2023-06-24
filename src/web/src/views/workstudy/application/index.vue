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
            @click="handleChoose(scope.row)"
            >选择</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup name="Application">
import { listAllValidEmployment } from "@/api/workstudy/employment";
import { listJob } from "@/api/workstudy/job";
import { reactive } from "vue";

const { proxy } = getCurrentInstance();
const { sys_user_sex } = proxy.useDict("sys_user_sex");
const { college } = proxy.useDict("college");
const { business_yes_no } = proxy.useDict("business_yes_no");

const studentList = ref([]);
const open = ref(false);
const loading = ref(true);
const total = ref(0);
const options = ref([])
const chooseJob = ref(null);

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
  // TODO
  open.value = true;
  loading.value = false;
}

getJobs();
</script>
