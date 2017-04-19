package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestRanklistEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ContestRanklistRepository {
    Long count();

    ContestRanklistEntity findOne(String problemId);

    List<ContestRanklistEntity> find(ProblemsDTO problemsDTO);

    ContestRanklistEntity save(ContestRanklistEntity problemSetDetailEntity);

    void delete(long id);

}
