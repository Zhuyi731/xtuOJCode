package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ProblemsRepository {
    Long count();

    ProblemsEntity findOne(String problemId);

    List<ProblemsEntity> find(ProblemsDTO problemsDTO);

    ProblemsEntity add(ProblemsEntity problemsEntity);

    ProblemsEntity update(ProblemsEntity problemsEntity);

    void delete(long id);
}
