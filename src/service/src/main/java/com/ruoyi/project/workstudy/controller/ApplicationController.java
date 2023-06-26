package com.ruoyi.project.workstudy.controller;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.tool.constant.ExportConstant;
import com.ruoyi.project.tool.utils.WordUtil;
import com.ruoyi.project.workstudy.domain.Application;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.service.IApplicationService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author leenadz
 * @since 2023-06-24 15:26
 */
@RestController
@RequestMapping("/workstudy/application")
public class ApplicationController extends BaseController {

    @Resource
    private IApplicationService applicationService;

    @Resource
    private ExportConstant exportConstant;

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
    public void export(HttpServletResponse response, HttpServletRequest request, Application applicationOnlyId) {
        String templatePath = exportConstant.getLaborContractTemplatePath();
        String tempDir = exportConstant.getLaborContractTempDir();
        String fileName = exportConstant.getLaborContractTempFileName();
        Map<String, Object> params = new HashMap<>(8);
        Application application = applicationService.getContractInfoById(applicationOnlyId.getId());
        params.put("partA", application.getEmploymentPartyA());
        params.put("partB", application.getStudentName());
        params.put("job", application.getJobName());
        params.put("standardDays", application.getStandardDays());
        params.put("hours", application.getHours());
        params.put("baseSalary", application.getBaseSalary());
        params.put("performanceSalary", application.getPerformanceSalary());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
        params.put("startDate", formatter.format(application.getStartTime()));
        params.put("endDate", formatter.format(application.getEndTime()));
        WordUtil.exportWord(templatePath, tempDir, fileName, params, request, response);
    }

    /**
     * 查询合同列表
     */
    @GetMapping("/applied-list")
    public TableDataInfo list(Application application)
    {
        startPage();
        List<Application> list = applicationService.listApplication(application);
        return getDataTable(list);
    }

    /**
     * 获取合同详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(applicationService.getById(id));
    }

    /**
     * 终止合同
     */
    @Log(title = "终止合同", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult terminate(@RequestBody Application application)
    {
        return toAjax(applicationService.update(new LambdaUpdateWrapper<Application>()
                .eq(Application::getId, application.getId())
                .set(Application::getStatus, 0)));
    }
}