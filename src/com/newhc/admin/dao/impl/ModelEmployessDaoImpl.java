package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

import com.newhc.admin.dao.ModelEmployessDao;
import com.newhc.admin.entity.ModelEmployess;

public class ModelEmployessDaoImpl extends BaseDaoImpl implements
		ModelEmployessDao {

	public void addModelEmployess(ModelEmployess modelemp) {
		super.getHibernateTemplate().save(modelemp);
	}

	public ModelEmployess queryModelEmployessById(Integer id) {
		return (ModelEmployess)super.getHibernateTemplate().load(ModelEmployess.class, id);
	}

	public void updateModelEmployess(ModelEmployess modelemp) {
		super.getHibernateTemplate().update(modelemp);
	}

	public List queryModelEmployessPage() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content FROM model_employess ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),new MapObjectRowMapper());
	}
	
	
}
