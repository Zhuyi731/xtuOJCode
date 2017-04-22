package com.xtu.DB;

import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.vo.ModifyProblemsVO;
import com.xtu.DB.vo.ProblemsVO;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface ProblemsRepository {
    Long count();

    ProblemsVO queryPage(int start, int size);

    ProblemsVO queryPage(int start);

    ModifyProblemsVO queryPage(int start, int size, String id);

    ModifyProblemsVO queryPage(int start, String id);

    ProblemsEntity findOne(ProblemsDTO problemsDTO);

    ProblemsEntity queryOne(int problem_id);

    ProblemsEntity insert(ProblemsEntity problemsEntity);

    ProblemsEntity update(ProblemsEntity problemsEntity);

    ProblemsEntity save(ProblemsEntity problemsEntity);

    void delete(long id);
}
