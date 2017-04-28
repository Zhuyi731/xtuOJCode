package com.xtu.tools;

import java.sql.Timestamp;

/**
 * 时间工具类
 * Created by Ilovezilian on 2017/4/25.
 */
public class DateUtil {
    /**
     * 转换格式timestamp
     *
     * @param dateStr
     * @return
     */
    public static Timestamp getTimestamp(String dateStr) {
        return Timestamp.valueOf(dateStr.replace('T', ' ') + ":00");
    }

    /**
     * 获取当前时间的timestamp
     *
     * @return
     */
    public static Timestamp getCurrentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }
}
