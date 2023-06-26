package com.ruoyi.project.workstudy.mapper;

import com.ruoyi.project.workstudy.domain.Salary;
import com.ruoyi.project.workstudy.domain.dto.SalaryExportDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-26 15:18
 */

public interface SalaryMapper {

    /**
     * 查询工资列表
     * @param salaryExportDTO 查询条件
     * @return 工资列表
     */
    List<Salary> selectSalaryList(SalaryExportDTO salaryExportDTO);
}
