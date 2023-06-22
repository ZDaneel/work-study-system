package com.ruoyi.project.workstudy.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 学生申请对象 student
 * 
 * @author zyc
 * @date 2023-06-22
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 学院 */
    @Excel(name = "学院")
    private String department;

    /** 专业班级 */
    @Excel(name = "专业班级")
    private String major;

    /** 性别 */
    @Excel(name = "性别")
    private Long sex;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedTime;

    /** 0-申请中 1-已聘用 2-已结束 */
    @Excel(name = "0-申请中 1-已聘用 2-已结束")
    private Long status;

    /** 学号 */
    @Excel(name = "学号")
    private String studentId;

    /** 0-不是 1-是 */
    @Excel(name = "0-不是 1-是")
    private Long isEcoHard;

    /** 0-不接受 1-接受 */
    @Excel(name = "0-不接受 1-接受")
    private Long isAssignedAccept;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setDepartment(String department) 
    {
        this.department = department;
    }

    public String getDepartment() 
    {
        return department;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setSex(Long sex) 
    {
        this.sex = sex;
    }

    public Long getSex() 
    {
        return sex;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setCreatedTime(Date createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() 
    {
        return createdTime;
    }
    public void setUpdatedTime(Date updatedTime) 
    {
        this.updatedTime = updatedTime;
    }

    public Date getUpdatedTime() 
    {
        return updatedTime;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setStudentId(String studentId) 
    {
        this.studentId = studentId;
    }

    public String getStudentId() 
    {
        return studentId;
    }
    public void setIsEcoHard(Long isEcoHard) 
    {
        this.isEcoHard = isEcoHard;
    }

    public Long getIsEcoHard() 
    {
        return isEcoHard;
    }
    public void setIsAssignedAccept(Long isAssignedAccept) 
    {
        this.isAssignedAccept = isAssignedAccept;
    }

    public Long getIsAssignedAccept() 
    {
        return isAssignedAccept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("department", getDepartment())
            .append("major", getMajor())
            .append("sex", getSex())
            .append("phone", getPhone())
            .append("createdTime", getCreatedTime())
            .append("updatedTime", getUpdatedTime())
            .append("status", getStatus())
            .append("studentId", getStudentId())
            .append("isEcoHard", getIsEcoHard())
            .append("isAssignedAccept", getIsAssignedAccept())
            .toString();
    }
}
