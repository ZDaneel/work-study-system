package com.ruoyi.project.workstudy.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author leenadz
 * @since 2023-06-26 15:27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SalaryExportDTO {
    private Long employmentId;
    private Long jobId;
    private Integer status;
    private String year;
    private String month;
}
