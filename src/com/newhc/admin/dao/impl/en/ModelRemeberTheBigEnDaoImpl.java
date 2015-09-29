package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelRemeberTheBigEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelRemeberTheBigEn;



public class ModelRemeberTheBigEnDaoImpl extends BaseDaoImpl implements ModelRemeberTheBigEnDao {

	public void addModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn) {
		super.getHibernateTemplate().save(modelRemeberTheBigEn);

	}

	public void deleteModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn) {
		super.getHibernateTemplate().delete(modelRemeberTheBigEn);

	}

	public ModelRemeberTheBigEn queryModelRemeberTheBigEnById(Integer id) {
		
		return (ModelRemeberTheBigEn) super.getHibernateTemplate().load(ModelRemeberTheBigEn.class,id);
	}

	public Pagination queryModelRemeberTheBigEnPage(Integer type , 
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,status,creator, create_time  ");
		query.append("FROM model_remember_the_big_en WHERE 1 = 1 ");
		
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

	public void updateModelRemeberTheBigEn(ModelRemeberTheBigEn ModelRemeberTheBigEn) {
		super.getHibernateTemplate().update(ModelRemeberTheBigEn);

	}

	public List queryModelReceiveVisitEnList(Integer receiveVisitLimit) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,path,status,type FROM model_remember_the_big_en WHERE status = 1 and type=1  ORDER BY create_time DESC ");
		query.append("limit ? ");
		values.add(receiveVisitLimit);
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public List queryReceiveVisitListEn(Integer receiveVisitLimit) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,year,path,status,type FROM model_remember_the_big_en WHERE status = 1 and type=2  ORDER BY create_time DESC ");
		query.append("limit ?");
		values.add(receiveVisitLimit);
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public List queryModelRemeberTheBigEnList(String year,Integer type,Integer status) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,content,year,status,type  ");
		query.append("FROM model_remember_the_big_en WHERE 1 = 1 ");
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
