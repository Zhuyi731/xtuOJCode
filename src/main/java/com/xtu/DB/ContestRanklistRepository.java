package com.xtu.DB;

import com.xtu.DB.entity.ContestRanklistEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ContestRanklistRepository {
    ContestRanklistEntity queryOne(int userId, int contestId);

    List<ContestRanklistEntity> queryList(int contestId);
}
