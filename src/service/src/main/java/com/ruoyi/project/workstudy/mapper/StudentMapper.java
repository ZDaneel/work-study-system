package com.ruoyi.project.workstudy.mapper;

import java.util.List;
import com.ruoyi.project.workstudy.domain.Student;

/**
 * 学生申请Mapper接口
 * 
 * @author zyc
 * @date 2023-06-22
 */
public interface StudentMapper 
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
    public int insertStudent(Student student);

    /**
     * 修改学生申请
     * 
     * @param student 学生申请
     * @return 结果
     */
    public int updateStudent(Student student);

    /**
     * 删除学生申请
     * 
     * @param id 学生申请主键
     * @return 结果
     */
    public int deleteStudentById(Long id);

    /**
     * 批量删除学生申请
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentByIds(Long[] ids);
}
