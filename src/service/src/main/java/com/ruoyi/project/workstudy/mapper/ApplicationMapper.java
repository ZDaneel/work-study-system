package com.ruoyi.project.workstudy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.workstudy.domain.Application;

import java.util.List;

/**
 * @author zdaneel
 */
public interface ApplicationMapper extends BaseMapper<Application> {
    /**
     * 根据id查询合同信息
     * @param id application id
     * @return 合同信息
     */
    Application getContractInfoById(Long id);

    /**
     * 查询合同列表
     * @param application 可能包括状态、jobId和employmentId
     * @return 合同列表
     */
    List<Application> listApplication(Application application);
}