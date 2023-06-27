package com.ruoyi.project.workstudy.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.workstudy.domain.Student;
import com.ruoyi.project.workstudy.service.IStudentService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 学生申请Controller
 * 
 * @author zyc
 * @date 2023-06-22
 */
@RestController
@RequestMapping("/workstudy/student")
public class StudentController extends BaseController
{
    @Autowired
    private IStudentService studentService;

    /**
     * 查询学生申请列表
     */
    @PreAuthorize("@ss.hasPermi('workstudy:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(Student student)
    {
        startPage();
        List<Student> list = studentService.selectStudentList(student);
        return getDataTable(list);
    }

    /**
     * 获取学生申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('workstudy:student:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(studentService.selectStudentById(id));
    }

    /**
     * 新增学生申请
     */
    @PreAuthorize("@ss.hasPermi('workstudy:student:add')")
    @Log(title = "学生申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Student student)
    {
        return toAjax(studentService.insertStudent(student));
    }

    /**
     * 修改学生申请
     */
    @PreAuthorize("@ss.hasPermi('workstudy:student:edit')")
    @Log(title = "学生申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Student student)
    {
        return toAjax(studentService.updateStudent(student));
    }

    /**
     * 删除学生申请
     */
    @PreAuthorize("@ss.hasPermi('workstudy:student:remove')")
    @Log(title = "学生申请", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(studentService.deleteStudentByIds(ids));
    }

    /**
     * 获取所有学生对岗位的意向
     */
    @GetMapping("/intention")
    public AjaxResult getStudentIntention(){
        return success(studentService.getStudentIntention());
    }
}
