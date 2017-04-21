package com.xtu.DB.jdbc;

import com.xtu.DB.RunsRepository;
import com.xtu.DB.entity.RunsUsersEntity;
import com.xtu.DB.vo.RankListVO;
import com.xtu.constant.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/21.
 */
@Repository
public class RunsRepositoryImp implements RunsRepository {
    @Autowired
    JdbcOperations jdbcOperations;

    @Override
    public List<RankListVO> queryRankList(int start, int size) {
        String sql = "SELECT `users`.`id`, " +
                " `users`.`name`, " +
                " `users`.`class_id`," +
                " SUM(IF(`runs`.`result_code`=1, 1, 0)) `acProblemsNum`," +
                " COUNT(`runs`.`run_id`) `submitProblemsNum` " +
                " FROM `runs` LEFT JOIN `users` ON `runs`.`user_id` = `users`.`user_id`" +
                " GROUP BY `runs`.`user_id`" +
                " ORDER BY `acProblemsNum` DESC, `submitProblemsNum` ASC " +
                " LIMIT ?,?";
        return jdbcOperations.query(sql,
                new RankListVORowMapper(),
                start,
                size);
    }

    @Override
    public List<RankListVO> queryRankList(int start) {
        return queryRankList(start, Integer.parseInt(Constant.PAGE_SIZE));
    }

    @Override
    public List<RankListVO> queryContextRankList(int start) {
        return null;
    }

    private static final class RunsEntityRowMapper implements RowMapper<RunsUsersEntity> {

        @Override
        public RunsUsersEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            RunsUsersEntity entity = new RunsUsersEntity();
            entity.setUserId(rs.getInt("user_id"));
            entity.setRoleId(rs.getInt("role_id"));
            entity.setId(rs.getString("id"));
            entity.setName(rs.getString("name"));
            entity.setClassId(rs.getString("class_id"));
            entity.setNickname(rs.getString("nickname"));
            entity.setPassword(rs.getString("password"));
            entity.setStatus(rs.getByte("status"));
            entity.setEmail(rs.getString("email"));
            entity.setEmailOpen(rs.getString("email_open"));
            entity.setQq(rs.getString("QQ"));
            entity.setQqOpen(rs.getString("QQ_open"));
            entity.setPhone(rs.getString("phone"));
            entity.setPhoneOpen(rs.getString("phone_open"));
            entity.setLastLoginTime(rs.getTimestamp("last_login_time"));
            entity.setRegisterTime(rs.getTimestamp("register_time"));

            entity.setRunId(rs.getInt("run_id"));
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setContestId(rs.getInt("contest_id"));
            entity.setNo(rs.getByte("no"));
            entity.setCode(rs.getString("code"));
            entity.setLanguage(rs.getString("language"));
            entity.setRunTime(rs.getInt("run_time"));
            entity.setRunMemory(rs.getInt("run_memory"));
            entity.setResultCode(rs.getByte("result_code"));
            entity.setResultMsg(rs.getString("result_msg"));
            entity.setSubmitTime(rs.getTimestamp("submit_time"));
            entity.setOpen(rs.getByte("open"));
            return entity;
        }
    }

    private static final class RankListVORowMapper implements RowMapper<RankListVO> {

        @Override
        public RankListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            RankListVO entity = new RankListVO();
            entity.setId(rs.getString("id"));
            entity.setName(rs.getString("name"));
            entity.setClassId(rs.getString("class_id"));
            entity.setAcProblemsNum(rs.getInt("acProblemsNum"));
            entity.setSubmitProblemsNum(rs.getInt("submitProblemsNum"));
            return entity;
        }
    }
}
