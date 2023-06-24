package com.ruoyi.project.workstudy.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 用工计划对象 employment
 * 
 * @author zyc
 * @date 2023-06-23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employment
{

    /** 编号 */
    private Long id;

    /** 部门 */
    @Excel(name = "部门")
    private String department;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 创建时间 */
    private Date createdTime;

    /** 更新时间 */
    private Date updatedTime;

    /** 0-失效 1-生效 */
    @Excel(name = "状态")
    private Long status;

    /** 岗位 */
    private List<EmploymentJob> employmentJobs;
}
