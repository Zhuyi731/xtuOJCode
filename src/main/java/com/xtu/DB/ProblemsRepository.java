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

    Long queryPageTotal(ProblemsDTO problemsDTO);

    ProblemsVO queryPage(int start, int size, ProblemsDTO problemsDTO);

    ProblemsVO queryPage(int start, ProblemsDTO problemsDTO);

    ModifyProblemsVO queryModifyPage(int start, int size, int userId);

    ModifyProblemsVO queryModifyPage(int start, int userId);

    ProblemsEntity findOne(ProblemsDTO problemsDTO);

    ProblemsEntity queryOne(int problem_id);

    ProblemsEntity insert(ProblemsEntity problemsEntity);

    ProblemsEntity update(ProblemsEntity problemsEntity);

    ProblemsEntity save(ProblemsEntity problemsEntity);

    void delete(long id);
}
