package com.ruoyi.framework.task;

import com.ruoyi.project.workstudy.service.IEmploymentService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author leenadz
 * @since 2023-06-24 11:26
 */
@Component("wsTask")
public class WorkStudyTask {

    @Resource
    private IEmploymentService employmentService;

    public void handlingExpiredEmployment()
    {
        System.out.println("执行处理过期用工");
        employmentService.handlingExpiredEmployment();
    }
}
