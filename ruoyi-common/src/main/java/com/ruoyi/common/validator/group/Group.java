package com.ruoyi.common.validator.group;

import javax.validation.GroupSequence;

/**
 * 定义校验顺序，如果AddGroup组失败，则UpdateGroup组不会再校验
 *
 * @author yuanxiyang
 * @date 2019/12/20 16:14
 **/
@GroupSequence({DefaultGroup.class, AddGroup.class, UpdateGroup.class})
public interface Group {
}