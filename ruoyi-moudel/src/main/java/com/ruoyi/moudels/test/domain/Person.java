package com.ruoyi.moudels.test.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.validator.group.DefaultGroup;
import com.ruoyi.common.validator.group.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 人员对象 tb_person
 * 
 * @author julisir
 * @date 2019-11-26
 */
@Data
@ToString
@EqualsAndHashCode(callSuper = true)
@TableName("tb_person")
public class Person extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id 若主键名称不叫id 要在该属性上加上@TableId注解 标明此属性为主键id*/
    @NotNull(message = "主键id不允许为空", groups = {UpdateGroup.class})
    private Long id;

    /** 姓名 */
    @NotBlank(message = "姓名不允许为空", groups = {DefaultGroup.class})
    @Length(max = 12, message = "姓名最大长度为12位", groups = {DefaultGroup.class})
    @Excel(name = "姓名")
    private String name;

    /** 年龄 */
    @NotNull(message = "年龄不允许为空", groups = {DefaultGroup.class})
    @Range(min = 1, max = 130, message = "年龄不合法", groups = {DefaultGroup.class})
    @Excel(name = "年龄")
    private Integer age;

    /** 性别 */
    @Excel(name = "性别")
    private Integer sex;

    /** 职业 */
    @Excel(name = "职业")
    private Integer job;

    /** 入职时间 */
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date jobDate;

    /** 所在部门*/
    @TableField(fill = FieldFill.INSERT)
    private Long deptId;
}
