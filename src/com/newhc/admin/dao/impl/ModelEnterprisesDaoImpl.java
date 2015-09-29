package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelEnterprisesDao;
import com.newhc.admin.entity.ModelEnterprises;



public class ModelEnterprisesDaoImpl extends BaseDaoImpl implements ModelEnterprisesDao {

	public void addModelEnterprises(ModelEnterprises modelEnterprises) {
		super.getHibernateTemplate().save(modelEnterprises);

	}

	public void deleteModelEnterprises(ModelEnterprises modelEnterprises) {
		super.getHibernateTemplate().delete(modelEnterprises);

	}

	public ModelEnterprises queryModelEnterprisesById(Integer id) {
		
		return (ModelEnterprises) super.getHibernateTemplate().load(ModelEnterprises.class,id);
	}

	public Pagination queryModelEnterprisesPage(Integer type , 
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,type,creator, create_time  ");
		query.append("FROM model_enterprises WHERE 1 = 1 ");
		
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("AND type = ? ");
			values.add(type);
		}
		
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		 
		query.append("order by  create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelEnterprises(ModelEnterprises ModelEnterprises) {
		super.getHibernateTemplate().update(ModelEnterprises);

	}

	public List queryModelEnterprisesList(Integer type) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,remarks,type FROM model_enterprises WHERE status = 1 ");
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		
		query.append("ORDER BY create_time  ");
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public List queryModelIndexEnterprisesList(Integer type) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,remarks,type FROM model_enterprises WHERE status = 1 ");
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		
		query.append("ORDER BY create_time limit 4 ");
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
