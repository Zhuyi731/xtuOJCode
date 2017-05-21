package com.xtu.DB.vo;

import lombok.Data;

/**
 * 单项排行榜视图
 * Created by Ilovezilian on 2017/4/21.
 */
@Data
public class RankEntityVO {
    /**
     * 排名
     */
    private int rank;
    /**
     * ID
     */
    private String id;
    /**
     * 姓名
     */
    private String name;
    /**
     * 班级
     */
    private String classId;
    /**
     * 总AC题数
     */
    private int acProblemsNum;
    /**
     * 提交的题目数量
     */
    private int submitProblemsNum;
    /**
     * 通过率
     */
    private int ratio;
}
