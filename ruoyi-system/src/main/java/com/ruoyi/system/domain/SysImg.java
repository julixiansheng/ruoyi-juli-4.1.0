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
 * 轮播图片对象 sys_img
 * 
 * @author julisir
 * @date 2019-12-03
 */
@Data
@ToString
@EqualsAndHashCode(callSuper = true)
@TableName("sys_img")
public class SysImg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 图片名称 */
    @Excel(name = "图片名称")
    private String imgName;

    /** 图片路径 */
    private String imgUrl;

    /** 图片序号 */
    @Excel(name = "图片序号")
    private Integer imgOrder;

    /** 是否显示 */
    @Excel(name = "是否显示")
    private String isDisplay;

    /** 文件id */
    private Long fileId;

    /** 创建者所在部门id */
    @TableField(fill = FieldFill.INSERT)
    private Long deptId;
}
