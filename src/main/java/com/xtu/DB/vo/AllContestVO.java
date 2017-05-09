package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
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
