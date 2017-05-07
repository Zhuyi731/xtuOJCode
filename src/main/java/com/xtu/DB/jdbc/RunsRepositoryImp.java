package com.xtu.DB.jdbc;

import com.xtu.DB.RunsRepository;
import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.StatusDTO;
import com.xtu.DB.dto.SubmitContestDTO;
import com.xtu.DB.dto.SubmitDTO;
import com.xtu.DB.entity.RunsUsersEntity;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.DB.vo.RankEntityVO;
import com.xtu.DB.vo.RankVO;
import com.xtu.DB.vo.StatusEntityVO;
import com.xtu.DB.vo.StatusVO;
import com.xtu.constant.Constant;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/21.
 */
@Repository
public class RunsRepositoryImp implements RunsRepository {
    @Autowired
    JdbcOperations jdbcOperations;
    @Autowired
    UsersRepository usersRepository;

    @Override
    public StatusEntityVO queryCode(int runsId, String id) {
        String sql = "SELECT `runs`.`run_id`, `runs`.`problem_id`, `runs`.`result_code`,  " +
                "`runs`.`run_time`, `runs`.`run_memory`, `runs`.`language`,`runs`.`code`, " +
                " LENGTH(`runs`.`code`) code_length, `runs`.`open`," +
                " `runs`.`result_msg`, `runs`.`submit_time`, `runs`.`contest_id`, `runs`.`no`, " +
                " `users`.`name`, `users`.`id` " +
                " FROM runs LEFT JOIN users ON runs.`user_id` = users.`user_id` " +
                " WHERE `run_id` = ?";
        StatusEntityVO entity = jdbcOperations.queryForObject(sql, new StatusEntityVORowMapper(), runsId);
        return entity;
    }

    @Override
    public Map<String, Integer> queryNum(int problemId) {
        String sql = "SELECT IF(COUNT(`run_id`) = 0, 0,SUM(IF(`result_code` = 1,1,0)))acProblemsNum," +
                " COUNT(`run_id`) submitProblemsNum FROM " +
                Tables.RUNS +
                " WHERE `problem_id` = ?";
        Map<String, Object> map = jdbcOperations.queryForMap(sql, problemId);
        Map<String, Integer> resMap = new HashMap<>();
        resMap.put("acProblemsNum", Integer.parseInt(map.get("acProblemsNum").toString()));
        resMap.put("submitProblemsNum", Integer.parseInt(map.get("submitProblemsNum").toString()));
        return resMap;
    }

    @Override
    public Map<String, Integer> queryContestNum(int problemId, int contestId, byte no) {
        String sql = "SELECT IF(COUNT(`run_id`) = 0, 0,SUM(IF(`result_code` = 1,1,0)))acProblemsNum," +
                " COUNT(`run_id`) submitProblemsNum FROM " +
                Tables.RUNS +
                " WHERE `problem_id` = ? AND `contest_id` = ? AND `no` = ?";
        Map<String, Object> map = jdbcOperations.queryForMap(sql, problemId, contestId, no);
        Map<String, Integer> resMap = new HashMap<>();
        resMap.put("no", (int) no);
        resMap.put("acProblemsNum", Integer.parseInt(map.get("acProblemsNum").toString()));
        resMap.put("submitProblemsNum", Integer.parseInt(map.get("submitProblemsNum").toString()));
        return resMap;
    }

    @Override
    public Long rankListCount() {
        String sql = "SELECT COUNT( DISTINCT `user_id`) FROM " +
                Tables.RUNS;
        return jdbcOperations.queryForObject(sql, Long.class);
    }


    @Override
    public RankVO queryRankList(int start, int size) {
        String sql = "SELECT `users`.`id`, " +
                " `users`.`name`, " +
                " `users`.`class_id`," +
                " SUM(IF(`runs`.`result_code`=1, 1, 0)) `acProblemsNum`," +
                " COUNT(`runs`.`run_id`) `submitProblemsNum` " +
                " FROM `runs` LEFT JOIN `users` ON `runs`.`user_id` = `users`.`user_id`" +
                " GROUP BY `runs`.`user_id`" +
                " ORDER BY `acProblemsNum` DESC, `submitProblemsNum` ASC " +
                " LIMIT ?,?";
        List<RankEntityVO> entityList = jdbcOperations.query(sql,
                new RankEntityVORowMapper(), start * size, size);
        RankVO vo = new RankVO();
        vo.setEntityList(entityList);
        vo.setStart(start);
        vo.setTotal(rankListCount());
        return vo;
    }

    @Override
    public RankVO queryRankList(int start) {
        return queryRankList(start, Integer.parseInt(Constant.PAGE_SIZE));
    }

    @Override
    public Long contestRankListCount() {
        return null;
    }

    @Override
    public RankVO queryContestRankList(int start) {
        return null;
    }

    @Override
    public Long statusListCount() {
        String sql = "SELECT COUNT(`run_id`) FROM " +
                Tables.RUNS;
        return jdbcOperations.queryForObject(sql,
                Long.class);
    }

    @Override
    public StatusVO queryStatusList(int start, int size) {
        String sql = "SELECT `runs`.`run_id`, `runs`.`problem_id`, `runs`.`result_code`, " +
                "`runs`.`run_time`, `runs`.`run_memory`, `runs`.`language`, `runs`.`code`, LENGTH(`runs`.`code`) code_length," +
                " `runs`.`result_msg`, `runs`.`submit_time`, `runs`.`contest_id`, `runs`.`no`,`runs`.`open`," +
                "`users`.`name`, `users`.`id`" +
                " FROM runs LEFT JOIN users ON runs.`user_id` = users.`user_id`" +
                " ORDER BY `runs`.`submit_time` DESC" +
                " LIMIT ?, ?;";
        List<StatusEntityVO> entityList = jdbcOperations.query(sql,
                new StatusEntityVORowMapper(), start * size, size);

//        hideCode(entityList);

        StatusVO vo = new StatusVO();
        vo.setEntityList(entityList);
        vo.setStart(start);
        vo.setTotal(statusListCount());
        return vo;
    }

    @Override
    public StatusVO queryStatusList(int start) {
        return queryStatusList(start, Integer.parseInt(Constant.PAGE_SIZE));
    }

    @Override
    public StatusVO queryStatusList(int start, int size, StatusDTO statusDTO) {
        String sql = "SELECT `runs`.`run_id`, `runs`.`problem_id`, `runs`.`result_code`, " +
                "`runs`.`run_time`, `runs`.`run_memory`, `runs`.`language`,`runs`.`code`,LENGTH(`runs`.`code`) code_length," +
                " `runs`.`result_msg`, `runs`.`submit_time`, `runs`.`contest_id`, `runs`.`no`, `runs`.`open`," +
                "`users`.`name`, `users`.`id`" +
                " FROM runs LEFT JOIN users ON runs.`user_id` = users.`user_id`" +
                " WHERE run_id != 0 ";
        if (null != statusDTO.getId() && !"".equals(statusDTO.getId())) {
            sql += " AND `id` = ?";
        } else {
            sql += " AND `id` != ?";
//            statusDTO.setId("(^_^)");
        }
        if (statusDTO.getProblemId() != 0) {
            sql += " AND `problem_id` = ?";
        } else {
            sql += " AND `problem_id` != ?";
        }
        if (statusDTO.getResultCode() != 0) {
            sql += " AND `result_code` = ?";
        } else {
            sql += " AND `result_code` != ?";
        }
        if (null != statusDTO.getLanguage()
                && !"".equals(statusDTO.getLanguage())
                && !"0".equals(statusDTO.getLanguage())) {
            sql += " AND `language` = ?";
        } else {
            sql += " AND `language` != ?";
//            statusDTO.setLanguage("(^_^)");
        }

        sql += " ORDER BY `runs`.`submit_time` DESC, `run_id` ASC " +
                " LIMIT ?, ?";
        List<StatusEntityVO> entityList = jdbcOperations.query(sql,
                new StatusEntityVORowMapper(),
                statusDTO.getId(),
                statusDTO.getProblemId(),
                statusDTO.getResultCode(),
                statusDTO.getLanguage(),
                start * size, size);

//        hideCode(entityList);

        StatusVO vo = new StatusVO();
        vo.setEntityList(entityList);
        vo.setTotal(queryStatusListTotal(statusDTO));
        vo.setStart(start);
        return vo;
    }

    @Override
    public Long queryStatusListTotal(StatusDTO statusDTO) {
        String sql = "SELECT COUNT(`run_id`) " +
                " FROM runs LEFT JOIN users ON runs.`user_id` = users.`user_id`" +
                " WHERE run_id != 0";
        if (null != statusDTO.getId() && !"".equals(statusDTO.getId())) {
            sql += " AND `id` = ?";
        } else {
            sql += " AND `id` != ?";
//            statusDTO.setId("(^_^)");
        }
        if (statusDTO.getProblemId() != 0) {
            sql += " AND `problem_id` = ?";
        } else {
            sql += " AND `problem_id` != ?";
        }
        if (statusDTO.getResultCode() != 0) {
            sql += " AND `result_code` = ?";
        } else {
            sql += " AND `result_code` != ?";
        }
        if (null != statusDTO.getLanguage() &&
                !"0".equals(statusDTO.getLanguage()) &&
                !"".equals(statusDTO.getLanguage())) {
            sql += " AND `language` = ?";
        } else {
            sql += " AND `language` != ?";
//            statusDTO.setLanguage("(^_^)");
        }
        return jdbcOperations.queryForObject(sql,
                Long.class,
                statusDTO.getId(),
                statusDTO.getProblemId(),
                statusDTO.getResultCode(),
                statusDTO.getLanguage());
    }

    private void hideCode(List<StatusEntityVO> entityList) {
        for (StatusEntityVO vo : entityList) {
            vo.setCode("");
        }
    }

    @Override
    public StatusVO queryStatusList(int start, StatusDTO statusDTO) {
        return queryStatusList(start, Integer.parseInt(Constant.PAGE_SIZE), statusDTO);
    }

    @Override
    public void save(SubmitDTO submitDTO) {
        UsersEntity usersEntity = usersRepository.findOne(submitDTO.getId());
        String sql = "INSERT INTO " +
                Tables.RUNS +
                " (`user_id`, `problem_id`, `code`, `language`,`open`) " +
                "VALUES (?, ?, ?, ?, ?)";
        jdbcOperations.update(sql,
                usersEntity.getUserId(),
                submitDTO.getProblemId(),
                submitDTO.getCode(),
                submitDTO.getLanguage(),
                submitDTO.getOpen());
    }

    @Override
    public void save(SubmitContestDTO submitContestDTO) {
        String sql = "INSERT INTO " +
                Tables.RUNS +
                " (`user_id`, `problem_id`, `contest_id`, `no`, `code`, `language`,`open`," +
                " `result_code`, `result_msg` )" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcOperations.update(sql,
                submitContestDTO.getUserId(),
                submitContestDTO.getProblemId(),
                submitContestDTO.getContestId(),
                submitContestDTO.getNo(),
                submitContestDTO.getCode(),
                submitContestDTO.getLanguage(),
                submitContestDTO.getOpen(),
                10, // 表示刚刚提交的状态
                "@_@"); // just for fun
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

    private static final class RankEntityVORowMapper implements RowMapper<RankEntityVO> {

        @Override
        public RankEntityVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            RankEntityVO entity = new RankEntityVO();
            entity.setId(rs.getString("id"));
            entity.setName(rs.getString("name"));
            entity.setClassId(rs.getString("class_id"));
            entity.setAcProblemsNum(rs.getInt("acProblemsNum"));
            entity.setSubmitProblemsNum(rs.getInt("submitProblemsNum"));
            return entity;
        }
    }

    private static final class StatusEntityVORowMapper implements RowMapper<StatusEntityVO> {

        @Override
        public StatusEntityVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            StatusEntityVO entity = new StatusEntityVO();
            entity.setRunId(rs.getInt("run_id"));
            entity.setProblemId(rs.getInt("problem_id"));
            entity.setContestId(rs.getInt("contest_id"));
            entity.setNo(rs.getByte("no"));
            entity.setCode(rs.getString("code"));
            entity.setCodeLength(rs.getLong("code_length"));
            entity.setLanguage(rs.getString("language"));
            entity.setRunTime(rs.getInt("run_time"));
            entity.setRunMemory(rs.getInt("run_memory"));
            entity.setResultCode(rs.getByte("result_code"));
            entity.setResultMsg(rs.getString("result_msg"));
            entity.setSubmitTime(rs.getTimestamp("submit_time"));
            entity.setOpen(rs.getByte("open"));

            entity.setId(rs.getString("id"));
            entity.setName(rs.getString("name"));
            return entity;
        }
    }
}
