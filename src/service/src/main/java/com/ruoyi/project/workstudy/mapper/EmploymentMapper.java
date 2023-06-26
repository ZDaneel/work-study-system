package com.ruoyi.project.workstudy.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.workstudy.domain.Employment;
import com.ruoyi.project.workstudy.domain.EmploymentJob;

/**
 * 用工计划Mapper接口
 * 
 * @author zyc
 * @date 2023-06-23
 */
public interface EmploymentMapper extends BaseMapper<Employment>
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
    public int insertEmployment(Employment employment);

    /**
     * 修改用工计划
     * 
     * @param employment 用工计划
     * @return 结果
     */
    public int updateEmployment(Employment employment);

    /**
     * 删除用工计划
     * 
     * @param id 用工计划主键
     * @return 结果
     */
    public int deleteEmploymentById(Long id);

    /**
     * 批量删除用工计划
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEmploymentByIds(Long[] ids);

    /**
     * 查询所有有效的用工计划
     * @return 用工计划列表
     */
    public List<Employment> listAllValidEmployments();

    /**
     * 查询所有用工计划
     * @return 用工计划列表
     */
    public List<Employment> listValidEmployments();

    /**
     * 查询用工计划下的岗位(拆分嵌套映射解决分页插件问题)
     * @param id employmentId
     * @return 岗位列表
     */
    public List<EmploymentJob> selectEmploymentJobs(Long id);
}
