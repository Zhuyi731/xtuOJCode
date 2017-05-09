package com.xtu.tools;

/**
 * 输出工具类
 * Created by Ilovezilian on 2017/4/12.
 */
public class OUT {
    /**
     * 控制台输出
     *
     * @param agrs
     * @param printString
     */
    public static final void prt(String agrs, Object printString) {
        if (null == printString) {
            System.out.println(agrs + " = null");
        } else {
            System.out.println(agrs + " = " + printString.toString());
        }
    }

}
