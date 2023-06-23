package com.ruoyi.project.workstudy.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author leenadz
 * @since 2023-06-23 16:04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("student_job")
public class StudentJob {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long studentId;
    private Long jobId;
}
