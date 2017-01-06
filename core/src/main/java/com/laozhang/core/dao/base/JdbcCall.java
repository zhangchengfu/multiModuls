package com.laozhang.core.dao.base;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

/**
 * 调用存储过程
 * @description:Calling a stored function using SimpleJdbcCall
 * @author zhang chengfu
 * @date 2016-7-4下午10:19:12
 */

/*
 * CREATE FUNCTION get_actor_name (in_id INTEGER) RETURNS VARCHAR(200) READS SQL
 * DATA BEGIN DECLARE out_name VARCHAR(200); SELECT concat(first_name, ' ',
 * last_name) INTO out_name FROM t_actor where id = in_id; RETURN out_name; END;
 */
@Repository
public class JdbcCall {
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcCall call;

	public JdbcCall() {

	}
	@Autowired
	public JdbcCall(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.setResultsMapCaseInsensitive(true);
		this.call = new SimpleJdbcCall(jdbcTemplate).withFunctionName("get_actor_name");
	}
	
	public String getActorName(Long id) {
		SqlParameterSource in = new MapSqlParameterSource().addValue("in_id", id);
		String name = call.executeObject(String.class, in);
		return name;
	}
}
