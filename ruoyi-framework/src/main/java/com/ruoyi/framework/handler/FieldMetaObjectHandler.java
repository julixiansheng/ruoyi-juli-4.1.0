package com.ruoyi.framework.handler;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysUser;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.shiro.util.ThreadContext;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 公共字段填充
 *
 * @author yuanxy
 * @date 2019-11-25 14:05:25
 */
@Component
public class FieldMetaObjectHandler implements MetaObjectHandler {
    private final static String CREATE_TIME = "createTime";
    private final static String CREATOR_BY = "createBy";
    private final static String UPDATE_TIME = "updateTime";
    private final static String UPDATE_BY = "updateBy";

    @Override
    public void insertFill(MetaObject metaObject) {
        //解决非前端请求存储数据异常bug
        if( ThreadContext.getSubject() == null ){
            return;
        }
        SysUser user = ShiroUtils.getSysUser();

        Date date = DateUtils.getNowDate();

        //创建者
        setFieldValByName(CREATOR_BY, user.getUserId().toString(), metaObject);
        //创建时间
        setFieldValByName(CREATE_TIME, date, metaObject);
        //更新者
        setFieldValByName(UPDATE_BY, user.getUserId().toString(), metaObject);
        //更新时间
        setFieldValByName(UPDATE_TIME, date, metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        //解决非前端请求存储数据异常bug
        if( ThreadContext.getSubject() == null ){
            return;
        }
        SysUser user = ShiroUtils.getSysUser();
        //更新者
        setFieldValByName(UPDATE_BY, user.getUserId().toString(), metaObject);
        //更新时间
        setFieldValByName(UPDATE_TIME, new Date(), metaObject);
    }
}