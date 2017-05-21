package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemSetsEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ProblemSetsRepository {
    Long count();

    ProblemSetsEntity findOne(String problemId);

    List<ProblemSetsEntity> find(ProblemsDTO problemsDTO);

    ProblemSetsEntity save(ProblemSetsEntity problemsEntity);

    void delete(long id);
}
