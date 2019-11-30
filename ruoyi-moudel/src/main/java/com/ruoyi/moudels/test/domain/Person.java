package com.ruoyi.moudels.test.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 人员对象 tb_person
 * 
 * @author ruoyi
 * @date 2019-11-26
 */
@Data
@ToString
@EqualsAndHashCode(callSuper = true)
@TableName("tb_person")
public class Person extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 年龄 */
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

}
