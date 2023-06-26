package com.ruoyi.project.workstudy.controller;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.tool.constant.ExportConstant;
import com.ruoyi.project.workstudy.domain.Assessment;
import com.ruoyi.project.workstudy.domain.Employment;
import com.ruoyi.project.workstudy.service.IAssessmentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author leenadz
 * @since 2023-06-26 09:48
 */
@RestController
@RequestMapping("/workstudy/assessment")
public class AssessmentController extends BaseController {
    @Resource
    private IAssessmentService assessmentService;

    @Resource
    private ExportConstant exportConstant;

    /**
     * 查询合同列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Assessment assessment) {
        LambdaQueryWrapper<Assessment> assessmentLambdaQueryWrapper = new LambdaQueryWrapper<>();
        assessmentLambdaQueryWrapper.eq(Assessment::getApplicationId, assessment.getApplicationId());
        String month = assessment.getMonth();
        String year = assessment.getYear();
        if (month != null && !"".equals(month)) {
            assessmentLambdaQueryWrapper
                    .eq(Assessment::getYear, year)
                    .eq(Assessment::getMonth, month);
        }
        startPage();
        List<Assessment> list = assessmentService.list(assessmentLambdaQueryWrapper);
        return getDataTable(list);
    }

    /**
     * 新增考核
     */
    @Log(title = "考核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Assessment assessment) {
        return toAjax(assessmentService.save(assessment));
    }

    /**
     * 导出考核表
     */
    @Log(title = "导出考核表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Assessment assessment) throws IOException {
        String assessmentTemplatePath = exportConstant.getAssessmentTemplatePath();
        InputStream templatePathName = this.getClass().getClassLoader().getResourceAsStream(assessmentTemplatePath);
        Map<String, Object> params = new HashMap<>(6);
        params.put("techRequire", assessment.getTechRequireScore());
        params.put("workError", assessment.getWorkErrorScore());
        params.put("collaborativeAbility", assessment.getCollaborativeAbilityScore());
        params.put("assignedCompletion", assessment.getAssignedCompletionScore());
        params.put("workingAttitude", assessment.getWorkingAttitudeScore());
        params.put("totalScore", assessment.getTotalScore());
        ServletOutputStream out = response.getOutputStream();
        response.setContentType("multipart/form-data");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename*=utf-8'zh_cn'" + URLEncoder.encode("assessment.xlsx", StandardCharsets.UTF_8));
        EasyExcel
                .write(out)
                .autoCloseStream(true)
                .withTemplate(templatePathName)
                .sheet()
                .doFill(params);
        out.flush();
    }
}
