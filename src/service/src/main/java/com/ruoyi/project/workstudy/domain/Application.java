package com.ruoyi.project.workstudy.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * application
 * @author zyc
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Application {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 学生id
     */
    private Long studentId;


    /**
     * 用工计划id
     */
    private Long employmentId;

    /**
     * 岗位id
     */
    private Integer jobId;

    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     * 更新时间
     */
    private Date updatedTime;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 工作时长
     */
    private Integer hours;

    /**
     * 基础工资
     */
    private Double baseSalary;

    /**
     * 绩效工资
     */
    private Double performanceSalary;

    /**
     * 状态 0-失效 1-生效 
     */
    private Long status;
}