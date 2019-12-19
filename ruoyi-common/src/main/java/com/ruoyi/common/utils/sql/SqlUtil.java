package com.ruoyi.common.utils.sql;

import com.ruoyi.common.utils.StringUtils;

/**
 * sql操作工具类
 *
 * @author julisir
 */
public class SqlUtil {
    /**
     * 仅支持字母、数字、下划线、空格、逗号（支持多个字段排序）
     */
    public static String SQL_PATTERN = "[a-zA-Z0-9_\\ \\,]+";

    /**
     * 检查字符，防止注入绕过
     */
    public static String escapeOrderBySql(String value) {
        if (StringUtils.isNotEmpty(value) && !isValidOrderBySql(value)) {
            return StringUtils.EMPTY;
        }
        return value;
    }

    /**
     * 验证 order by 语法是否符合规范
     */
    public static boolean isValidOrderBySql(String value) {
        return value.matches(SQL_PATTERN);
    }

    /**
     * 处理用于like查询字符串中的特殊字符
     *
     * @param str 处理前的字符串
     * @return 处理后的字符串
     */
    public static String dealSpecialCharUseLike(String str) {
        if (null == str || "".equals(str.trim())) {
            return "";
        }
        str = str.replace("'", "''");
        char[] chars = str.toCharArray();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] == '%' || chars[i] == '_' || chars[i] == '/') {
                sb.append("/");
            }
            sb.append(chars[i]);
        }
        return sb.toString();
    }

    /**
     * 处理用于=查询字符串中的特殊字符
     *
     * @param str 处理前的字符串
     * @return 处理后的字符串
     */
    public static String dealSpecialCharUseEq(String str) {
        return str.replace("'", "''");
    }

}
