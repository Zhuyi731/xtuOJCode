package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestsEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ContestRepository {
    Long count();

    ContestsEntity findOne(int contestId);

    List<ContestsEntity> find(ProblemsDTO problemsDTO);

    ContestsEntity save(ContestsEntity problemSetDetailEntity);

    ContestsEntity insert(ContestsEntity problemSetDetailEntity);

    ContestsEntity update(ContestsEntity problemSetDetailEntity);

    void delete(long id);

}
