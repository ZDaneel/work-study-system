package com.ruoyi.project.workstudy.service.impl;

import com.ruoyi.project.workstudy.domain.Salary;
import com.ruoyi.project.workstudy.domain.dto.SalaryExportDTO;
import com.ruoyi.project.workstudy.mapper.SalaryMapper;
import com.ruoyi.project.workstudy.service.ISalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-26 15:19
 */
@Service
public class SalaryServiceImpl implements ISalaryService {

    @Resource
    private SalaryMapper salaryMapper;

    @Override
    public List<Salary> selectSalaryList(SalaryExportDTO salaryExportDTO) {
        List<Salary> salaryList = salaryMapper.selectSalaryList(salaryExportDTO);
        for (Salary salary : salaryList) {
            // 绩效工资 = 得分/100 * 基础绩效工资
            Double performanceSalary = salary.getScore()/100 * salary.getBasePerformanceSalary();
            salary.setPerformanceSalary(performanceSalary);
            // 总工资 = 实际工作天数/标准工作天数 * (基础工资 + 绩效工资)
            Double totalSalary = salary.getDays()/salary.getStandardDays() * (salary.getBaseSalary() + performanceSalary);
            salary.setTotalSalary(totalSalary);
        }
        return salaryList;
    }
}
