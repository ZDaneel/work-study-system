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
import com.ruoyi.project.workstudy.domain.Employment;
import com.ruoyi.project.workstudy.service.IEmploymentService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 用工计划Controller
 * 
 * @author zyc
 * @date 2023-06-23
 */
@RestController
@RequestMapping("/workstudy/employment")
public class EmploymentController extends BaseController
{
    @Autowired
    private IEmploymentService employmentService;

    /**
     * 查询用工计划列表
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Employment employment)
    {
        startPage();
        List<Employment> list = employmentService.selectEmploymentList(employment);
        return getDataTable(list);
    }

    /**
     * 查询所有有效的用工计划和岗位列表
     */
    @GetMapping("/list-all-valid")
    public AjaxResult listAllValidEmployments(){
        return AjaxResult.success(employmentService.listAllValidEmployments());
    }

    /**
     * 查询所有用工计划和岗位列表
     */
    @GetMapping("/list-all")
    public AjaxResult listAllEmployments(){
        return AjaxResult.success(employmentService.listAllEmployments());
    }

    /**
     * 导出用工计划列表
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:export')")
    @Log(title = "用工计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Employment employment)
    {
        List<Employment> list = employmentService.selectEmploymentList(employment);
        ExcelUtil<Employment> util = new ExcelUtil<Employment>(Employment.class);
        util.exportExcel(response, list, "用工计划数据");
    }

    /**
     * 获取用工计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(employmentService.selectEmploymentById(id));
    }

    /**
     * 新增用工计划
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:add')")
    @Log(title = "用工计划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Employment employment)
    {
        return toAjax(employmentService.insertEmployment(employment));
    }

    /**
     * 修改用工计划
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:edit')")
    @Log(title = "用工计划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Employment employment)
    {
        return toAjax(employmentService.updateEmployment(employment));
    }

    /**
     * 删除用工计划
     */
    @PreAuthorize("@ss.hasPermi('workstudy:employment:remove')")
    @Log(title = "用工计划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(employmentService.deleteEmploymentByIds(ids));
    }
}
