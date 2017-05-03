package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/30.
 */
@Data
public class StandingVO {
    private List<StandingEntityVO> entityList;
    /**
     * 总AC题数, 提交的题目数量, 通过率
     */
    private List<Map<String, Integer>> mapList;
    private long total;
    private int start;
}
