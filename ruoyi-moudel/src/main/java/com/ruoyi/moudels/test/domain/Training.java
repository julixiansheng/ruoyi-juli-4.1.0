package com.ruoyi.moudels.test.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 训练对象 tb_training
 *
 * @author yuanxy
 * @date 2019-11-25
 */
@Data
@ToString
@EqualsAndHashCode(callSuper = true)
@TableName("tb_training")
public class Training extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 训练名称 */
    @Excel(name = "训练名称")
    private String trainingName;

    /** 训练编号 */
    @Excel(name = "训练编号")
    private String trainingNo;

    /** 训练类型 */
    @Excel(name = "训练类型")
    private String trainingType;

    /** 训练状态 */
    @Excel(name = "训练状态")
    private String trainingState;

    /** 训练日期 */
    @Excel(name = "训练日期", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date trainingDate;

}


