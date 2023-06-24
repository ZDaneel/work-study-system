package com.ruoyi.project.workstudy.controller;

import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.service.IApplicationService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-24 15:26
 */
@RestController
@RequestMapping("/workstudy/application")
public class ApplicationController {

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
}