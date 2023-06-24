package com.ruoyi.project.workstudy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Job;
import com.ruoyi.project.workstudy.domain.StudentJob;
import com.ruoyi.project.workstudy.service.IJobService;
import com.ruoyi.project.workstudy.service.IStudentJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.workstudy.mapper.StudentMapper;
import com.ruoyi.project.workstudy.domain.Student;
import com.ruoyi.project.workstudy.service.IStudentService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 学生申请Service业务层处理
 *
 * @author zyc
 * @date 2023-06-22
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {
    @Resource
    private StudentMapper studentMapper;

    @Resource
    private IStudentJobService studentJobService;

    @Resource
    private IJobService jobService;

    /**
     * 查询学生申请
     *
     * @param id 学生申请主键
     * @return 学生申请
     */
    @Override
    public Student selectStudentById(Long id) {
        return studentMapper.selectStudentById(id);
    }

    /**
     * 查询学生申请列表
     *
     * @param student 学生申请
     * @return 学生申请
     */
    @Override
    public List<Student> selectStudentList(Student student) {
        return studentMapper.selectStudentList(student);
    }

    /**
     * 新增学生申请
     *
     * @param student 学生申请
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public boolean insertStudent(Student student) {
        List<Long> jobIds = jobNames2Ids(student.getJobIntentions(), jobService.list());
        studentMapper.insertStudent(student);

        List<StudentJob> studentJobList = new ArrayList<>();
        for (Long jobId : jobIds) {
            studentJobList.add(StudentJob.builder().studentId(student.getId()).jobId(jobId).build());
        }
        return studentJobService.saveBatch(studentJobList);
    }

    /**
     * 修改学生申请
     *
     * @param student 学生申请
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public int updateStudent(Student student) {
        List<Long> updatedJobIds = jobNames2Ids(student.getJobIntentions(), jobService.list());
        List<StudentJob> studentJobList = studentJobService.list(new LambdaQueryWrapper<StudentJob>()
                .eq(StudentJob::getStudentId, student.getId()));
        // 提取出其中的job的id
        List<Long> oldJobIds = studentJobList.stream()
                .map(StudentJob::getJobId)
                .toList();
        // 首先找出在旧的job id中，但是不在新的job id中的，即需要删除的
        List<Long> needDeleteJobIds = new ArrayList<>();
        for (Long oldJobId : oldJobIds) {
            if (!updatedJobIds.contains(oldJobId)) {
                needDeleteJobIds.add(oldJobId);
            }
        }
        for (Long needDeleteJobId : needDeleteJobIds) {
            studentJobService.remove(new LambdaQueryWrapper<StudentJob>()
                    .eq(StudentJob::getJobId, needDeleteJobId));
        }
        // 然后找出在新的job id中，但是不在旧的job id中的，即需要插入的
        List<Long> needInsertJobIds = new ArrayList<>();
        for (Long updatedJobId : updatedJobIds) {
            if (!oldJobIds.contains(updatedJobId)) {
                needInsertJobIds.add(updatedJobId);
            }
        }
        studentJobService.saveBatch(needInsertJobIds.stream()
                .map(jobId -> StudentJob.builder().studentId(student.getId()).jobId(jobId).build())
                .toList());
        return studentMapper.updateStudent(student);
    }

    /**
     * 批量删除学生申请
     *
     * @param ids 需要删除的学生申请主键
     * @return 结果
     */
    @Override
    public int deleteStudentByIds(Long[] ids) {
        return studentMapper.deleteStudentByIds(ids);
    }

    /**
     * 删除学生申请信息
     *
     * @param id 学生申请主键
     * @return 结果
     */
    @Override
    public int deleteStudentById(Long id) {
        return studentMapper.deleteStudentById(id);
    }

    /**
     * 筛选学生
     *
     * @param employmentJob 只有jobId和employmentId有值
     * @return 符合条件的学生列表
     */
    @Override
    public List<Student> filterStudent(EmploymentJob employmentJob) {
        return studentMapper.filterStudent(employmentJob.getJobId());
    }

    /**
     * 将选中的岗位名字转为id，从而方便插入student_id表
     *
     * @param jobNames 选中的岗位名字
     * @return 选中的岗位id
     */
    private List<Long> jobNames2Ids(List<String> jobNames, List<Job> jobList) {
        Map<String, Long> jobNameToIdMap = new HashMap<>(8);
        for (Job job : jobList) {
            jobNameToIdMap.put(job.getName(), job.getId());
        }

        // 使用映射来查找每个工作名称的ID
        List<Long> jobIds = new ArrayList<>();
        for (String jobName : jobNames) {
            Long jobId = jobNameToIdMap.get(jobName);
            if (jobId != null) {
                jobIds.add(jobId);
            }
        }

        return jobIds;
    }
}
