package com.ruoyi.project.workstudy.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.workstudy.domain.Job;
import com.ruoyi.project.workstudy.service.IJobService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


/**
 * @author leenadz
 * @since 2023-06-23 13:26
 */
@RestController
@RequestMapping("/workstudy/job")
public class JobController extends BaseController {

    private final IJobService jobService;

    public JobController(IJobService jobService) {
        this.jobService = jobService;
    }

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
}
