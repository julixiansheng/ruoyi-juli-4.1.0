package com.ruoyi.common.config;

import org.apache.jackrabbit.rmi.repository.URLRemoteRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.jcr.*;
import java.net.MalformedURLException;

/**
 * JackRabbit配置
 *
 * @author julisir
 * @date 2019/12/3 16:18
 **/
@Component
public class JackRabbitConfig {

    protected static final Logger logger = LoggerFactory.getLogger(JackRabbitConfig.class);

    /**
     * RMI地址
     */
    @Value(value = "${ruoyi.jackrabbitRmi}")
    private String rmi;

    /**
     * 仓库
     */
    private static Repository repository = null;

    public JackRabbitConfig() {
    }

    /**
     * 初始化仓库
     *
     * @return
     */
    public Repository init() {
        if (null == repository) {
            try {
                repository = new URLRemoteRepository(rmi);
                logger.info("----------------------JackRabbit 仓库连接成功----------------------");
            } catch (MalformedURLException e) {
                logger.error("----------------------JackRabbit 仓库连接失败----------------------", e);
            }
        }
        return repository;
    }

    /**
     * 获取Session
     *
     * @return
     */
    public Session getSession() {
        Session session = null;
        try {
            session = init().login(new SimpleCredentials("admin", "admin".toCharArray()));
        } catch (RepositoryException e) {
            logger.error("----------------------JackRabbit 获取session失败----------------------", e);
            return null;
        }
        return session;
    }
}
