package com.ruoyi.project.workstudy.domain;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 学生申请对象 student
 * 
 * @author zyc
 * @date 2023-06-22
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Student
{
    /** id */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 学院 */
    @Excel(name = "学院")
    private String department;

    /** 专业班级 */
    @Excel(name = "专业班级")
    private String major;

    /** 性别 */
    @Excel(name = "性别")
    private Long sex;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedTime;

    /** 0-申请中 1-已聘用 2-已结束 */
    @Excel(name = "状态")
    private Long status;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 0-不是 1-是 */
    @Excel(name = "是否经济困难")
    private Long isEcoHard;

    /** 0-不接受 1-接受 */
    @Excel(name = "是否接受分配")
    private Long isAssignedAccept;

    /** 岗位意向 */
    @TableField(exist = false)
    private List<String> jobIntentions;

    /** 最终得分 */
    @TableField(exist = false)
    private Double score;
}
