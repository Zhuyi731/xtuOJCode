package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.TestdatasEntity;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface TestdatasRepository {
    Long count();

    TestdatasEntity findOne(int problemId);

    List<TestdatasEntity> queryList(int problemId);

    TestdatasEntity findOne(int problemId, short no);

    TestdatasEntity queryOne(int problemId, short no);

    List<TestdatasEntity> find(ProblemsDTO problemsDTO);

    TestdatasEntity inset(TestdatasEntity testdatasEntity);

    TestdatasEntity update(TestdatasEntity testdatasEntity);

    TestdatasEntity save(TestdatasEntity testdatasEntity);

    void delete(long id);

}
