package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ProblemsRepository {
    Long count();

    List<ProblemsEntity> queryPage(ProblemsDTO problemsDTO);

    ProblemsEntity findOne(int problemId);

    ProblemsEntity queryOne(int problem_id);

    ProblemsEntity insert(ProblemsEntity problemsEntity);

    ProblemsEntity update(ProblemsEntity problemsEntity);

    ProblemsEntity save(ProblemsEntity problemsEntity);

    void delete(long id);
}
