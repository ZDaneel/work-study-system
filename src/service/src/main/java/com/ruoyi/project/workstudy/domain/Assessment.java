package com.ruoyi.project.workstudy.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * assessment
 * @author zyc
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Assessment {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 年份
     */
    private String year;

    /**
     * 月份
     */
    private String month;

    /**
     * 合同id
     */
    private Long applicationId;

    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     * 更新时间
     */
    private Date updatedTime;

    /**
     * 技术要求达成率
     */
    private Long techRequireScore;

    /**
     * 工作失误率
     */
    private Long workErrorScore;

    /**
     * 协作能力
     */
    private Long collaborativeAbilityScore;

    /**
     * 交办事项完成率
     */
    private Long assignedCompletionScore;

    /**
     * 工作态度
     */
    private Long workingAttitudeScore;

    /**
     * 总分
     */
    private Long totalScore;

    /**
     * 工作天数
     */
    private Integer days;
}