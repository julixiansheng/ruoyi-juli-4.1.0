package com.yxy.common;

import com.ruoyi.common.utils.StringUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Random;
import java.util.Vector;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 线程测试(练习)
 *
 * @author JULIXIANSHENG
 * @date 2019年12月27日18:00:47
 */
public class ThreadTest {

    @Test
    public void createThreadTest01() {
        MyThread myThread = new MyThread();
        myThread.start();

        for (int i = 0; i < 20; i++) {
            System.out.println("coding");
        }
    }

    @Test
    public void createThreadTest02() {
        MyImageThread myImageThread01 = new MyImageThread("http://a0.att.hudong.com/06/70/50200009239445155793706450875_s.jpg", "D:\\lufei.jpg");
        MyImageThread myImageThread02 = new MyImageThread("https://pic1.zhimg.com/v2-6e97d3d9b1887c1204fc42408482472d_1200x500.jpg", "D:\\namei.jpg");
        MyImageThread myImageThread03 = new MyImageThread("http://i2.bangqu.com/r2/news/20180702/304a51744d4a7641504e.jpg", "D:\\suolong.jpg");

        new Thread(myImageThread01).start();
        new Thread(myImageThread02).start();
        new Thread(myImageThread03).start();

        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void createThreadTest03() {
        Web12306 web12306 = new Web12306();

        //不同的线程对同一份资源进行操作
        new Thread(web12306, "a").start();
        new Thread(web12306, "b").start();
        new Thread(web12306, "c").start();
    }

    @Test
    public void createThreadTest04() throws ExecutionException, InterruptedException {
        Game game = new Game();

        ExecutorService executorService = Executors.newFixedThreadPool(2);
        Future<Integer> future01 = executorService.submit(game);
        Future<Integer> future02 = executorService.submit(game);

        Integer tuzi = future01.get();
        Integer wugui = future02.get();

        System.out.println("tuzi: " + tuzi + " ----- wugui: " + wugui);

    }

    @Test
    public void proxyTest() {
        new WeddingCompany(new SomePeople("julisir")).happyMarry();
        //new Thread(Runnable接口实现类).start();           //Thread使用了静态代理模式
    }

    @Test
    public void lambdaTest() {
        lambdaInterface lambdaInterface = (String msg) -> {
            System.out.println(msg);
        };
        //简化写法   ->   lambdaInterface lambdaInterface = System.out::println;
        lambdaInterface.say("hello");
    }

    @Test
    public void printABCUsingLock() {
//        PrintABCUsingLock printABC = new PrintABCUsingLock(5);
//        PrintABCUsingWaitNotify printABC = new PrintABCUsingWaitNotify(5);
//        PrintABCUsingLockCondition printABC = new PrintABCUsingLockCondition(5);

        PrintABCUsingSemaphore printABC = new PrintABCUsingSemaphore(5);
        new Thread(printABC::printA).start();
        new Thread(printABC::printB).start();
        new Thread(printABC::printC).start();

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}

/**
 * 创建线程的第一种方式：继承Thread类，重写run方法，通过start()启动线程
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:24
 **/
class MyThread extends Thread {

    @Override
    public void run() {
        for (int i = 0; i < 20; i++) {
            System.out.println("听歌");
        }
    }
}

/**
 * 创建线程第二种方法：实现Runnable接口，重写run方法，通过new Thread(实现Runnable接口的方法).start()启动线程类
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:24
 **/
@Data
@AllArgsConstructor
class MyImageThread implements Runnable {

    private String url;
    private String path;

    @Override
    public void run() {
        System.out.println("path:" + path);
        try {
            FileUtils.copyURLToFile(new URL(url), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

/**
 * 模拟抢票
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:26
 **/
@Data
class Web12306 implements Runnable {

    private Integer votes = 100;

    @Override
    public void run() {
        while (true) {
            if (votes == 0) {
                break;
            }
            System.out.println(Thread.currentThread().getName() + "-->" + votes--);
        }
    }

}

/**
 * 创建线程的第三种方法：实现Callable接口，实现call方法，通过线程池启动线程类
 * ExecutorService executorService = Executors.newFixedThreadPool(2);
 * executorService.submit(实现了Callable接口的类);
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:26
 **/
@Data
class Game implements Callable<Integer> {

    private String winner;

    @Override
    public Integer call() throws Exception {
        for (int step = 1; step <= 100; step++) {
            System.out.println(Thread.currentThread().getName() + "-->" + step);
            //如果比赛结束，返回步数，供future接收
            if (gameOver(step)) {
                return step;
            }
        }
        return null;
    }

    private boolean gameOver(int step) {
        //winner存在，表示胜利者已存在，比赛结束
        if (StringUtils.isNotBlank(winner)) {
            return true;
        } else {
            //step到达100表示有人盗终点了，记录胜利者名称
            if (step == 100) {
                winner = Thread.currentThread().getName();
                System.out.println("winner: " + getWinner());
                return true;
            }
        }
        //比赛未结束
        return false;
    }
}

/**
 * 结婚接口，为静态代理模式提供一个公共的接口
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:28
 **/
interface Marry {
    void happyMarry();
}

/**
 * 一些人
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:17
 **/
@Data
@AllArgsConstructor
class SomePeople implements Marry {

    private String name;

    @Override
    public void happyMarry() {
        System.out.println(name + " 结婚了!");
    }
}

/**
 * 代理类-婚庆公司
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:19
 **/
@Data
@AllArgsConstructor
class WeddingCompany implements Marry {

    private SomePeople somePeople;

    @Override
    public void happyMarry() {
        ready();
        somePeople.happyMarry();
        end();
    }

    private void ready() {
        System.out.println("准备" + somePeople.getName() + "的婚礼");
    }

    private void end() {
        System.out.println(somePeople.getName() + "结完婚了，收拾收拾");
    }
}

/**
 * lambda表达式练习接口
 *
 * @author yuanxiyang
 * @date 2019/12/27 20:57
 **/
@FunctionalInterface
interface lambdaInterface {

//    void say();

    //只允许存在一个抽象方法！！！！
    void say(String msg);
//
//    void say(String msg, Date date);
//
//    int sum(int a, int b);
}

/**
 * 顺序打印ABC，使用锁的方式
 *
 * @author yuanxiyang
 * @date 2019/12/28 12:17
 **/
@Data
class PrintABCUsingLock {

    private int times;
    private int state;
    private Lock lock = new ReentrantLock();

    public PrintABCUsingLock(int times) {
        setTimes(times);
    }

    public void printA() {
        print("A", 0);
    }

    public void printB() {
        print("B", 1);
    }

    public void printC() {
        print("C", 2);
    }

    private void print(String name, int targetState) {
        for (int i = 0; i < times; ) {
            lock.lock();
            if (getState() % 3 == targetState) {
                state++;
                i++;
                System.out.println(name);
            }
            lock.unlock();
        }
    }

}

/**
 * 顺序打印ABC，使用自定义LOCK，配合synchronized，wait() notify()完成
 *
 * @author yuanxiyang
 * @date 2019/12/28 12:45
 **/
@Data
class PrintABCUsingWaitNotify {
    private int times;
    private volatile int state;
    private final Object LOCK = new Object();

    public PrintABCUsingWaitNotify(int times) {
        setTimes(times);
    }

    public void printA() {
        print("A", 0);
    }

    public void printB() {
        print("B", 1);
    }

    public void printC() {
        print("C", 2);
    }

    private void print(String name, int targetState) {
        for (int i = 0; i < times; i++) {
            synchronized (LOCK) {
                while (getState() % 3 != targetState) {
                    try {
                        LOCK.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                state++;
                System.out.println(name);
                LOCK.notifyAll();
            }
        }
    }
}

/**
 * 循序打印ABC，使用LOCK和Condition
 *
 * @author yuanxiyang
 * @date 2019/12/28 12:49
 **/
@Data
class PrintABCUsingLockCondition {

    private int times;
    private volatile int state;
    private final Lock lock = new ReentrantLock();
    private Condition conditionA = lock.newCondition();
    private Condition conditionB = lock.newCondition();
    private Condition conditionC = lock.newCondition();

    public PrintABCUsingLockCondition(int times) {
        setTimes(times);
    }

    public void printA() {
        print("A", 0, conditionA, conditionB);
    }

    public void printB() {
        print("B", 1, conditionB, conditionC);
    }

    public void printC() {
        print("C", 2, conditionC, conditionA);
    }

    private void print(String name, int targetState, Condition current, Condition next) {
        for (int i = 0; i < times; ) {
            lock.lock();
            try {
                while (getState() % 3 != targetState) {
                    current.await();
                }
                state++;
                i++;
                System.out.println(name);
                next.signal();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        }
    }

}

/**
 * 顺序打印ABC，使用Semaphore
 *
 * @author yuanxiyang
 * @date 2019/12/28 13:49
 **/
@Data
class PrintABCUsingSemaphore {

    private int times;
    private Semaphore semaphoreA = new Semaphore(1);
    private Semaphore semaphoreB = new Semaphore(0);
    private Semaphore semaphoreC = new Semaphore(0);

    public PrintABCUsingSemaphore(int times) {
        setTimes(times);
    }

    public void printA() {
        print("A", semaphoreA, semaphoreB);
    }

    public void printB() {
        print("B", semaphoreB, semaphoreC);
    }

    public void printC() {
        print("C", semaphoreC, semaphoreA);
    }

    private void print(String name, Semaphore current, Semaphore next) {
        for (int i = 0; i < times; i++) {
            try {
                current.acquire();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(name);
            next.release();
        }
    }

}