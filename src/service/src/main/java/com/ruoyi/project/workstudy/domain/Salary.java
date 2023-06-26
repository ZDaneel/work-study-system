package com.ruoyi.project.workstudy.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author leenadz
 * @since 2023-06-26 15:04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Salary {
    @Excel(name = "部门")
    private String department;
    @Excel(name = "岗位")
    private String jobName;
    @Excel(name = "姓名")
    private String studentName;
    @Excel(name = "学号")
    private String studentId;
    @Excel(name = "手机号")
    private String phone;
    @Excel(name = "合同基本工资")
    private Double baseSalary;
    @Excel(name = "合同绩效工资")
    private Double basePerformanceSalary;
    @Excel(name = "考核得分百分比")
    private String scorePercentage;
    @Excel(name = "标准工作天数")
    private Integer standardDays;
    @Excel(name = "实际工作天数")
    private Integer days;
    @Excel(name = "实际基本工资")
    private String actualBaseSalary;
    @Excel(name = "实际绩效工资")
    private String actualPerformanceSalary;
    @Excel(name = "总工资")
    private String totalSalary;
    /** 绩效计算得分 */
    private Long score;
}
