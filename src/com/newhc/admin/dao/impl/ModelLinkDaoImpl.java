package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelLinkDao;
import com.newhc.admin.entity.ModelLink;

public class ModelLinkDaoImpl extends BaseDaoImpl implements ModelLinkDao {

	public void addModelLink(ModelLink modelLink) {
		super.getHibernateTemplate().save(modelLink);

	}

	public void deleteModelLink(ModelLink modelLink) {
		super.getHibernateTemplate().delete(modelLink);

	}

	public ModelLink queryModelLinkById(Integer id) {
		
		return (ModelLink) super.getHibernateTemplate().load(ModelLink.class,id);
	}

	public Pagination queryModelLinkPage(String name, String logo,
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,link,logo,status,sequence,creator,create_time  ");
		query.append("FROM model_link WHERE 1 = 1 ");
		
		if(!StringHelper.isEmpty(name)){
			query.append("AND name LIKE ? ");
			values.add("%"+name+"%");
		}
		if(!StringHelper.isEmpty(logo)){
			query.append("AND logo LIKE ? ");
			values.add("%"+logo+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		
		query.append("ORDER BY sequence ASC,create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelLink(ModelLink modelLink) {
		super.getHibernateTemplate().update(modelLink);

	}

}
