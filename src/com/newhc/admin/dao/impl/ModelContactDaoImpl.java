package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

import com.newhc.admin.dao.ModelContactDao;
import com.newhc.admin.entity.ModelContact;

public class ModelContactDaoImpl extends BaseDaoImpl implements ModelContactDao {

	public void addModelContact(ModelContact modelcontact) {
		super.getHibernateTemplate().save(modelcontact);

	}

	public ModelContact queryModelContactById(Integer id) {
		return (ModelContact) super.getHibernateTemplate().load(ModelContact.class,id);
	}

	public void updateModelContact(ModelContact modelcontact) {
		super.getHibernateTemplate().update(modelcontact);

	}

	public List queryModelContact() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content FROM model_contact ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),new MapObjectRowMapper());
	}



}
