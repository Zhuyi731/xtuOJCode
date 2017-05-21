package com.xtu.DB.vo;

import com.xtu.DB.entity.ContestsEntity;
import lombok.Data;

import java.util.List;

/**
 * 比赛、作业中列表题目信息视图
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestProblemVO {
    /**
     * 比赛、题库信息
     */
    private ContestsEntity contestsEntity;
    /**
     * AllContestProblemEntityVO列表
     */
    private List<AllContestProblemEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
