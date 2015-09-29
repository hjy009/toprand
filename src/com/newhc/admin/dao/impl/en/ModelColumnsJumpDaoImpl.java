package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

import com.newhc.admin.dao.en.ModelColumnsJumpEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;

public class ModelColumnsJumpDaoImpl extends BaseDaoImpl implements ModelColumnsJumpEnDao {

	public List queryModelColumnsJumpEn(String parentCode) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,program_code,parent_code,sequence,code FROM model_columns_jump_en  ");
		if(!StringHelper.isEmpty(parentCode)){
			query.append("WHERE parent_code = ?");
			values.add(parentCode);
		}
		query.append("order by sequence asc,create_time desc ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),values.toArray(),new MapObjectRowMapper());
	}

}
