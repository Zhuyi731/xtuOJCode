package com.xtu.DB;

import com.xtu.DB.entity.ContestDetailEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/30.
 */
public interface ContestDetailRepository {
    ContestDetailEntity queryOne(int owner,int contestId, int no);

    List<ContestDetailEntity> queryList(int owner, int contestId);
}
