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
 * @since 2023-06-23 13:35
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("job")
public class Job {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
}
