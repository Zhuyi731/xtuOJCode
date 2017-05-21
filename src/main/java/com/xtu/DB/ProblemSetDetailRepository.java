package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemSetDetailEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ProblemSetDetailRepository {
    Long count();

    ProblemSetDetailEntity findOne(String problemId);

    List<ProblemSetDetailEntity> find(ProblemsDTO problemsDTO);

    ProblemSetDetailEntity save(ProblemSetDetailEntity problemSetDetailEntity);

    void delete(long id);

}
