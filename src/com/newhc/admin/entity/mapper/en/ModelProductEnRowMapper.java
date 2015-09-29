package com.newhc.admin.entity.mapper.en;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.newhc.admin.entity.en.ModelProductEn;

public class ModelProductEnRowMapper implements RowMapper{
	public Object mapRow(ResultSet rs,int row) throws SQLException{
		ModelProductEn mp = new ModelProductEn();
		mp.setId(new Integer(rs.getInt("id")));
		mp.setName(rs.getString("name"));
		mp.setNowPrice(new Double(rs.getDouble("now_price")));
		mp.setSequence(new Integer(rs.getInt("sequence")));
		mp.setStatus(new Integer(rs.getInt("status")));
		mp.setPubTime(rs.getTimestamp("pub_time"));
		mp.setCreateTime(rs.getTimestamp("create_time"));
		mp.setCreator(rs.getString("creator"));
		return mp;
	}
}
