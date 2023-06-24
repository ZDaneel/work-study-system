package com.ruoyi.project.workstudy.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.workstudy.domain.Application;
import com.ruoyi.project.workstudy.domain.Employment;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.service.IApplicationService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-24 15:26
 */
@RestController
@RequestMapping("/workstudy/application")
public class ApplicationController extends BaseController {

    @Resource
    private IApplicationService applicationService;

    /**
     * 查询用工计划列表
     */
    @GetMapping("/candidate-list")
    public AjaxResult listCandidate(EmploymentJob employmentJob)
    {
        return AjaxResult.success(applicationService.listCandidate(employmentJob));
    }

    /**
     * 新增应聘信息
     */
    @Log(title = "应聘信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Application application)
    {
        return AjaxResult.success(applicationService.addApplication(application));
    }

    /**
     * 导出合同
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, Application application) {

//        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//        response.setCharacterEncoding("utf-8");
//        wb.write(response.getOutputStream());
    }
}