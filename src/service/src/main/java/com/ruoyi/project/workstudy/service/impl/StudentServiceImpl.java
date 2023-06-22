package com.ruoyi.project.workstudy.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.workstudy.mapper.StudentMapper;
import com.ruoyi.project.workstudy.domain.Student;
import com.ruoyi.project.workstudy.service.IStudentService;

/**
 * 学生申请Service业务层处理
 * 
 * @author zyc
 * @date 2023-06-22
 */
@Service
public class StudentServiceImpl implements IStudentService 
{
    @Autowired
    private StudentMapper studentMapper;

    /**
     * 查询学生申请
     * 
     * @param id 学生申请主键
     * @return 学生申请
     */
    @Override
    public Student selectStudentById(Long id)
    {
        return studentMapper.selectStudentById(id);
    }

    /**
     * 查询学生申请列表
     * 
     * @param student 学生申请
     * @return 学生申请
     */
    @Override
    public List<Student> selectStudentList(Student student)
    {
        return studentMapper.selectStudentList(student);
    }

    /**
     * 新增学生申请
     * 
     * @param student 学生申请
     * @return 结果
     */
    @Override
    public int insertStudent(Student student)
    {
        return studentMapper.insertStudent(student);
    }

    /**
     * 修改学生申请
     * 
     * @param student 学生申请
     * @return 结果
     */
    @Override
    public int updateStudent(Student student)
    {
        return studentMapper.updateStudent(student);
    }

    /**
     * 批量删除学生申请
     * 
     * @param ids 需要删除的学生申请主键
     * @return 结果
     */
    @Override
    public int deleteStudentByIds(Long[] ids)
    {
        return studentMapper.deleteStudentByIds(ids);
    }

    /**
     * 删除学生申请信息
     * 
     * @param id 学生申请主键
     * @return 结果
     */
    @Override
    public int deleteStudentById(Long id)
    {
        return studentMapper.deleteStudentById(id);
    }
}
