package com.ruoyi.project.workstudy.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author leenadz
 * @since 2023-06-27 15:29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class JobIntentionDTO {
    private String jobIntentionName;
    private Integer jobIntentionNum;
}
