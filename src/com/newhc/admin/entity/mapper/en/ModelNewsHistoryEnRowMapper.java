package com.newhc.admin.entity.mapper.en;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.newhc.admin.entity.en.ModelNewsCenterEn;


public class ModelNewsHistoryEnRowMapper implements RowMapper{

	public Object mapRow(ResultSet rs, int row) throws SQLException {
		ModelNewsCenterEn mnh = new ModelNewsCenterEn();
		mnh.setId(new Integer(rs.getInt("id")));
	
		mnh.setStatus(new Integer(rs.getInt("status")));
		mnh.setSequence(new Integer(rs.getInt("sequence")));
		mnh.setCreator(rs.getString("creator"));
		mnh.setCreateTime(rs.getTimestamp("create_time"));
		return mnh;
	}

}
