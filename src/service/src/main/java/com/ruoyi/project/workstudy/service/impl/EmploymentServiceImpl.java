package com.ruoyi.project.workstudy.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Job;
import com.ruoyi.project.workstudy.service.IEmploymentJobService;
import com.ruoyi.project.workstudy.service.IJobService;
import org.springframework.stereotype.Service;
import com.ruoyi.project.workstudy.mapper.EmploymentMapper;
import com.ruoyi.project.workstudy.domain.Employment;
import com.ruoyi.project.workstudy.service.IEmploymentService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 用工计划Service业务层处理
 *
 * @author zyc
 * @date 2023-06-23
 */
@Service
public class EmploymentServiceImpl extends ServiceImpl<EmploymentMapper, Employment> implements IEmploymentService {
    @Resource
    private EmploymentMapper employmentMapper;

    @Resource
    private IJobService jobService;

    @Resource
    private IEmploymentJobService employmentJobService;

    /**
     * 查询用工计划
     *
     * @param id 用工计划主键
     * @return 用工计划
     */
    @Override
    public Employment selectEmploymentById(Long id) {
        return employmentMapper.selectEmploymentById(id);
    }

    /**
     * 查询用工计划列表
     *
     * @param employment 用工计划
     * @return 用工计划
     */
    @Override
    public List<Employment> selectEmploymentList(Employment employment) {
        return employmentMapper.selectEmploymentList(employment);
    }

    /**
     * 新增用工计划
     * 1. 首先添加employment，获得employmentId
     * 2. 其次查询job，获得对应的jobId和jobName
     * 3. 再添加employmentJobs
     *
     * @param employment 用工计划
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertEmployment(Employment employment) {
        employmentMapper.insertEmployment(employment);
        List<EmploymentJob> employmentJobs = employment.getEmploymentJobs();
        Map<String, Long> jobNameToIdMap = getJobNameIdMap(employmentJobs);
        for (EmploymentJob employmentJob : employmentJobs) {
            Long jobId = jobNameToIdMap.get(employmentJob.getJobName());
            employmentJob.setJobId(jobId);
            employmentJob.setEmploymentId(employment.getId());
        }
        return employmentJobService.saveBatch(employmentJobs);
    }

    /**
     * 获取jobName和jobId的映射
     *
     * @param employmentJobs 用工计划工作列表(只有jobName和limitNumber)
     * @return jobName和jobId的映射
     */
    private Map<String, Long> getJobNameIdMap(List<EmploymentJob> employmentJobs) {
        List<String> jobNames = employmentJobs.stream()
                .map(EmploymentJob::getJobName)
                .toList();
        List<Job> jobList = jobService.list(
                new LambdaQueryWrapper<Job>()
                        .in(Job::getName, jobNames)
        );
        return jobList.stream()
                .collect(Collectors.toMap(Job::getName, Job::getId));
    }

    /**
     * 修改用工计划
     *
     * @param employment 用工计划
     * @return 结果
     */
    @Override
    public int updateEmployment(Employment employment) {
        return employmentMapper.updateEmployment(employment);
    }

    /**
     * 批量删除用工计划
     *
     * @param ids 需要删除的用工计划主键
     * @return 结果
     */
    @Override
    public int deleteEmploymentByIds(Long[] ids) {
        return employmentMapper.deleteEmploymentByIds(ids);
    }

    /**
     * 删除用工计划信息
     *
     * @param id 用工计划主键
     * @return 结果
     */
    @Override
    public int deleteEmploymentById(Long id) {
        return employmentMapper.deleteEmploymentById(id);
    }

    /**
     * 1.获取当前的日期
     * 2.查询所有状态为1且结束日期小于当前日期的用工
     * 3.将状态改为0
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void handlingExpiredEmployment() {
        LocalDate currentDate = LocalDate.now();
        List<Employment> employmentList = list(
                new LambdaQueryWrapper<Employment>()
                        .eq(Employment::getStatus, 1)
                        .lt(Employment::getEndTime, currentDate)
                        .select(Employment::getId, Employment::getStatus)
        );
        for (Employment employment : employmentList) {
            employment.setStatus(0L);
        }
        updateBatchById(employmentList);
    }

    /**
     * 查询所有有效的用工计划和未满人数的岗位
     * @return 符合的用工计划列表
     */
    @Override
    public List<Employment> listAllValidEmployments() {
        return employmentMapper.listAllValidEmployments();
    }

    /**
     * 查询所有用工计划和未满人数的岗位
     * @return 所有用工计划列表
     */
    @Override
    public List<Employment> listAllEmployments() {
        return employmentMapper.listValidEmployments();
    }
}
