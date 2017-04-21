package com.xtu.DB;

import com.xtu.DB.vo.RankListVO;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface RunsRepository {
    List<RankListVO> queryRankList(int start, int size);

    List<RankListVO> queryRankList(int start);

    List<RankListVO> queryContextRankList(int start);
}
