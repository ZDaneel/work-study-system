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
    @Excel(name = "基本工资")
    private Double baseSalary;
    @Excel(name = "绩效工资")
    private Double performanceSalary;
    @Excel(name = "总工资")
    private Double totalSalary;
    /** 基本绩效工资 */
    private Double basePerformanceSalary;
    /** 绩效计算得分 */
    private Long score;
    /** 标准工作天数 */
    private Integer standardDays;
    /** 实际工作天数 */
    private Integer days;
}
