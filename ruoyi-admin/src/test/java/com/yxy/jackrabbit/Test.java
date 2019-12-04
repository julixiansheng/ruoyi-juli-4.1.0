package com.yxy.jackrabbit;

import org.apache.jackrabbit.api.JackrabbitRepository;
import org.apache.jackrabbit.api.JackrabbitRepositoryFactory;
import org.apache.jackrabbit.api.management.DataStoreGarbageCollector;
import org.apache.jackrabbit.api.management.RepositoryManager;
import org.apache.jackrabbit.commons.JcrUtils;
import org.apache.jackrabbit.core.RepositoryFactoryImpl;
import org.apache.jackrabbit.rmi.repository.URLRemoteRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.*;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.util.Properties;

public class Test {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * RMI地址
     */
    private String RMI = "http://127.0.0.1:7000/jackrabbit/rmi";

    /**
     * 仓库
     */
    private static Repository repository = null;

    /**
     * 初始化仓库
     *
     * @return
     */
    public Repository init() {
        if (null == repository) {
            try {
                repository = new URLRemoteRepository(RMI);
                logger.info("----------------------JackRabbit 仓库初始化成功----------------------");
            } catch (MalformedURLException e) {
                logger.error("----------------------JackRabbit 仓库初始化失败----------------------", e);
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
        }
        return session;
    }

    /**
     * 连接jackrabbit
     *
     * @throws RepositoryException
     */
    @org.junit.Test
    public void firstHop() throws RepositoryException {
        Repository repository = JcrUtils.getRepository();
        Session session = repository.login(new GuestCredentials());
        try {
            String user = session.getUserID();
            String name = repository.getDescriptor(Repository.REP_NAME_DESC);
            System.out.println(
                    "Logged in as " + user + " to a " + name + " repository.");
        } finally {
            session.logout();
        }

    }

    /**
     * 保存文件
     *
     * @throws RepositoryException
     */
    @org.junit.Test
    public void secondHop() throws RepositoryException {
        Repository repository = JcrUtils.getRepository();
        Session session = repository.login(new SimpleCredentials("admin", "admin".toCharArray()));
        try {
            Node root = session.getRootNode();

            // Store content
            Node hello = root.addNode("hello");
            Node world = hello.addNode("world");
            world.setProperty("message", "Hello, World!");
            try {
                world.setProperty("file", new FileInputStream("C:\\Users\\JULIXIANSHENG\\Pictures\\72f082025aafa40fd241a33eab64034f79f01949.gif"));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

            // Retrieve content
            Node node = root.getNode("hello/world");
            System.out.println(node.getPath());
            System.out.println(node.getProperty("message").getString());

            session.save();
        } finally {
            session.logout();
        }
    }

    /**
     * 删除文件节点
     *
     * @throws RepositoryException
     */
    @org.junit.Test
    public void deltedFile() throws RepositoryException {
        Repository repository = JcrUtils.getRepository();
        Session session = repository.login(new SimpleCredentials("admin", "admin".toCharArray()));
        Node rootNode = session.getRootNode();
        Node hello = rootNode.getNode("hello");
        hello.remove();
        session.save();
        session.logout();
    }

    /**
     * jackrabbit datastore区垃圾回收
     *
     * @link https://jackrabbit.apache.org/archive/wiki/JCR/DataStore_115513387.html#DataStore-RunningDataStoreGarbageCollection(Jackrabbit2.x)
     * @throws RepositoryException
     */
    @org.junit.Test
    public void storeGc() throws RepositoryException {
        JackrabbitRepositoryFactory rf = new RepositoryFactoryImpl();
        Properties prop = new Properties();
        String repositoryDir = "C:\\Codding\\Apache\\JackRabbit\\JackRabbit-2.18.4-tomcat-7.0.91\\jackrabbit";
        prop.setProperty("org.apache.jackrabbit.repository.home", repositoryDir);
        prop.setProperty("org.apache.jackrabbit.repository.conf", repositoryDir + "/repository.xml");

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
    }
}
