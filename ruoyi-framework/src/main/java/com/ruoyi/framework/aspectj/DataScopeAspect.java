package com.ruoyi.framework.aspectj;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 数据过滤处理
 *
 * @author julisir
 */
@Aspect
@Component
public class DataScopeAspect {
    /**
     * 全部数据权限
     */
    public static final String DATA_SCOPE_ALL = "1";

    /**
     * 自定数据权限
     */
    public static final String DATA_SCOPE_CUSTOM = "2";

    /**
     * 部门数据权限
     */
    public static final String DATA_SCOPE_DEPT = "3";

    /**
     * 部门及以下数据权限
     */
    public static final String DATA_SCOPE_DEPT_AND_CHILD = "4";

    /**
     * 仅本人数据权限
     */
    public static final String DATA_SCOPE_SELF = "5";

    /**
     * 数据权限过滤关键字
     */
    public static final String DATA_SCOPE = "dataScope";

    /**
     * 配置织入点
     */
    @Pointcut("@annotation(com.ruoyi.common.annotation.DataScope)")
    public void dataScopePointCut() {
    }

    @Before("dataScopePointCut()")
    public void doBefore(JoinPoint point) throws Throwable {
        handleDataScope(point);
    }

    protected void handleDataScope(final JoinPoint joinPoint) {
        // 获得注解
        DataScope controllerDataScope = getAnnotationLog(joinPoint);
        if (controllerDataScope == null) {
            return;
        }
        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        if (currentUser != null) {
            // 如果是超级管理员，则不过滤数据
            if (!currentUser.isAdmin()) {
                dataScopeFilter(joinPoint, currentUser, controllerDataScope.deptAlias(),
                        controllerDataScope.userAlias());
            }
        }
    }

    /**
     * 数据范围过滤
     *
     * @param joinPoint 切点
     * @param user      用户
     * @param deptAlias 部门字段别名
     * @param userAlias 用户字段别名
     */
    public static void dataScopeFilter(JoinPoint joinPoint, SysUser user, String deptAlias, String userAlias) {
        StringBuilder sqlString = new StringBuilder();

        boolean deptAliasNotBlank = StringUtils.isNotBlank(deptAlias);
        boolean userAliasNotBlank = StringUtils.isNotBlank(userAlias);

        for (SysRole role : user.getRoles()) {

            String dataScope = role.getDataScope();
            //全部数据权限
            if (DATA_SCOPE_ALL.equals(dataScope)) {

                sqlString = new StringBuilder();
                break;
            } else if (DATA_SCOPE_CUSTOM.equals(dataScope)) {
                //自定义数据权限
                if (deptAliasNotBlank) {
                    //部门别名存在，使用mybatis xml sql
                    sqlString.append(StringUtils.format(
                            " OR {}.dept_id IN ( SELECT dept_id FROM sys_role_dept WHERE role_id = {} ) ", deptAlias,
                            role.getRoleId()));
                } else {
                    //部门别名不存在，使用mybatis-plus拼接sql
                    sqlString.append(StringUtils.format(
                            " OR dept_id IN ( SELECT dept_id FROM sys_role_dept WHERE role_id = {} ) ",
                            role.getRoleId()));
                }

            } else if (DATA_SCOPE_DEPT.equals(dataScope)) {
                //部门数据权限
                if (deptAliasNotBlank) {
                    sqlString.append(StringUtils.format(" OR {}.dept_id = {} ", deptAlias, user.getDeptId()));
                } else {
                    sqlString.append(StringUtils.format(" OR dept_id = {} ", user.getDeptId()));
                }
            } else if (DATA_SCOPE_DEPT_AND_CHILD.equals(dataScope)) {
                //部门及以下数据权限
                if (deptAliasNotBlank) {
                    sqlString.append(StringUtils.format(
                            " OR {}.dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = {} or find_in_set( {} , ancestors ) )",
                            deptAlias, user.getDeptId(), user.getDeptId()));
                } else {
                    sqlString.append(StringUtils.format(
                            " OR dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = {} or find_in_set( {} , ancestors ) )",
                            user.getDeptId(), user.getDeptId()));
                }
            } else if (DATA_SCOPE_SELF.equals(dataScope)) {
                //仅本人数据权限
                if (userAliasNotBlank) {
                    //用户表别名存在，使用mybatis xml sql方式
                    sqlString.append(StringUtils.format(" OR {}.user_id = {} ", userAlias, user.getUserId()));
                } else {
                    //用户表别名不存在，mybatis-plus拼接sql方式
                    sqlString.append(StringUtils.format(" OR create_by = {} ", user.getUserId()));
                }
            }
        }

        BaseEntity baseEntity = (BaseEntity) joinPoint.getArgs()[0];
        if (StringUtils.isNotBlank(sqlString.toString())) {

            if (deptAliasNotBlank || userAliasNotBlank) {
                baseEntity.getParams().put(DATA_SCOPE, " AND (" + sqlString.substring(4) + ")");
            } else {
                baseEntity.getParams().put(DATA_SCOPE, sqlString.substring(4));
            }
        }
    }

    /**
     * 是否存在注解，如果存在就获取
     */
    private DataScope getAnnotationLog(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null) {
            return method.getAnnotation(DataScope.class);
        }
        return null;
    }
}
