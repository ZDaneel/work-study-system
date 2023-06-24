package com.ruoyi.project.workstudy.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author leenadz
 * @since 2023-06-24 09:32
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmploymentJob {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long employmentId;
    private Long jobId;
    private Integer limitNumber;
    private Integer currentNumber;
    @TableField(exist = false)
    private String jobName;
}
