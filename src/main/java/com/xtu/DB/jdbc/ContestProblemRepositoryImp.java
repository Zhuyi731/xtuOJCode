package com.xtu.DB.jdbc;

import com.xtu.DB.ContestProblemsRepository;
import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.RunsRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestProblemsEntity;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/25.
 */
@Repository
public class ContestProblemRepositoryImp implements ContestProblemsRepository {
    @Autowired
    JdbcOperations jdbcOperations;
    @Autowired
    ProblemsRepository problemsRepository;
    @Autowired
    RunsRepository runsRepository;

    @Override
    public Long count() {
        return null;
    }

    @Override
    public ContestProblemsEntity findOne(String problemId) {
        return null;
    }

    @Override
    public List<ContestProblemsEntity> find(ProblemsDTO problemsDTO) {
        return null;
    }

    @Override
    public List<ContestProblemsEntity> findList(int contestId) {
        String sql = " SELECT * FROM "
                + Tables.CONTEST_PROBLEMS
                + " WHERE `contest_id` = ? " +
                " ORDER BY `no` ASC ";
        return jdbcOperations.query(sql, new ContestProblemsEntityRowMapper(), contestId);
    }

    @Override
    public ContestProblemsEntity save(ContestProblemsEntity contestsEntity) {
        return null;
    }

    @Override
    public ContestProblemsEntity insert(ContestProblemsEntity contestsEntity) {
        String sql = "INSERT INTO " +
                Tables.CONTEST_PROBLEMS +
                "(`contest_id`, `no`, `problem_id`, `score`, `balloon_color`) " +
                "VALUES (?, ?, ?, ?, ?); ";
        jdbcOperations.update(sql,
                contestsEntity.getContestId(),
                contestsEntity.getNo(),
                contestsEntity.getProblemId(),
                contestsEntity.getScore(),
                contestsEntity.getBalloonColor()
        );
        return contestsEntity;
    }

    @Override
    public ContestProblemsEntity update(ContestProblemsEntity contestsEntity) {
        String sql = "UPDATE " +
                Tables.CONTEST_PROBLEMS +
                " SET " +
                " `problem_id` = ?" +
                " `score` = ?" +
                " `balloon_color` = ?" +
                " WHERE `contest_id` = ? AND `no` = ?; ";
        jdbcOperations.update(sql,
                contestsEntity.getProblemId(),
                contestsEntity.getScore(),
                contestsEntity.getBalloonColor(),
                contestsEntity.getContestId(),
                contestsEntity.getNo());
        return contestsEntity;
    }

    public void deleteNoToMax(int contestId) {
        String sql = " delete  from "
                + Tables.CONTEST_PROBLEMS +
                " where `contest_id` = ?";
        jdbcOperations.update(sql, contestId);
    }

    @Override
    public void delete(long id) {

    }

    private static final class ContestProblemsEntityRowMapper implements RowMapper<ContestProblemsEntity> {
        @Override
        public ContestProblemsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestProblemsEntity entity = new ContestProblemsEntity();
            entity.setContestId(rs.getInt("contest_id"));
            entity.setNo(rs.getByte("no"));
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setScore(rs.getByte("score"));
            entity.setBalloonColor(rs.getString("balloon_color"));
            return entity;
        }
    }
}
