package com.xtu.tools;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/25.
 */
public class DateUtil {
    public static Timestamp getTimestamp(String dateStr){
        return Timestamp.valueOf( dateStr.replace('T',' ') + ":00");
    }
}
