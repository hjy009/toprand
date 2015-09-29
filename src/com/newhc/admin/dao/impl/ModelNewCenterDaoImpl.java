package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelNewCenterDao;
import com.newhc.admin.entity.ModelNewsCenter;

public class ModelNewCenterDaoImpl extends BaseDaoImpl implements ModelNewCenterDao{

	public Pagination queryNewCenterPage(String name, Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,status,sequence,creator,updator,create_time,update_time ");
		query.append("FROM model_news_center WHERE 1 = 1 ");
		
		if(!StringHelper.isEmpty(name)){
			query.append("AND name LIKE ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		query.append("order by sequence asc,create_time desc ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void deleteNewCenter(ModelNewsCenter modelNewsCenter) {
		super.getHibernateTemplate().delete(modelNewsCenter);
	}

	public ModelNewsCenter queryNewsCenterById(Integer id) {
		return (ModelNewsCenter)super.getHibernateTemplate().load(ModelNewsCenter.class, id);
	}

	public void addNewCenter(ModelNewsCenter modelNewsCenter) {
		super.getHibernateTemplate().save(modelNewsCenter);
	}

	public void updateNewCenter(ModelNewsCenter modelNewsCenter) {
		super.getHibernateTemplate().update(modelNewsCenter);
	}
	
}
