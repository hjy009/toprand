package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelAdvertiseEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelAdvertiseEn;



public class ModelAdvertiseEnDaoImpl extends BaseDaoImpl implements ModelAdvertiseEnDao {

	public ModelAdvertiseEn queryModelAdvertiseEnById(Integer id) {
	
		return (ModelAdvertiseEn) super.getHibernateTemplate().load(ModelAdvertiseEn.class,id);
	}

	public Pagination queryModelAdvertiseEnPage(String name,
			Integer type, Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,ad_person,company,working_place,start_time,end_time,description,linkman,type,status,creator,create_time ");
		query.append("from model_advertise_en where 1 = 1 ");
		
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
	
	
	public Pagination queryModelAdvertiseEnWebPage(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,ad_person,company,working_place,start_time,end_time,pub_time,description,linkman,type,status,creator,create_time ");
		query.append("from model_advertise_en where 1 = 1 ");
		
		if(!StringHelper.isEmpty(companyName)){
			query.append("and company like ? ");
			values.add("%"+companyName+"%");
		}
		
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		
		if(!StringHelper.isEmpty(dataName)){
			 if(dataName.equals("all time")){
			 }else if(dataName.equals("today")){
				 
				 query.append("and to_days(pub_time)= to_days(now()) ");
				 
			 }else if(dataName.equals("last three days")){
				 
				 query.append("and DATE_SUB(CURDATE(), INTERVAL 3 DAY) <= date(pub_time) ");
				 
			 }else if(dataName.equals("The last week")){

				 query.append("and DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(pub_time) ");
			 
			 }else if(dataName.equals("A recent months")){
				 
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
	
	
	public void updateModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn) {
		super.getHibernateTemplate().update(modelAdvertiseEn);

	}

	public void addModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn) {
		super.getHibernateTemplate().save(modelAdvertiseEn);
		
	}
	
	public void deleteModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn){
		super.getHibernateTemplate().delete(modelAdvertiseEn);
	}

	public List queryAdvertiseEnByName(Integer type ,Integer status) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select name from model_advertise_en where 1=1 ");
		
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
