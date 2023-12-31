package com.ruoyi.project.workstudy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.workstudy.domain.Application;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Job;
import com.ruoyi.project.workstudy.domain.Student;
import com.ruoyi.project.workstudy.mapper.ApplicationMapper;
import com.ruoyi.project.workstudy.service.IApplicationService;
import com.ruoyi.project.workstudy.service.IEmploymentJobService;
import com.ruoyi.project.workstudy.service.IJobService;
import com.ruoyi.project.workstudy.service.IStudentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author leenadz
 * @since 2023-06-24 15:38
 */
@Service
public class ApplicationServiceImpl extends ServiceImpl<ApplicationMapper, Application> implements IApplicationService {

    @Resource
    private IStudentService studentService;

    @Resource
    private IJobService jobService;

    @Resource
    private IEmploymentJobService employmentJobService;

    @Resource
    private ApplicationMapper applicationMapper;

    /**
     * 比较排序
     * @param o1 学生1
     * @param o2 学生2
     * @return 比较结果
     */
    private static int compareStudent(Student o1, Student o2) {
        if (o1.getScore() > o2.getScore()) {
            return -1;
        } else if (o1.getScore() < o2.getScore()) {
            return 1;
        } else {
            if (o1.getIsEcoHard() == 1 && o2.getIsEcoHard() != 1) {
                return -1;
            } else if (o1.getIsEcoHard() != 1 && o2.getIsEcoHard() == 1) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    /**
     * 1. 过滤：去除岗位意向不一致且不接受分配的接受分配的
     * 2. 计算得分：加权得分，符合则加1分，不符合则加0分
     * 权重
     * - 岗位意向：0.5
     * - 是否经济困难：0.3
     * - 是否接受分配：0.2
     * 3. 排序
     *
     * @param employmentJob 只包括用工计划id和岗位id
     * @return 候选人列表
     */
    @Override
    public List<Student> listCandidate(EmploymentJob employmentJob) {
        List<Student> filterStudentList = studentService.filterStudent(employmentJob);
        computeScore(filterStudentList, getJobId2NameMap().get(employmentJob.getJobId()));
        filterStudentList.sort(ApplicationServiceImpl::compareStudent);
        return filterStudentList;
    }

    /**
     * 添加应聘信息
     * @param application 应聘信息
     * @return 应聘信息id
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Long addApplication(Application application) {
        save(application);
        updateEmploymentJobCurrentNumber(application);
        studentService.update(new LambdaUpdateWrapper<Student>()
                .eq(Student::getId, application.getStudentId())
                .set(Student::getStatus, 1L));
        return application.getId();
    }

    @Override
    public Application getContractInfoById(Long id) {
        return applicationMapper.getContractInfoById(id);
    }

    @Override
    public List<Application> listApplication(Application application) {
        return applicationMapper.listApplication(application);
    }

    private void updateEmploymentJobCurrentNumber(Application application) {
        EmploymentJob employmentJob = employmentJobService.getOne(new LambdaQueryWrapper<EmploymentJob>()
                .eq(EmploymentJob::getJobId, application.getJobId())
                .eq(EmploymentJob::getEmploymentId, application.getEmploymentId()));
        employmentJob.setCurrentNumber(employmentJob.getCurrentNumber() + 1);
        employmentJobService.updateById(employmentJob);
    }

    /**
     * 获取岗位id到岗位名称的映射
     *
     * @return 岗位id到岗位名称的映射
     */
    private Map<Long, String> getJobId2NameMap() {
        List<Job> jobList = jobService.list();
        Map<Long, String> jobId2NameMap = new HashMap<>(8);
        for (Job job : jobList) {
            jobId2NameMap.put(job.getId(), job.getName());
        }
        return jobId2NameMap;
    }

    /**
     * 计算得分
     *
     * @param filterStudentList 过滤后的学生列表
     * @param jobName           岗位名称
     */
    private void computeScore(List<Student> filterStudentList, String jobName) {
        filterStudentList.forEach(student -> {
            double score = 0;
            score = 0;
            // 岗位意向
            if (student.getJobIntentions().contains(jobName)) {
                score += Weight.JOB_INTENTION.getWeight();
            } else {
                // 接受分配
                score += Weight.IS_ACCEPT_ASSIGNMENT.getWeight();
            }
            // 是否经济困难
            if (student.getIsEcoHard() == 1L) {
                score += Weight.IS_ECONOMIC_DIFFICULTY.getWeight();
            }
            student.setScore(score);
        });
    }

    private enum Weight {
        /**
         * 岗位意向
         */
        JOB_INTENTION(0.5),
        /**
         * 是否经济困难
         */
        IS_ECONOMIC_DIFFICULTY(0.3),
        /**
         * 是否接受分配
         */
        IS_ACCEPT_ASSIGNMENT(0.2);

        private final double weight;

        Weight(double weight) {
            this.weight = weight;
        }

        public double getWeight() {
            return weight;
        }
    }
}
