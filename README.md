# 高校学生勤工俭学系统  

> 基于[RuoYi-Vue-3](https://github.com/yangzongzhuan/RuoYi-Vue3)和[RuoYi-Vue-fast](https://github.com/yangzongzhuan/RuoYi-Vue-fast)
>
> 环境要求JDK 17+

------

**基本需求：**

高校勤工俭学基金办公室是帮助同学参加高校勤工俭学劳动的机构。人工管理中涉及对大量表格的查找，效率很低，工作人员负担很重，且易出差错。因此，该办公室需求建立一个高效、准确，可以自动生成各种表格和报表的微机管理系统。

**主要功能描述：**

1) 学生申请表和用工计划申请表的录入和存储；
2) 按照用工计划申请表的要求自动列出候选名单；
3) 自动生成应聘合同书；
4) 自动生成酬金发放单；
5) 生成月考核表。

## 一、分析

1.首页：

- 数据可视化
  - 用工需求情况
  - 学生申请情况
  - 待处理的考核数量

2.学生申请：

- 录入学生申请表
  - 包括姓名、学号、联系方式、学院、专业班级、性别、是否经济困难、是否接受分配和岗位
  - 其中的岗位意向能够选择现有的岗位，或者填写新的岗位

- 修改学生信息
- 删除学生信息
- 姓名、学号和学院条件查询学生列表

3.用工计划：

- 录入用工计划申请表
  - 包括部门、内容、开始时间、结束时间和岗位
  - 岗位部分能够控制不同岗位数和岗位需要的学生数量

- 查看用工计划详情
- 删除用工计划
- 部门和状态条件查询用工计划列表
- 到达结束时间自动让用工计划失效

4.应聘候补：

- 员工能够选择岗位自动列出候选名单
- 候选名单中选中学生并填写相关信息，自动生成应聘合同书
  - 信息包括开始时间、结束时间、月标准工作天数、日工作时长、基础工资和绩效工资

5.已聘学生：

- 岗位、状态条件查询已聘学生列表
- 根据条件查询和年月导出酬金发放单
- 点击某个学生的考核操作，进入考核管理页面
- 点击某个学生的终止操作，改变合同的状态

6.考核管理：

- 添加月考核
  - 包括月份、工作天数和得分情况
  - 得分包括技术要求达成率、工作失误率、协作能力、交办事项完成率和工作态度

- 年月查询对应考核信息

## 二、数据库设计

分为学生申请表student、用工计划表employment、岗位表job、学生岗位表student_job、用工岗位表employment_job、应聘表application、月考核表assessment，共7张表

其中的student表和job表是多对多的关系，用中间表student_job

employment表和job表是多对多的关系，用中间表employment_job

application表和student表、job表是一对一的关系，和employment表是多对一的关系

application表和assessment表是一对一的关系

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281413528.png" alt="image-20230628141339439" style="zoom:50%;" />

## 三、详细设计

### 1. 首页

分为两个部分，第一个部分使用卡片形式展示申请中学生数量、用工需求数量和上月待考核数量

- 申请中的学生即状态为0的学生数量
- 用工需求数量即每个用工计划下每个岗位对应的剩余人数之和

- 上月待考核数量即生效中的合同数量-上月已考核数量

第二个部分用圆饼图展示学生对岗位的意向

- 学生对岗位的圆饼图：使用echart，通过student_job表查询出不同job的意向数量，使用group分组实现

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281401470.png" alt="image-20230628140119251" style="zoom:50%;" />

### 2. 学生申请

列表展示

- 搜索条件：学院、专业、学号

- 显示申请中的学生信息，包括姓名、学号、学院、专业班级、性别、联系方式、是否经济困难和是否接受分配

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281402993.png" alt="image-20230628140209757" style="zoom:50%;" />

新增

- 填写学生基础信息，如姓名、学号、联系方式、学院、专业班级、性别、联系方式、是否经济困难和是否接受分配

- 填写岗位意向
  - 需要一个可填写的多选下拉框
  - 填写当前不存在的岗位后，能够将其加入到job表内
  - 将岗位意向的信息添加到student_job表内

- 添加填写规则，如果不符合规则就会提示警告信息

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281403706.png" alt="image-20230628140313539" style="zoom:50%;" />

修改

- 查询当前学生的基础信息和岗位意向
- 填写表单同新增

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281403531.png" alt="image-20230628140345698" style="zoom:50%;" />

删除

- 选中学生进行删除

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281404532.png" alt="image-20230628140442353" style="zoom:50%;" />

### 3. 用工计划

列表展示

- 搜索条件：部门、状态
- 显示用工计划列表，包括部门、内容、开始时间、结束时间和状态

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281405264.png" alt="image-20230628140556438" style="zoom:50%;" />

添加

- 填写用工计划的基础信息，包括部门、内容、开始时间和结束时间
- 动态添加岗位需求
  - 通过+1按钮添加一个岗位需求，通过删除按钮删除一个岗位需求
  - 岗位能够选择系统中存在的，也能够填写一个新的岗位
  - 填写岗位对应的需求人数

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281406116.png" alt="image-20230628140632947" style="zoom:50%;" />

查看详情

- 选中用工计划查看详情，包括部门、内容、开始时间、结束时间和岗位
- 岗位信息包括具体的每个岗位信息，即岗位名称、限制人数和当前人数

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281408856.png" alt="image-20230628140821827" style="zoom:50%;" />

删除

- 选中用工计划删除

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281407199.png" alt="image-20230628140713699" style="zoom:50%;" />

自动结束

- 结束时间后，状态由有效变为无效

使用定时任务，设为`0 0 1 * * ?`，即每天凌晨1点执行一次，扫描所有有效的用工计划，找出结束时间小于当前时间的任务，将其状态设置为0

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281409069.png" alt="image-20230628140950146" style="zoom:50%;" />

### 4. 应聘候选

选择岗位，从而展示候选名单

- 首先查询出生效中的用工计划
- 之后查询其对应的未满的岗位

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281419271.png" alt="image-20230628141920719" style="zoom:50%;" />

生成候选名单

- 显示选择岗位的限制数量和已招聘数量
- 显示候补名单，包括姓名、学号、学院、专业班级、联系方式、是否经济困难、是否接受分配和得分，根据得分高低进行排序

计算得分的候选算法如下：

1. 过滤

即过滤出岗位意向一致或接受分配的在申请学生

2. 计算得分

权重

- 岗位意向：0.5
- 是否经济困难：0.3
- 是否接受分配：0.2

得分：如果岗位匹配，加1分；如果经济困难，加1分；如果接受分配，加1分。否则都为0分

3. 排序

排序规则

- 分数高的在前面
- 分数一样时经济困难的在前面

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281424252.png" alt="image-20230628142447162" style="zoom:50%;" />

填写合同信息

- 选择学生之后，填写相关的信息，包括开始时间、结束时间、月标准工作天数、日工作时长、基础工资和绩效工资
- 生成合同信息
  - 使用easypoi
  - 读取模版信息后替换为填写的合同信息
  - 浏览器自动下载

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281428239.png" alt="image-20230628142816274" style="zoom:50%;" />

模版如下：

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281432026.png" alt="image-20230628143241959" style="zoom:50%;" />

选中信息导出结果如下：

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281431177.png" alt="image-20230628143102990" style="zoom:50%;" />

> 根据模版生成合同
>
> 导出参考：[一行代码搞定简单的word导出](https://developer.aliyun.com/article/634623)
>
> 合同模版参考：[兼职合同书范本](https://www.stefg.org/ImgUpload/files/201410/2014102204121936300.doc)

### 5. 已聘学生

合同列表展示

- 搜索条件：岗位、状态
- 展示部门、岗位、姓名、开始时间、结束时间、月标准工作天数、日工作时长、基础工资、绩效工资和状态

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281434398.png" alt="image-20230628143439099" style="zoom:50%;" />

酬金单生成

- 点击导出酬金发放单后选择月份，之后进行导出操作。


首先需要判断年月、岗位和状态对应的合同是否都完成了考核

计算酬金规则：

- 实际基础工资 = 实际工作天数/标准工作天数 * 合同基本工资

- 实际绩效工资 = 实际工作天数/标准工作天数 * 得分/100 * 基础绩效工资

- 总工资 = 实际基础工资 + 实际绩效工资

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281438629.png" alt="image-20230628143802476" style="zoom:50%;" />

导出酬金发放单如下：包括部门、岗位、姓名、学号、手机号、合同基本工资、合同绩效工资、考核得分百分比、标准工作天数、实际工作天数、实际基本工资、实际绩效工资和总工资

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281451367.png" alt="image-20230628145127856" style="zoom:50%;" />

### 6. 考核

考核页面和应聘学生页面相关，需要点中对应学生的考核按钮才能进入该页面

列表展示

- 搜索条件：年月
- 展示年份、月份、工作天数、技术要求达成率、工作失误率、协作能力、交办事项完成率、工作态度和总分

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281446442.png" alt="image-20230628144613196" style="zoom:50%;" />

添加月考核内容

- 包括年月、本月的工作天数和5个考核项目的分数
- 其中的工作天数会自动填写该合同的月标准工作天数

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281442889.png" alt="image-20230628144229889" style="zoom:50%;" />

导出考核表：

- 选中对应年月的考核信息进行导出
- 使用easyexcel，读取模版后填写选中的考核信息

月考核表模版：

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281448713.png" alt="image-20230628144843743" style="zoom:50%;" />

导出月考核表：

<img src="https://cdn.jsdelivr.net/gh/ZDaneel/cloudimg@main/img/202306281449399.png" alt="image-20230628144907430" style="zoom:50%;" />

> 导出参考：[EasyExcel](https://easyexcel.opensource.alibaba.com/docs/current/quickstart/read)

## 四、不足

没有更完善的酬金管理，如奖金、加班费、罚金等

暂时无岗位管理

## 五、BUG记录

1. ### 分页插件在外键查询下失效

分页插件PageHelper不支持嵌套结果映射，通常发生在一对多、多对多

如使用`<collection>`，解决思路是将原先查询m*n条，转为查询m条，通过其`select`再查询

1. 修改主查询，移除与外键关联表的连接。
2. 创建一个新的SQL查询，以从外键关联表中获取数据。
3. 在`<resultMap>`元素中，使用`<collection>`元素，并通过`select`属性引用新的SQL查询。

> 参考：
>
> [Mybatisplus 分页查询,总数是如何统计的](https://www.cnblogs.com/splyn/p/16392370.html)
>
> [如果Mybatis的ResultMap中存在Collection，分页不正确](https://github.com/pagehelper/Mybatis-PageHelper/issues/185)
