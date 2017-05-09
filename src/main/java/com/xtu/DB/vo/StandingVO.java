package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 指定比赛、作业列表排行榜视图
 * Created by Ilovezilian on 2017/4/30.
 */
@Data
public class StandingVO {
    /**
     * StandingEntityVO列表
     */
    private List<StandingEntityVO> entityList;
    /**
     * 总AC题数, 提交的题目数量, 通过率
     */
    private List<Map<String, Integer>> mapList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
