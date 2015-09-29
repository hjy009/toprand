package com.newhc.admin.entity.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.newhc.admin.entity.ModelProductCategory;

public class ModelProductCategoryRowMapper implements RowMapper{
	public Object mapRow(ResultSet rs,int row) throws SQLException{
		ModelProductCategory mpc = new ModelProductCategory();
		mpc.setId(new Integer(rs.getInt("id")));
		mpc.setName(rs.getString("name"));
		mpc.setStatus(new Integer(rs.getInt("status")));
		mpc.setSequence(new Integer(rs.getInt("sequence")));
		mpc.setType(new Integer(rs.getInt("type")));
		mpc.setCreator(rs.getString("creator"));
		mpc.setCreateTime(rs.getTimestamp("create_time"));
		return mpc;
	}
}
