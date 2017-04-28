package com.xtu.DB;

import com.xtu.DB.dto.ContestDTO;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestsEntity;
import com.xtu.DB.vo.AllContestVO;

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

    Long queryContestPagesTotal(ContestDTO contestDTO);

    AllContestVO queryContestPages(int start, int size, ContestDTO contestDTO);

    AllContestVO queryContestPages(int start, ContestDTO contestDTO);

    AllContestVO queryAllContestPages(int start, int size, int userId);

    AllContestVO queryAllContestPages(int start, int userId);
}
