package com.xtu.DB.jdbc;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;
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
public class ProblemsRepositoryImp implements ProblemsRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.PROBLEMS;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    @Override
    public ProblemsEntity findOne(String problemId) {
        String finduserSql = "SELECT * FROM " + Tables.PROBLEMS
                + " WHERE problem_id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemsEntityRowMapper(),
                problemId);
    }

    @Override
    public List<ProblemsEntity> find(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM "
                + Tables.PROBLEMS +
//                + " WHERE problem_id = ? " +
                " Limit ?,?";
        return jdbcOperations.query(
                finduserSql,
                new ProblemsEntityRowMapper(),
//                problemsDTO.getProblemId(),
                problemsDTO.getStart(),
                problemsDTO.getSize());
    }

    @Override
    public ProblemsEntity save(ProblemsEntity problemsEntity) {
        return null;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ProblemsEntityRowMapper implements RowMapper<ProblemsEntity> {
        @Override
        public ProblemsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ProblemsEntity entity = new ProblemsEntity();
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setTitle(rs.getString("title"));
            entity.setStatus(rs.getByte("status"));
            entity.setValidatorId(rs.getShort("validator_id"));
            entity.setTimeLimit(rs.getShort("time_limit"));
            entity.setMemoryLimit(rs.getShort("memory_limit"));
            entity.setAuthor(rs.getString("author"));
            entity.setSource(rs.getString("source"));
            entity.setOwner(rs.getInt("owner"));
            entity.setContext(rs.getString("context"));
            entity.setCreateTime(rs.getTimestamp("create_time"));
            entity.setLastUpdateTime(rs.getTimestamp("last_update_time"));
            return entity;
        }
    }
}
