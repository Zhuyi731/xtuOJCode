package com.xtu.DB.jdbc;

import com.xtu.DB.TestdatasRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.TestdatasEntity;
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
public class TestdatasRepositoryImp implements TestdatasRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.TESTDATAS;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    @Override
    public TestdatasEntity findOne(int problemId) {
        String finduserSql = "SELECT * FROM " + Tables.TESTDATAS
                + " WHERE problem_id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId);
    }

    @Override
    public TestdatasEntity findOne(int problemId, short no) {
        String finduserSql = "SELECT * FROM " + Tables.TESTDATAS
                + " WHERE problem_id = ?" +
                " and no = ?";

        TestdatasEntity entity = jdbcOperations.queryForObject(
                finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId,
                no);
        return entity;
    }

    @Override
    public TestdatasEntity queryOne(int problemId, short no) {
        String finduserSql = "SELECT * FROM " + Tables.TESTDATAS
                + " WHERE problem_id = ?" +
                " and no = ?";
        List<TestdatasEntity> testdatasEntityList = jdbcOperations.query(finduserSql,
                new ProblemSetsEntityRowMapper(),
                problemId,
                no);
        if (null == testdatasEntityList || 0 == testdatasEntityList.size()) {
            return null;
        }
        return testdatasEntityList.get(0);
    }

    @Override
    public List<TestdatasEntity> find(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM "
                + Tables.TESTDATAS +
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
    public TestdatasEntity inset(TestdatasEntity testdatasEntity) {
        String sql = "insert into " +
                Tables.TESTDATAS +
                "(`problem_id`, `no`, `score`, `input`, `output`,`owner`)" +
                " values(?, ?, ?, ?, ?, ?)";
        jdbcOperations.update(sql,
                testdatasEntity.getProblemId(),
                testdatasEntity.getNo(),
                testdatasEntity.getScore(),
                testdatasEntity.getInput(),
                testdatasEntity.getOutput(),
                testdatasEntity.getOwner());
        return testdatasEntity;
    }

    @Override
    public TestdatasEntity update(TestdatasEntity testdatasEntity) {
        String sql = "update " +
                Tables.TESTDATAS +
                " set `score` = ?," +
                " `input` = ?," +
                " `output` = ?," +
                " `owner` = ?" +
                " where `problem_id` = ?" +
                " and `no` = ?";
        jdbcOperations.update(sql,
                testdatasEntity.getScore(),
                testdatasEntity.getInput(),
                testdatasEntity.getOutput(),
                testdatasEntity.getOwner(),
                testdatasEntity.getProblemId(),
                testdatasEntity.getNo());
        return testdatasEntity;
    }

    @Override
    public TestdatasEntity save(TestdatasEntity testdatasEntity) {
        TestdatasEntity entity = queryOne(testdatasEntity.getProblemId(), testdatasEntity.getNo());
        if (null == entity) {
           inset(testdatasEntity);
        } else {
            update(testdatasEntity);
        }
        return testdatasEntity;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ProblemSetsEntityRowMapper implements RowMapper<TestdatasEntity> {
        @Override
        public TestdatasEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            TestdatasEntity entity = new TestdatasEntity();
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setNo(rs.getShort("no"));
            entity.setScore(rs.getByte("score"));
            entity.setInput(rs.getBytes("input"));
            entity.setOutput(rs.getBytes("output"));
            entity.setCreateTime(rs.getTimestamp("create_time"));
            entity.setLastUpdateTime(rs.getTimestamp("last_update_time"));
            entity.setOwner(rs.getInt("owner"));
            return entity;
        }
    }
}
