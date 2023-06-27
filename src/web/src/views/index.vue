<template>
  <div class="app-container">
    <el-row
      :gutter="16"
      class="outer-row"
      style="display: flex; justify-content: center"
    >
      <!-- 左边列显示上月待考核数量 -->
      <el-col
        :span="12"
        style="
          text-align: center;
          display: flex;
          justify-content: center;
          align-items: center;
        "
      >
        <div class="statistic-card">
          <el-statistic :value="lastMonthWaitAssessNum">
            <template #title>
              <div class="statistic-title">上月待考核数量</div>
            </template>
          </el-statistic>
          <div class="statistic-footer">
            <div class="footer-item">
              <span>全部生效中的合同数</span>
              <span class="green">{{ totalApplicationNum }}</span>
            </div>
          </div>
        </div>
      </el-col>

      <!-- 右边列分为两行显示申请中学生数量和用工需求数量 -->
      <el-col :span="12">
        <el-row :gutter="16">
          <!-- 上面的行显示申请中学生数量 -->
          <el-col :span="24" style="text-align: center">
            <div class="statistic-card">
              <el-statistic :value="applyStudentNum">
                <template #title>
                  <div class="statistic-title">申请中学生数量</div>
                </template>
              </el-statistic>
            </div>
          </el-col>
          <!-- 下面的行显示用工需求数量 -->
          <el-col :span="24" style="text-align: center">
            <div class="statistic-card">
              <el-statistic :value="employmentDemandNum">
                <template #title>
                  <div class="statistic-title">用工需求数量</div>
                </template>
              </el-statistic>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>

    <el-divider />
  </div>
</template>

<script setup name="Index">
import { listStudent } from "@/api/workstudy/student";
import { listAllValidEmployment } from "@/api/workstudy/employment";
import { getAssessmentCount } from "@/api/workstudy/assessment";
import { listApplied } from "@/api/workstudy/application";

const applyStudentNum = ref(0);
const employmentDemandNum = ref(0);
const totalApplicationNum = ref(0);
const lastMonthWaitAssessNum = ref(0);

function listApplyStudent() {
  listStudent({ status: 0 }).then((res) => {
    if (res.code === 200) {
      applyStudentNum.value = res.total;
    }
  });
}

function listEmploymentDemand() {
  listAllValidEmployment().then((res) => {
    // 从data的每个类中获取employmentJobs对象数组，再从中获取每个的limitNumber和currentNumber，相减得到总数
    if (res.code === 200) {
      let total = 0;
      res.data.forEach((item) => {
        total += item.employmentJobs.reduce((prev, cur) => {
          return prev + (cur.limitNumber - cur.currentNumber);
        }, 0);
      });
      employmentDemandNum.value = total;
    }
  });
}

function listLastMonthWaitAssess() {
  listApplied({ status: 1 }).then((res) => {
    if (res.code === 200) {
      totalApplicationNum.value = res.total;
      const appliedIds = res.rows.map((item) => item.id);
      const params = {
        appliedIds,
        year: new Date().getFullYear(),
        month: getPreviousMonth(),
      };
      getAssessmentCount(params).then((res) => {
        console.log(res);
        if (res.code === 200) {
          lastMonthWaitAssessNum.value = totalApplicationNum.value - res.data;
        }
      });
    }
  });
}

function getPreviousMonth() {
  const today = new Date();
  let lastMonth = today.getMonth(); // getMonth() 返回的月份是0-11
  if (lastMonth === 0) {
    // 当前月份是1月，上个月是12月
    lastMonth = 12;
  } else {
    lastMonth = lastMonth.toString().padStart(2, "0"); // 如果是一位数，在前面添加0
  }
  return lastMonth;
}

listApplyStudent();
listEmploymentDemand();
listLastMonthWaitAssess();
</script>

<style scoped>
:global(h2#card-usage ~ .example .example-showcase) {
  background-color: var(--el-fill-color) !important;
}

.el-statistic {
  --el-statistic-content-font-size: 30px;
}

.statistic-card {
  height: 60%;
  padding: 20px;
  border-radius: 4px;
  background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
  text-align: center;
  font-size: 15px;
  color: var(--el-text-color-regular);
  margin-top: 16px;
}

.statistic-title {
  display: inline-flex;
  align-items: center;
  font-size: 20px;
}

.green {
  color: var(--el-color-success);
}
.red {
  color: var(--el-color-error);
}
</style>
