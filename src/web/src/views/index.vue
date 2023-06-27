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
              <span>全部生效中的合同数&nbsp</span>
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

    <div
      class="echarts-box"
      style="display: flex; justify-content: center; align-items: center"
    >
      <div
        id="jobIntentionEcharts"
        :style="{ width: '900px', height: '300px' }"
      ></div>
    </div>
  </div>
</template>

<script setup name="Index">
import { listStudent, getStudentIntention } from "@/api/workstudy/student";
import { listAllValidEmployment } from "@/api/workstudy/employment";
import { getAssessmentCount } from "@/api/workstudy/assessment";
import { listApplied } from "@/api/workstudy/application";
import * as echarts from "echarts";
import { onUnmounted } from "vue";
let echart = echarts;

onUnmounted(() => {
  echart.dispose(document.getElementById("jobIntentionEcharts"));
});

const applyStudentNum = ref(0);
const employmentDemandNum = ref(0);
const totalApplicationNum = ref(0);
const lastMonthWaitAssessNum = ref(0);

/** 申请中学生数量 */
function listApplyStudent() {
  listStudent({ status: 0 }).then((res) => {
    if (res.code === 200) {
      applyStudentNum.value = res.total;
    }
  });
}

/** 用工需求数量 */
function listEmploymentDemand() {
  return listAllValidEmployment().then((res) => {
    // 从data的每个类中获取employmentJobs对象数组，再从中获取每个的limitNumber和currentNumber，相减得到总数
    if (res.code === 200) {
      let total = 0;
      res.data.forEach((item) => {
        total += item.employmentJobs.reduce((prev, cur) => {
          return prev + (cur.limitNumber - cur.currentNumber);
        }, 0);
      });
      employmentDemandNum.value = total;
      return res.data;
    }
  });
}

/** 上个月待考核数量 */
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
        if (res.code === 200) {
          lastMonthWaitAssessNum.value = totalApplicationNum.value - res.data;
        }
      });
    }
  });
}
/** 获取上个月的月份，一位则前面补0 */
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

// 获取学生对岗位的意向
function listStudentIntention() {
  return getStudentIntention().then((res) => {
    if (res.code === 200) {
      return res.data;
    }
  });
}

// 基础配置一下Echarts
function initIntentionChart() {
  listStudentIntention().then((studentIntention) => {
    // 获取jobIntentionName和jobIntentionNum分别为x轴和y轴数组
    const jobIntentionName = studentIntention.map(
      (item) => item.jobIntentionName
    );
    const jobIntentionNum = studentIntention.map(
      (item) => item.jobIntentionNum
    );
    // 将studentIntention转换为Echarts需要的格式，即name对应jobIntentionName，value对应jobIntentionNum
    studentIntention = studentIntention.map((item) => {
      return {
        name: item.jobIntentionName,
        value: item.jobIntentionNum,
      };
    });
    let chart = echart.init(
      document.getElementById("jobIntentionEcharts"),
      "white"
    );
    // 把配置和数据放这里
    chart.setOption({
      title: {
        text: "学生岗位意向",
        left: "center",
        top: "center",
      },
      tooltip: {
        // 提示
        trigger: "item", // 触发方式
        formatter: "{a} <br/>{b}: {c} ({d}%)", // 提示的格式
      },
      legend: {
        // 图例
        orient: "horizontal",
        x: "center",
        y: "bottom",
        data: jobIntentionName, // 图例的数据数组
      },
      series: [
        {
          name: "岗位意向",
          type: "pie", // 设置图表类型为饼图
          radius: "50%", // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
          data: studentIntention,
          radius: ["40%", "70%"],
          roseType: 'area'
        },
      ],
    });
    window.onresize = function () {
      //自适应大小
      chart.resize();
    };
  });
}

listApplyStudent();
listEmploymentDemand();
listLastMonthWaitAssess();
initIntentionChart();
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
  font-size: 18px;
}
.red {
  color: var(--el-color-error);
}
</style>
