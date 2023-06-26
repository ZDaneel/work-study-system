package com.ruoyi.project.workstudy.service;

import com.ruoyi.project.workstudy.domain.Salary;
import com.ruoyi.project.workstudy.domain.dto.SalaryExportDTO;

import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-26 15:18
 */
public interface ISalaryService {
    /**
     * 查询酬金发放单列表
     * @param salaryExportDTO 查询条件
     * @return 酬金发放单列表
     */
    List<Salary> selectSalaryList(SalaryExportDTO salaryExportDTO);
}
