package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * 列表排行榜视图
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class RankVO {
    /**
     * RankEntityVO列表
     */
    private List<RankEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
