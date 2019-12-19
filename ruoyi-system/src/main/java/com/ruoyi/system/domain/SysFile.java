package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 文件对象 sys_file
 * 
 * @author julisir
 * @date 2019-12-03
 */
@Data
@ToString
@EqualsAndHashCode(callSuper = true)
@TableName("sys_file")
public class SysFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文件id */
    private Long id;

    /** 文件名 */
    @Excel(name = "文件名")
    private String fileName;

    /** 文件大小 */
    @Excel(name = "文件大小")
    private Long fileSize;

    /** mime类型（用于下载的时候指定文件类型） */
    @Excel(name = "mime类型", readConverterExp = "用=于下载的时候指定文件类型")
    private String mimeType;

    /** 创建者所在部门id */
    @TableField(fill = FieldFill.INSERT)
    private Long deptId;
}
