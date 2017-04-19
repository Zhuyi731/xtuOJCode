package com.xtu.DB.jdbc;

import com.xtu.DB.ProblemSetDetailRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemSetDetailEntity;
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
public class ProblemSetDetailRepositoryImp implements ProblemSetDetailRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.PROBLEM_SET_DETAIL;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    @Override
    public ProblemSetDetailEntity findOne(String problemId) {
        String finduserSql = "SELECT * FROM " + Tables.PROBLEM_SET_DETAIL
                + " WHERE problem_id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId);
    }

    @Override
    public List<ProblemSetDetailEntity> find(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM "
                + Tables.PROBLEM_SET_DETAIL +
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
    public ProblemSetDetailEntity save(ProblemSetDetailEntity problemsEntity) {
        return null;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ProblemSetsEntityRowMapper implements RowMapper<ProblemSetDetailEntity> {
        @Override
        public ProblemSetDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ProblemSetDetailEntity entity = new ProblemSetDetailEntity();
            entity.setProblemSetId(rs.getInt("problem_set_id"));
            entity.setNo(rs.getShort("no"));
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setNotice(rs.getString("notice"));
            return entity;
        }
    }
}
