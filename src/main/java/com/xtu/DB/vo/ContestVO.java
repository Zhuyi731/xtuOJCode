package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * 列表比赛、作业视图
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class ContestVO {
    /**
     * ContestEntityVO列表
     */
    private List<ContestEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
