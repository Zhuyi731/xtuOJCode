package com.xtu.DB;

import com.xtu.DB.vo.RankVO;
import com.xtu.DB.vo.StatusVO;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface RunsRepository {
    Long rankListCount();

    RankVO queryRankList(int start, int size);

    RankVO queryRankList(int start);

    Long contestRankListCount();

    RankVO queryContestRankList(int start);

    Long statusListCount();

    StatusVO queryStatusList(int start, int size);

    StatusVO queryStatusList(int start);
}
