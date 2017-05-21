package com.xtu.DB.jdbc;

import com.xtu.DB.ProblemSetsRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemSetsEntity;
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
public class ProblemSetsRepositoryImp implements ProblemSetsRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.PROBLEM_SETS;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    @Override
    public ProblemSetsEntity findOne(String problemId) {
        String finduserSql = "SELECT * FROM " + Tables.PROBLEM_SETS
                + " WHERE problem_id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId);
    }

    @Override
    public List<ProblemSetsEntity> find(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM "
                + Tables.PROBLEM_SETS +
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
    public ProblemSetsEntity save(ProblemSetsEntity problemsEntity) {
        return null;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ProblemSetsEntityRowMapper implements RowMapper<ProblemSetsEntity> {
        @Override
        public ProblemSetsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ProblemSetsEntity entity = new ProblemSetsEntity();
            entity.setProblemSetId(rs.getInt("problem_set_id"));
            entity.setOwner(rs.getInt("owner"));
            entity.setTitle(rs.getString("title"));
            entity.setOwner(rs.getInt("owner"));
            entity.setPassword(rs.getString("password"));
            entity.setDescription(rs.getString("description"));
            entity.setCreateTime(rs.getTimestamp("create_time"));
            entity.setLastUpdateTime(rs.getTimestamp("last_update_time"));
            return entity;
        }
    }
}
