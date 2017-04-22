package com.xtu.DB.jdbc;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.vo.ModifyProblemsEntityVO;
import com.xtu.DB.vo.ModifyProblemsVO;
import com.xtu.DB.vo.ProblemsEntityVO;
import com.xtu.DB.vo.ProblemsVO;
import com.xtu.constant.Constant;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

    public Long queryMaxId() {
        String sql = "select max(`problem_id`) from " +
                Tables.PROBLEMS;
        Long id = jdbcOperations.queryForObject(sql,
                Long.class);
        return id;
    }

    @Override
    public ProblemsVO queryPage(int start, int size) {
        String finduserSql = "SELECT * FROM " +
                Tables.PROBLEMS +
                " Limit ?,?";
        List<ProblemsEntity> entityList = jdbcOperations.query(finduserSql,
                new ProblemsEntityRowMapper(), start * size, size);

        ProblemsVO vo = new ProblemsVO();
        List<ProblemsEntityVO> voList = new ArrayList<>();
        for (ProblemsEntity entity : entityList) {
            ProblemsEntityVO entityVO = new ProblemsEntityVO();
            entityVO.setProblemId(entity.getProblemId());
            entityVO.setTitle(entity.getTitle());
            entityVO.setAcProblemsNum(100);
            entityVO.setSubmitProblemsNum(101);
            entityVO.setRatio(100 * 100 / 101);
            voList.add(entityVO);
        }
        vo.setEntityList(voList);
        return vo;
    }

    @Override
    public ProblemsVO queryPage(int start) {
        return queryPage(start, Integer.parseInt(Constant.PAGE_SIZE));
    }

    @Override
    public ModifyProblemsVO queryPage(int start, int size, String id) {
        String finduserSql = "SELECT * FROM " +
                Tables.PROBLEMS +
                " Limit ?,?";
        List<ProblemsEntity> entityList = jdbcOperations.query(finduserSql,
                new ProblemsEntityRowMapper(), start * size, size);

        ModifyProblemsVO vo = new ModifyProblemsVO();
        List<ModifyProblemsEntityVO> voList = new ArrayList<>();
        for (ProblemsEntity entity : entityList) {
            ModifyProblemsEntityVO entityVO = new ModifyProblemsEntityVO();
            entityVO.setProblemId(entity.getProblemId());
            entityVO.setTitle(entity.getTitle());
            entityVO.setAcProblemsNum(100);
            entityVO.setSubmitProblemsNum(101);
            entityVO.setRatio(100 * 100 / 101);
            voList.add(entityVO);
        }
        vo.setEntityList(voList);
        return null;
    }

    @Override
    public ModifyProblemsVO queryPage(int start, String id) {
        return queryPage(start, Integer.parseInt(Constant.PAGE_SIZE), id);
    }

    @Override
    public ProblemsEntity findOne(ProblemsDTO problemsDTO) {
        String finduserSql = "SELECT * FROM " +
                Tables.PROBLEMS +
                " WHERE `title` = ? OR `problem_id` = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new ProblemsEntityRowMapper(),
                problemsDTO.getTitle(),
                problemsDTO.getProblemId());
    }

    @Override
    public ProblemsEntity queryOne(int problem_id) {
        String finduserSql = "SELECT * FROM " +
                Tables.PROBLEMS +
                " WHERE problem_id = ? ";
        List<ProblemsEntity> problemsEntityList = jdbcOperations.query(
                finduserSql,
                new ProblemsEntityRowMapper(),
                problem_id);
        if (null == problemsEntityList || problemsEntityList.size() == 0) {
            return null;
        }
        return problemsEntityList.get(0);
    }

    @Override
    public ProblemsEntity insert(ProblemsEntity problemsEntity) {
        String sql = "insert into " +
                Tables.PROBLEMS +
                "(`problem_id`, `title`, `status`" +
                ",`validator_id`, `time_limit`, `memory_limit`" +
                ", `author`, `source`, `owner`, `context`)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcOperations.update(sql,
                problemsEntity.getProblemId(),
                problemsEntity.getTitle(),
                problemsEntity.getStatus(),
                problemsEntity.getValidatorId(),
                problemsEntity.getTimeLimit(),
                problemsEntity.getMemoryLimit(),
                problemsEntity.getAuthor(),
                problemsEntity.getSource(),
                problemsEntity.getOwner(),
                problemsEntity.getContext());
        problemsEntity.setProblemId(queryMaxId().byteValue());
        return problemsEntity;
    }

    @Override
    public ProblemsEntity update(ProblemsEntity problemsEntity) {
        String sql = "UPDATE " +
                Tables.PROBLEMS +
                " set `title` = ?," +
                " `status` = ?," +
                " `validator_id` = ?," +
                " `time_limit` = ?," +
                " `memory_limit` = ?," +
                " `author` = ?," +
                " `source` = ?," +
                " `owner` = ?," +
                " `context` = ?" +
                " where problem_id = ?";
        jdbcOperations.update(sql,
                problemsEntity.getTitle(),
                problemsEntity.getStatus(),
                problemsEntity.getValidatorId(),
                problemsEntity.getTimeLimit(),
                problemsEntity.getMemoryLimit(),
                problemsEntity.getAuthor(),
                problemsEntity.getSource(),
                problemsEntity.getOwner(),
                problemsEntity.getContext(),
                problemsEntity.getProblemId());
        return problemsEntity;
    }

    @Override
    public ProblemsEntity save(ProblemsEntity problemsEntity) {
        ProblemsEntity entity = queryOne(problemsEntity.getProblemId());
        if (null == entity) {
            insert(problemsEntity);
        } else {
            update(problemsEntity);
        }
        return problemsEntity;
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

    private static final class EntitysRowMapper implements RowMapper<ProblemsEntity> {
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
