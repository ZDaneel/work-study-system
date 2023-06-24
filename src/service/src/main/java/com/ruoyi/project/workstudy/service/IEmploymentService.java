package com.ruoyi.project.workstudy.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.workstudy.domain.Employment;

/**
 * 用工计划Service接口
 * 
 * @author zyc
 * @date 2023-06-23
 */
public interface IEmploymentService extends IService<Employment>
{
    /**
     * 查询用工计划
     * 
     * @param id 用工计划主键
     * @return 用工计划
     */
    public Employment selectEmploymentById(Long id);

    /**
     * 查询用工计划列表
     * 
     * @param employment 用工计划
     * @return 用工计划集合
     */
    public List<Employment> selectEmploymentList(Employment employment);

    /**
     * 新增用工计划
     * 
     * @param employment 用工计划
     * @return 结果
     */
    public boolean insertEmployment(Employment employment);

    /**
     * 修改用工计划
     * 
     * @param employment 用工计划
     * @return 结果
     */
    public int updateEmployment(Employment employment);

    /**
     * 批量删除用工计划
     * 
     * @param ids 需要删除的用工计划主键集合
     * @return 结果
     */
    public int deleteEmploymentByIds(Long[] ids);

    /**
     * 删除用工计划信息
     * 
     * @param id 用工计划主键
     * @return 结果
     */
    public int deleteEmploymentById(Long id);

    /**
     * 处理过期用工
     */
    public void handlingExpiredEmployment();
}
