package com.ruoyi.project.workstudy.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Job;
import com.ruoyi.project.workstudy.service.IEmploymentJobService;
import com.ruoyi.project.workstudy.service.IJobService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * @author leenadz
 * @since 2023-06-23 13:26
 */
@RestController
@RequestMapping("/workstudy/job")
public class JobController extends BaseController {

    @Resource
    private IJobService jobService;

    @Resource
    private IEmploymentJobService employmentJobService;

    @GetMapping("/list")
    public TableDataInfo list() {
        return getDataTable(jobService.list());
    }

    @Log(title = "岗位添加", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<String> jobNames) {
        List<Job> newJobs = new ArrayList<>();
        for (String jobName : jobNames) {
            newJobs.add(Job.builder().name(jobName).build());
        }
        return toAjax(jobService.saveBatch(newJobs));
    }

    /**
     * 获取岗位的数量信息
     */
    @PostMapping(value = "/detail")
    public AjaxResult getInfo(@RequestBody EmploymentJob employmentJob)
    {
        return success(employmentJobService.getOne(new LambdaQueryWrapper<EmploymentJob>()
                .eq(EmploymentJob::getJobId,employmentJob.getJobId())
                .eq(EmploymentJob::getEmploymentId, employmentJob.getEmploymentId())));
    }
}
