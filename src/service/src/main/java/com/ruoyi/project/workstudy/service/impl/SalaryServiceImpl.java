package com.ruoyi.project.workstudy.service.impl;

import com.ruoyi.project.workstudy.domain.Salary;
import com.ruoyi.project.workstudy.domain.dto.SalaryExportDTO;
import com.ruoyi.project.workstudy.mapper.SalaryMapper;
import com.ruoyi.project.workstudy.service.ISalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DecimalFormat;
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
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        for (Salary salary : salaryList) {
            salary.setScorePercentage(String.format("%d%%", salary.getScore()));
            // 实际基础工资 = 实际工作天数/标准工作天数 * 合同基本工资
            Double actualBaseSalary = (double)salary.getDays()/salary.getStandardDays() * salary.getBaseSalary();
            salary.setActualBaseSalary(decimalFormat.format(actualBaseSalary));
            // 实际绩效工资 = 实际工作天数/标准工作天数 * 得分/100 * 基础绩效工资
            Double actualPerformanceSalary = (double)salary.getScore()/100 * salary.getBasePerformanceSalary();
            salary.setActualPerformanceSalary(decimalFormat.format(actualPerformanceSalary));
            // 总工资 = 实际基础工资 + 实际绩效工资
            Double totalSalary = actualBaseSalary + actualPerformanceSalary;
            salary.setTotalSalary(decimalFormat.format(totalSalary));
        }
        return salaryList;
    }
}
