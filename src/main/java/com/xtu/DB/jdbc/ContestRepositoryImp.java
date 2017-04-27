package com.xtu.DB.jdbc;

import com.xtu.DB.ContestRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestsEntity;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/25.
 */
@Repository
public class ContestRepositoryImp implements ContestRepository {
    @Autowired
    JdbcOperations jdbcOperations;

    @Override
    public Long count() {
        return null;
    }

    @Override
    public ContestsEntity findOne(int contestId) {
        String sql = "select * from "+
                Tables.CONTESTS +
                " from where `contest_id` = ?";
        jdbcOperations.queryForObject(sql, new ContestsEntityRowMapper(), contestId);
        return null;
    }

    @Override
    public List<ContestsEntity> find(ProblemsDTO problemsDTO) {
        return null;
    }

    @Override
    public ContestsEntity save(ContestsEntity contestsEntity) {
        if (contestsEntity.getContestId() == 0) {
            insert(contestsEntity);
        } else {
            update(contestsEntity);
        }
        return contestsEntity;
    }

    public Integer queryOne(String title) {
        String sql = "select `contest_id` from "
                + Tables.CONTESTS +
                " where title = ?" +
                " ORDER BY create_time DESC " +
                " limit 1";
        Map<String, Object> map = jdbcOperations.queryForMap(sql, title);
        int res = Integer.parseInt(map.get("contest_id").toString());
        return res;
    }

    @Override
    public ContestsEntity insert(ContestsEntity contestsEntity) {
        String sql = "INSERT INTO `contests` (`title`, `start_time`, `frozen_start_time`, `end_time`,  " +
                "`type`,`online`,`status`,`register_start_time`, `register_end_time`, " +
                "`description`,`anouncement`, `owner`)  " +
                "VALUES (?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?)";
        jdbcOperations.update(sql,
                contestsEntity.getTitle(),
                contestsEntity.getStartTime(),
                contestsEntity.getFrozenStartTime(),
                contestsEntity.getEndTime(),
                contestsEntity.getType(),
                contestsEntity.getOnline(),
                contestsEntity.getStatus(),
                contestsEntity.getRegisterStartTime(),
                contestsEntity.getRegisterEndTime(),
                contestsEntity.getDescription(),
                contestsEntity.getAnnouncement(),
                contestsEntity.getOwner());
        int contestId = queryOne(contestsEntity.getTitle());
        contestsEntity.setContestId(contestId);
        return contestsEntity;
    }

    @Override
    public ContestsEntity update(ContestsEntity contestsEntity) {
        String sql = "UPDATE `contests` SET" +
                "`title` = ?," +
                "`start_time` = ?," +
                "`frozen_start_time` = ?," +
                "`end_time` = ?,  " +
                "`type` = ?," +
                "`online` = ?," +
                "`status` = ?," +
                "`register_start_time` = ?," +
                "`register_end_time` = ?, " +
                "`description` = ?," +
                "`anouncement` = ? " +
                " WHERE `contest_id` = ?";
        jdbcOperations.update(sql,
                contestsEntity.getTitle(),
                contestsEntity.getStartTime(),
                contestsEntity.getFrozenStartTime(),
                contestsEntity.getEndTime(),
                contestsEntity.getType(),
                contestsEntity.getOnline(),
                contestsEntity.getStatus(),
                contestsEntity.getRegisterStartTime(),
                contestsEntity.getRegisterEndTime(),
                contestsEntity.getDescription(),
                contestsEntity.getAnnouncement(),
                contestsEntity.getContestId());
        return contestsEntity;
    }

    @Override
    public void delete(long id) {

    }

    private static final class ContestsEntityRowMapper implements RowMapper<ContestsEntity> {
        @Override
        public ContestsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestsEntity entity = new ContestsEntity();
            entity.setContestId(rs.getInt("contest_id"));
            entity.setTitle(rs.getString("title"));
            entity.setStartTime(rs.getTimestamp("start_time"));
            entity.setFrozenStartTime(rs.getTimestamp("frozen_start_timeA"));
            entity.setEndTime(rs.getTimestamp("end_time"));
            entity.setType(rs.getByte("type"));
            entity.setOnline(rs.getByte("online"));
            entity.setStatus(rs.getByte("status"));
            entity.setRegisterStartTime(rs.getTimestamp("register_start_time"));
            entity.setRegisterEndTime(rs.getTimestamp("register_end_time"));
            entity.setDescription(rs.getString("description"));
            entity.setAnnouncement(rs.getString("announcement"));
            entity.setOwner(rs.getInt("owner"));
            entity.setCreateTime(rs.getTimestamp("last_update_time"));
            return entity;
        }
    }
}
