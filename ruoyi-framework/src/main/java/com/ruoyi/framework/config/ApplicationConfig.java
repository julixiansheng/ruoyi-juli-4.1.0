package com.ruoyi.framework.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * 程序注解配置
 *
 * @author julisir
 */
@EnableAspectJAutoProxy(exposeProxy = true)// 表示通过aop框架暴露该代理对象,AopContext能够访问
@MapperScan("com.ruoyi.**.mapper*")// 指定要扫描的Mapper类的包的路径
@Configuration
public class ApplicationConfig
{

}
