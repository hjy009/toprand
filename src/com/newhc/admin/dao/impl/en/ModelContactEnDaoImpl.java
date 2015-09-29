package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

import com.newhc.admin.dao.en.ModelContactEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelContactEn;

public class ModelContactEnDaoImpl extends BaseDaoImpl implements ModelContactEnDao {

	public void addModelContactEn(ModelContactEn modelcontactEn) {
		super.getHibernateTemplate().save(modelcontactEn);

	}

	public ModelContactEn queryModelContactEnById(Integer id) {
		return (ModelContactEn) super.getHibernateTemplate().load(ModelContactEn.class,id);
	}

	public void updateModelContactEn(ModelContactEn modelcontactEn) {
		super.getHibernateTemplate().update(modelcontactEn);

	}

	public List queryModelContactEn() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content FROM model_contact_en ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),new MapObjectRowMapper());
	}



}
