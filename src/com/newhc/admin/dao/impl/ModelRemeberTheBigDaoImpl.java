package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelRemeberTheBigDao;
import com.newhc.admin.entity.ModelRemeberTheBig;



public class ModelRemeberTheBigDaoImpl extends BaseDaoImpl implements ModelRemeberTheBigDao {

	public void addModelRemeberTheBig(ModelRemeberTheBig modelRemeberTheBig) {
		super.getHibernateTemplate().save(modelRemeberTheBig);

	}

	public void deleteModelRemeberTheBig(ModelRemeberTheBig modelRemeberTheBig) {
		super.getHibernateTemplate().delete(modelRemeberTheBig);

	}

	public ModelRemeberTheBig queryModelRemeberTheBigById(Integer id) {
		
		return (ModelRemeberTheBig) super.getHibernateTemplate().load(ModelRemeberTheBig.class,id);
	}

	public Pagination queryModelRemeberTheBigPage(Integer type , 
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,status,creator, create_time  ");
		query.append("FROM model_remember_the_big WHERE 1 = 1 ");
		
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("AND type = ? ");
			values.add(type);
		}
		
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		 
		query.append("order by  year desc,create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelRemeberTheBig(ModelRemeberTheBig ModelRemeberTheBig) {
		super.getHibernateTemplate().update(ModelRemeberTheBig);

	}

	public List queryModelReceiveVisitList(Integer receiveVisitLimit) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,path,status,type FROM model_remember_the_big WHERE status = 1 and type=1  ORDER BY create_time DESC ");
		query.append("limit ? ");
		values.add(receiveVisitLimit);
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public List queryReceiveVisitList(Integer receiveVisitLimit) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,path,status,type FROM model_remember_the_big WHERE status = 1 and type=2  ORDER BY create_time DESC ");
		query.append("limit ?");
		values.add(receiveVisitLimit);
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public List queryModelRemeberTheBigList(String year,Integer type,Integer status) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,content,year,status,type  ");
		query.append("FROM model_remember_the_big WHERE 1 = 1 ");
		if (year!= null) {
			query.append("and year= ? ");
			values.add(year);
		}
		if(NumbericHelper.getLongValue(type, -1)>-1){
			query.append("AND type = ? ");
			values.add(type);
		}
		
		if(NumbericHelper.getLongValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		query.append("order by year desc,create_time ASC ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
