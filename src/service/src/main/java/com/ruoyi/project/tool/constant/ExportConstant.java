package com.ruoyi.project.tool.constant;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author leenadz
 * @since 2023-06-25 16:44
 */
@Data
@Component
public class ExportConstant {
    @Value("${export.laborContract.templatePath}")
    private String laborContractTemplatePath;

    @Value("${export.laborContract.tempDir}")
    private String laborContractTempDir;

    @Value("${export.laborContract.tempFileName}")
    private String laborContractTempFileName;

    @Value("${export.assessment.templatePath}")
    private String assessmentTemplatePath;

    @Value("${export.assessment.tempFileName}")
    private String assessmentTempFileName;
}
