package com.xtu.DB.vo;

import com.xtu.DB.entity.ContestsEntity;
import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestProblemVO {
    /**
     * AllContestProblemEntityVO列表
     */
    private List<AllContestProblemEntityVO> entityList;
    private ContestsEntity contestsEntity;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
