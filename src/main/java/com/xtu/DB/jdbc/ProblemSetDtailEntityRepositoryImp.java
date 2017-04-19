package com.xtu.DB.jdbc;

import com.xtu.DB.ContestRanklistRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestRanklistEntity;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Repository
public class ProblemSetDtailEntityRepositoryImp implements ContestRanklistRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.CONTEST_RANKLIST;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    @Override
    public ContestRanklistEntity findOne(String problemId) {
        String finduserSql = "SELECT * FROM " + Tables.CONTEST_RANKLIST
                + " WHERE problem_id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId);
    }

    @Override
    public List<ContestRanklistEntity> find(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM "
                + Tables.CONTEST_RANKLIST +

//                + " WHERE problem_id = ? " +
                " Limit ?,?";
        return jdbcOperations.query(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
//                problemsDTO.getProblemId(),
                problemsDTO.getStart(),
                problemsDTO.getSize());
    }

    @Override
    public ContestRanklistEntity save(ContestRanklistEntity problemsEntity) {
        return null;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ProblemSetsEntityRowMapper implements RowMapper<ContestRanklistEntity> {
        @Override
        public ContestRanklistEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestRanklistEntity entity = new ContestRanklistEntity();
            return entity;
        }
    }
}
