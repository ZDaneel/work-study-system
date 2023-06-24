package com.ruoyi.project.workstudy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.workstudy.domain.Application;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Student;

import java.util.List;

/**
 * @author leenadz
 * @since 2023-06-24 15:38
 */
public interface IApplicationService extends IService<Application> {
    /**
     * 查询候选人列表
     * @param employmentJob 只包括用工计划id和岗位id
     * @return 候选人列表
     */
    List<Student> listCandidate(EmploymentJob employmentJob);
}
