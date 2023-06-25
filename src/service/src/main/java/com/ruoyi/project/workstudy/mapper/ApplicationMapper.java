package com.ruoyi.project.workstudy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.workstudy.domain.Application;

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
}