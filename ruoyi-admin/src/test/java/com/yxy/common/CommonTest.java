package com.yxy.common;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.junit.Test;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * 通用测试类
 *
 * @author yuanxiyang
 * @date 2019/12/20 9:24
 **/
public class CommonTest {

    /**
     * == 与 equals的区别：
     * 1.==用来比较两个对象的地址（基本类型比较值）
     * 2.equals一般比较两个对象的值是否相等，前提是需要重写equals方法，否则将调用Object中的equals方法进行==比较
     * 3.基本类型的包装类重写的equals方法，用来比较值
     */
    @Test
    public void equalsTest() {
        Person person1 = new Person();
        person1.setAge(21);
        person1.setName("juli");

        Person person2 = new Person();
        person2.setAge(21);
        person2.setName("juli");

        System.out.println("person1 hashcode: " + person1.hashCode());
        System.out.println("person2 hashcode: " + person2.hashCode());

        System.out.println(person1.equals(person2));
        System.out.println(person1 == person2);

        System.out.println("person1: " + person1);
        System.out.println("person2: " + person2);

        //将后面不再使用的对象置为null，将提前进行垃圾回收
        person1 = null;
        person2 = null;

        try {
            //调用垃圾回收器，但jvm不一定执行
            System.gc();
            Thread.sleep(15000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void newChildClassTest() {
        //由于B继承自A，所以在实例化B的时候会调用A的构造方法
        B b = new B();
    }

    @Test
    public void hashSetTest(){
        HashSet<String> hashSet = new HashSet<>();
        hashSet.add("a");
        hashSet.add("b");
        hashSet.add("c");
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add("a");
        arrayList.add("b");
        arrayList.add("d");
        arrayList.add("e");
        arrayList.add("f");
        hashSet.addAll(arrayList);

        Iterator<String> iterator = hashSet.iterator();
        while (iterator.hasNext()){
            System.out.print(iterator.next() + "\t");
        }
        System.out.println();
        System.out.println("------------------------------------------------");

        HashSet<Person> personHashSet = new HashSet<>();
        Person person1 = new Person();
        person1.setAge(21);
        person1.setName("juli");

        Person person2 = new Person();
        person2.setAge(21);
        person2.setName("juli");

        System.out.println("person1 : " + person1.hashCode());
        System.out.println("person2 : " + person2.hashCode());

        personHashSet.add(person1);
        personHashSet.add(person2);

        for (Person person : personHashSet) {
            System.out.println(person);
        }
        System.out.println(personHashSet.size());

    }

    @Test
    public void stringTest(){
        String a = "123";
        String b = "123";
        System.out.println(a == b);
        System.out.println(a.equals(b));
    }

    @Test
    public void listTest(){
        List<String> list = new CopyOnWriteArrayList<>();
        String[] strings = {"", "", "", "", "e", "f"};
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("d");
        //在执行toArray时，若传入接受数据的数组，并且该数组元素个数大于list.size()时，数组的第list.size()位会被置为null!!!
        list.toArray(strings);
        for (String string : strings) {
            System.out.println(string);
        }

        System.out.println("--------------------------------------");
        for (String next : list) {
            if (next.equals("c")) {
                list.remove("c");
            } else {
                System.out.println(next);
            }
        }
    }

    @Test
    public void growTest(){
        System.out.println((1 >> 1));
    }

    @Test
    public void hashMapTest() throws InterruptedException {

        HashMap<String, Object> map = new HashMap<>();
        map.put("name", "张三");
        map.put("age", 21);
        map.put("sex", "男");
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
        long l = System.currentTimeMillis();
        Thread.sleep(1000);
        map.remove("name");
        System.out.println("耗时:" + (System.currentTimeMillis() - l));

        System.out.println("------------------------------------------------------------");

        //LinkedHashMap 插入删除速度快，可以按照插入顺序和访问顺序进行迭代
        LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<>();
        linkedHashMap.put("name", "张三");
        linkedHashMap.put("age", 21);
        linkedHashMap.put("sex", "男");
        for (Map.Entry<String, Object> entry : linkedHashMap.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
        l = System.currentTimeMillis();
        Thread.sleep(1000);
        linkedHashMap.remove("name");
        System.out.println("耗时：" + (System.currentTimeMillis() - l));
    }
}

@Getter
@Setter
@EqualsAndHashCode
class Person {

    private String name;
    private int age;

    /**
     * 在被gc清理前会调用此方法
     *
     * @throws Throwable
     */
    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println("dead.....");
    }
}

class A {

    public A() {
        System.out.println("A");
    }
}

class B extends A {

    public B() {
        System.out.println("B");
    }
}