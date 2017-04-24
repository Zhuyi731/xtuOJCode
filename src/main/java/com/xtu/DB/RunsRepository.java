package com.xtu.DB;

import com.xtu.DB.dto.StatusDTO;
import com.xtu.DB.dto.SubmitContestDTO;
import com.xtu.DB.dto.SubmitDTO;
import com.xtu.DB.vo.RankVO;
import com.xtu.DB.vo.StatusEntityVO;
import com.xtu.DB.vo.StatusVO;

import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface RunsRepository {
    StatusEntityVO queryCode(int runsId, String id);

    Map<String, Integer> queryNum(int problemId);

    Long rankListCount();

    RankVO queryRankList(int start, int size);

    RankVO queryRankList(int start);

    Long contestRankListCount();

    RankVO queryContestRankList(int start);

    Long statusListCount();

    StatusVO queryStatusList(int start, int size);

    StatusVO queryStatusList(int start);

    StatusVO queryStatusList(int start, int size, StatusDTO statusDTO);

    StatusVO queryStatusList(int start, StatusDTO statusDTO);

    void save(SubmitDTO submitDTO);

    void save(SubmitContestDTO submitContestDTO);
}
