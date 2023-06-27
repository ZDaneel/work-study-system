package com.ruoyi.project.workstudy.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.workstudy.domain.EmploymentJob;
import com.ruoyi.project.workstudy.domain.Student;
import com.ruoyi.project.workstudy.domain.dto.JobIntentionDTO;

/**
 * 学生申请Service接口
 * 
 * @author zyc
 * @date 2023-06-22
 */
public interface IStudentService extends IService<Student>
{
    /**
     * 查询学生申请
     * 
     * @param id 学生申请主键
     * @return 学生申请
     */
    public Student selectStudentById(Long id);

    /**
     * 查询学生申请列表
     * 
     * @param student 学生申请
     * @return 学生申请集合
     */
    public List<Student> selectStudentList(Student student);

    /**
     * 新增学生申请
     * 
     * @param student 学生申请
     * @return 结果
     */
    public boolean insertStudent(Student student);

    /**
     * 修改学生申请
     * 
     * @param student 学生申请
     * @return 结果
     */
    public int updateStudent(Student student);

    /**
     * 批量删除学生申请
     * 
     * @param ids 需要删除的学生申请主键集合
     * @return 结果
     */
    public int deleteStudentByIds(Long[] ids);

    /**
     * 删除学生申请信息
     * 
     * @param id 学生申请主键
     * @return 结果
     */
    public int deleteStudentById(Long id);

    /**
     * 过滤：去除岗位意向不一致且不接受分配的接受分配的
     * @param employmentJob 只包括用工计划id和岗位id
     * @return 候选人列表
     */
    public List<Student> filterStudent(EmploymentJob employmentJob);

    /**
     * 获取学生的岗位意向
     * @return 岗位意向列表
     */
    List<JobIntentionDTO> getStudentIntention();
}
