package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelFactoryEnvironmentDao;
import com.newhc.admin.entity.ModelFactoryEnvironment;

public class ModelFactoryEnvironmentDaoImpl extends BaseDaoImpl implements
		ModelFactoryEnvironmentDao {

	public void addModelFactoryEnvironment(ModelFactoryEnvironment mfe) {
		super.getHibernateTemplate().save(mfe);
	}

	public void deleteModelFactoryEnvironment(ModelFactoryEnvironment mfe) {
		super.getHibernateTemplate().delete(mfe);
	}

	public ModelFactoryEnvironment queryModelFactoryEnvironmentById(Integer id) {
		return (ModelFactoryEnvironment)super.getHibernateTemplate().load(ModelFactoryEnvironment.class, id);
	}

	public Pagination queryModelFactoryEnvironmentPage(String name,
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,max_image,min_image,status,sequence,creator,create_time ");
		query.append("FROM model_factory_environment WHERE 1 = 1 ");
		
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

	public void updateModelFactoryEnvironment(ModelFactoryEnvironment mfe) {
		super.getHibernateTemplate().update(mfe);
	}

	public List queryModelFactoryEnvironmentWebList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,min_image,status,sequence,creator,create_time ");
		query.append("FROM model_factory_environment WHERE status = 1 ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	

}
