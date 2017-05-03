package com.xtu.DB.jdbc;

import com.xtu.DB.ContestDetailRepository;
import com.xtu.DB.entity.ContestDetailEntity;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/30.
 */
@Repository
public class ContestDetailRepositoryImp implements ContestDetailRepository {
    @Autowired
    JdbcOperations jdbcOperations;

    @Override
    public ContestDetailEntity queryOne(int userId, int contestId, int no) {
        String sql = "SELECT * FROM " +
                Tables.CONTEST_DETAIL +
                " WHERE `contest_id` = ?" +
                " AND `user_id` =?" +
                " AND  `no` = ?";
        return jdbcOperations.queryForObject(sql,
                new ContestDetailEntityRowMapper(),
                contestId,
                userId,
                no);
    }

    @Override
    public List<ContestDetailEntity> queryList(int userId, int contestId) {
        String sql = "SELECT * FROM " +
                Tables.CONTEST_DETAIL +
                " WHERE `user_id` = ?" +
                " AND `contest_id` = ?";
        return jdbcOperations.query(sql,
                new ContestDetailEntityRowMapper(),
                userId,
                contestId);
    }

    private final class ContestDetailEntityRowMapper implements RowMapper<ContestDetailEntity> {

        @Override
        public ContestDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestDetailEntity entity = new ContestDetailEntity();
            entity.setUserId(rs.getInt("user_id"));
            entity.setContestId(rs.getInt("contest_id"));
            entity.setNo(rs.getByte("no"));
            entity.setAcceptedTime(rs.getInt("accepted_time"));
            entity.setPenaltyTimes(rs.getShort("penalty_times"));
            entity.setScore(rs.getShort("score"));
            entity.setFirstBlood(rs.getByte("first_blood"));
            entity.setFrozenSubmitTimes(rs.getByte("frozen_submit_times"));
            entity.setBalloon(rs.getByte("balloon"));
            return entity;
        }
    }
}
