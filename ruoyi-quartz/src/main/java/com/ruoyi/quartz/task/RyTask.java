package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.jackrabbit.api.JackrabbitRepository;
import org.apache.jackrabbit.api.JackrabbitRepositoryFactory;
import org.apache.jackrabbit.api.management.DataStoreGarbageCollector;
import org.apache.jackrabbit.api.management.RepositoryManager;
import org.apache.jackrabbit.core.RepositoryFactoryImpl;
import org.springframework.stereotype.Component;

import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;
import java.util.Properties;

/**
 * 定时任务调度
 * 
 * @author julisir
 */
@Slf4j
@Component("ryTask")
public class RyTask
{
    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }

    /**
     * jackrabbit GC垃圾回收，清理storedata区域垃圾文件
     *
     * @param jackrabbitDir
     */
    public void jackrabbitGC(String jackrabbitDir){
        try {
            JackrabbitRepositoryFactory rf = new RepositoryFactoryImpl();
            Properties prop = new Properties();

            prop.setProperty("org.apache.jackrabbit.repository.home", jackrabbitDir);
            prop.setProperty("org.apache.jackrabbit.repository.conf", jackrabbitDir + "/repository.xml");

            JackrabbitRepository rep = (JackrabbitRepository) rf.getRepository(prop);
            RepositoryManager rm = rf.getRepositoryManager(rep);

            // need to login to start the repository
            Session session = rep.login(new SimpleCredentials("admin", "admin".toCharArray()));

            //数据存储垃圾回收器
            DataStoreGarbageCollector gc = rm.createDataStoreGarbageCollector();
            try {
                //标记
                gc.mark();
                //清理
                gc.sweep();
            } finally {
                gc.close();
            }

            session.logout();
            rm.stop();
        }catch (RepositoryException e){
            log.error("调用jackrabbit GC垃圾回收器失败!", e);
        }
        log.info("调用jackrabbit GC垃圾回收器成功!");
    }
}
