package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelCultureDao;
import com.newhc.admin.entity.ModelCulture;

public class ModelCultureDaoImpl extends BaseDaoImpl implements ModelCultureDao {

	public void addModelCulture(ModelCulture modelCulture) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().save(modelCulture);
	}

	public void deleteModelCulture(ModelCulture modelCulture) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().delete(modelCulture);
	}

	public ModelCulture queryModelCultureId(Integer id) {
		// TODO Auto-generated method stub
		return (ModelCulture) super.getHibernateTemplate().load(ModelCulture.class, id);
	}

	public Pagination queryModelCulturePage(String name, Integer Status,
			Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,content,status,sequence,creator,create_time ");
		query.append("from model_culture where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(Status, -1)>-1){
			query.append("and status = ? ");
			values.add(Status);
		}
		query.append("order by sequence asc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public void updateModelCulture(ModelCulture modelCulture) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().update(modelCulture);
	}

	public List queryModelCultureList(Integer id) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,content from model_culture where status = 1 ");
		if(NumbericHelper.getIntValue(id, -1)>-1){
			query.append("and id = ? ");
			values.add(id);
		}
		query.append("order by sequence asc,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),values.toArray(), new MapObjectRowMapper());
	}

	
}
