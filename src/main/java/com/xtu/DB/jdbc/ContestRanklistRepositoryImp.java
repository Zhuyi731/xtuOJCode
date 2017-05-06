package com.xtu.DB.jdbc;

import com.xtu.DB.ContestRanklistRepository;
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
public class ContestRanklistRepositoryImp implements ContestRanklistRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    @Override
    public ContestRanklistEntity queryOne(int userId, int contestId) {
        String sql = "SELECT * FROM " + Tables.CONTEST_RANKLIST
                + " WHERE `user_id` = ?" +
                " AND `contest_id` = ?";
        return jdbcOperations.queryForObject(
                sql,
                new ContestRanklistEntityRowMapper(),
                userId,
                contestId);
    }

    @Override
    public List<ContestRanklistEntity> queryList(int contestId) {
        String sql = "SELECT * FROM " +
                Tables.CONTEST_RANKLIST +
                " WHERE `contest_id` = ? " +
                " ORDER BY `tot_score` ASC ";
//                " Limit ?,?";
        return jdbcOperations.query(sql,
                new ContestRanklistEntityRowMapper(),
                contestId);
    }


    private static final class ContestRanklistEntityRowMapper implements RowMapper<ContestRanklistEntity> {
        @Override
        public ContestRanklistEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestRanklistEntity entity = new ContestRanklistEntity();
            entity.setContestId(rs.getInt("contest_id"));
            entity.setUserId(rs.getInt("user_id"));
            entity.setSlotInformation(rs.getString("slot_information"));
            entity.setRegisterTime(rs.getTimestamp("register_time"));
            entity.setLastLoginTime(rs.getTimestamp("last_login_ip"));
            entity.setLastLoginIp(rs.getString("last_login_ip"));
            entity.setTotScore(rs.getShort("tot_score"));
            entity.setAcProblemsNum(rs.getByte("ac_problems_num"));
            entity.setPenalty(rs.getInt("penalty"));
            return entity;
        }
    }
}
