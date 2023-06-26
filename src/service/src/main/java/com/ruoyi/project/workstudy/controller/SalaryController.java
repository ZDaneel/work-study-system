package com.ruoyi.project.workstudy.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.workstudy.domain.Salary;
import com.ruoyi.project.workstudy.domain.dto.SalaryExportDTO;
import com.ruoyi.project.workstudy.service.ISalaryService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-26 15:16
 */
@RestController
@RequestMapping("workstudy/salary")
public class SalaryController extends BaseController {

    @Resource
    private ISalaryService salaryService;

    /**
     * 导出酬金单
     */
    @Log(title = "酬金单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SalaryExportDTO salaryExportDTO)
    {
        List<Salary> list = salaryService.selectSalaryList(salaryExportDTO);
        ExcelUtil<Salary> util = new ExcelUtil<>(Salary.class);
        util.exportExcel(response, list, "酬金发放单");
    }
}
