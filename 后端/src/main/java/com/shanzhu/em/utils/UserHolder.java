package com.shanzhu.em.utils;

import com.shanzhu.em.entity.User;

/**
 * 用户信息
 */
public class UserHolder {

    private static final ThreadLocal<User> userThreadLocal = new ThreadLocal<>();

    public static void saveUser(User user){
        userThreadLocal.set(user);
    }

    public static User getUser(){
        return userThreadLocal.get();
    }

    public static void removeUser(){
        userThreadLocal.remove();
    }

}
//private static final ThreadLocal<User> userThreadLocal = new ThreadLocal<>();：声明了一个静态的ThreadLocal实例，用于存储User对象。ThreadLocal为每个线程提供了一个独立的变量副本，确保了线程之间的隔离性。
//public static void saveUser(User user)：将传入的User对象保存到当前线程的ThreadLocal变量中，即为当前线程绑定一个User对象。
//public static User getUser()：返回当前线程绑定的User对象，如果未设置，则返回null。
//public static void removeUser()：移除当前线程绑定的User对象，即清除ThreadLocal变量的值。