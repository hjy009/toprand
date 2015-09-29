package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelAdvertiseDao;
import com.newhc.admin.entity.ModelAdvertise;



public class ModelAdvertiseDaoImpl extends BaseDaoImpl implements ModelAdvertiseDao {

	public ModelAdvertise queryModelAdvertiseById(Integer id) {
	
		return (ModelAdvertise) super.getHibernateTemplate().load(ModelAdvertise.class,id);
	}

	public Pagination queryModelAdvertisePage(String name,
			Integer type, Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,ad_person,company,working_place,start_time,end_time,description,linkman,type,status,creator,create_time ");
		query.append("from model_advertise where 1 = 1 ");
		
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by id asc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
	
	
	public Pagination queryModelAdvertiseWebPage(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,ad_person,company,working_place,start_time,end_time,pub_time,description,linkman,type,status,creator,create_time ");
		query.append("from model_advertise where 1 = 1 ");
		
		if(!StringHelper.isEmpty(companyName)){
			query.append("and company like ? ");
			values.add("%"+companyName+"%");
		}
		
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		
		if(!StringHelper.isEmpty(dataName)){
			 if(dataName.equals("所有时间")){
			 }else if(dataName.equals("今天")){
				 
				 query.append("and to_days(pub_time)= to_days(now()) ");
				 
			 }else if(dataName.equals("最近三天")){
				 
				 query.append("and DATE_SUB(CURDATE(), INTERVAL 3 DAY) <= date(pub_time) ");
				 
			 }else if(dataName.equals("最近一周")){

				 query.append("and DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(pub_time) ");
			 
			 }else if(dataName.equals("最近一个月")){
				 
				 query.append("and DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= date(pub_time) ");
			 }
			 
		}
		
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by pub_time desc,create_time asc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
	
	
	public void updateModelAdvertise(ModelAdvertise modelAdvertise) {
		super.getHibernateTemplate().update(modelAdvertise);

	}

	public void addModelAdvertise(ModelAdvertise modelAdvertise) {
		super.getHibernateTemplate().save(modelAdvertise);
		
	}
	
	public void deleteModelAdvertise(ModelAdvertise modelAdvertise){
		super.getHibernateTemplate().delete(modelAdvertise);
	}

	public List queryAdvertiseByName(Integer type ,Integer status) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select name from model_advertise where 1=1 ");
		
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("group by name");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

}
