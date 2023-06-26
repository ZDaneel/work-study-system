package com.ruoyi.project.workstudy.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-26 21:53
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AssessmentCountDTO {
    private List<Long> appliedIds;
    private String year;
    private String month;
}
