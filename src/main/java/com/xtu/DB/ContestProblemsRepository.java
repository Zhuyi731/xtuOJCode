package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestProblemsEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ContestProblemsRepository {
    Long count();

    ContestProblemsEntity findOne(String problemId);

    List<ContestProblemsEntity> find(ProblemsDTO problemsDTO);

    List<ContestProblemsEntity>  findList(int contestId);

    ContestProblemsEntity save(ContestProblemsEntity problemSetDetailEntity);

    ContestProblemsEntity insert(ContestProblemsEntity problemSetDetailEntity);

    ContestProblemsEntity update(ContestProblemsEntity problemSetDetailEntity);

    void deleteNoToMax(int contestId);

    void delete(long id);

}
