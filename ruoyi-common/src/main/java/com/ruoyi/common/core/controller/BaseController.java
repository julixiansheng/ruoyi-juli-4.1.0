package com.ruoyi.common.core.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.AjaxResult.Type;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;

/**
 * web层通用数据处理
 *
 * @author julisir
 */
public class BaseController {
    protected final Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(DateUtils.parseDate(text));
            }
        });

    }

    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize)) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 获取分页page
     *
     * @return 分页page
     */
    protected Page getPage() {
        String isAsc = getParameter(Constants.IS_ASC);
        //前台传来的order key不是驼峰命名，这里需要转换一下
        String orderByColumn = StringUtils.toUnderScoreCase(getParameter(Constants.ORDER_BY_COLUMN));

        Integer pageNum = getParameterToInt(Constants.PAGE_NUM);
        Integer pageSize = getParameterToInt(Constants.PAGE_SIZE);

        Page page = new Page();

        if(ObjectUtil.isNotNull(pageNum) && ObjectUtil.isNotNull(pageSize)){
            page.setPages(pageNum);
            page.setSize(pageSize);
        }

        if( "asc".equals(isAsc) && StrUtil.isNotBlank(orderByColumn)){
            page.addOrder(OrderItem.asc(SqlUtil.escapeOrderBySql(orderByColumn)));
        }
        if( "desc".equals(isAsc) && StrUtil.isNotBlank(orderByColumn)){
            page.addOrder(OrderItem.desc(SqlUtil.escapeOrderBySql(orderByColumn)));
        }
        return page;
    }

    /**
     * 获取request
     */
    public HttpServletRequest getRequest() {
        return ServletUtils.getRequest();
    }

    /**
     * 获取response
     */
    public HttpServletResponse getResponse() {
        return ServletUtils.getResponse();
    }

    /**
     * 获取session
     */
    public HttpSession getSession() {
        return getRequest().getSession();
    }

    /**
     * 获取参数
     *
     * @param name
     * @return
     */
    public String getParameter(String name){
        return getRequest().getParameter(name);
    }

    /**
     * 获取参数 type:Integer
     *
     * @param name
     * @return
     */
    public Integer getParameterToInt(String name){
        return Convert.toInt(getParameter(name));
    }

    /**
     * 获取参数 type:Long
     *
     * @param name
     * @return
     */
    public Long getParameterToLong(String name){
        return Convert.toLong(getParameter(name));
    }

    /**
     * 获取参数 type:Double
     *
     * @param name
     * @return
     */
    public Double getParameterToDouble(String name){
        return Convert.toDouble(getParameter(name));
    }

    /**
     * 获取参数 type:Byte
     *
     * @param name
     * @return
     */
    public Byte getParameterToByte(String name){
        return Convert.toByte(getParameter(name));
    }

    /**
     * 获取参数 type:Boolean
     *
     * @param name
     * @return
     */
    public Boolean getParameterToBoolean(String name){
        return Convert.toBool(getParameter(name));
    }

    /**
     * 获取参数 type:Character
     *
     * @param name
     * @return
     */
    public Character getParameterToChar(String name){
        return Convert.toChar(getParameter(name));
    }

    /**
     * 获取参数 type:Date
     *
     * @param name
     * @return
     */
    public Date getParameterToDate(String name){
        return DateUtils.parseDate(getParameter(name));
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list) {
        return new TableDataInfo(list, new PageInfo<>(list).getTotal(), 0);
    }

    /**
     * mybatis plus分页数据
     *
     * @param page 分页
     * @return
     */
    protected TableDataInfo getDataTab(IPage<?> page) {
        return new TableDataInfo(page.getRecords(), page.getTotal(), 0);
    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows) {
        return rows > 0 ? success() : error();
    }

    /**
     * 响应返回结果
     *
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result) {
        return result ? success() : error();
    }

    /**
     * 返回成功
     */
    public AjaxResult success() {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error() {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message) {
        return AjaxResult.success(message);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message) {
        return AjaxResult.error(message);
    }

    /**
     * 返回错误码消息
     */
    public AjaxResult error(Type type, String message) {
        return new AjaxResult(type, message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url) {
        return StringUtils.format("redirect:{}", url);
    }
}
