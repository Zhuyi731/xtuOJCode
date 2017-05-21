package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * 列表比赛、作业列表视图
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestVO {
    /**
     * AllContestEntityVO列表
     */
    private List<AllContestEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
