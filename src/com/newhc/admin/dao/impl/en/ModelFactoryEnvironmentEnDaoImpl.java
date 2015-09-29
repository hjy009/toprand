package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelFactoryEnvironmentEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.ModelFactoryEnvironment;
import com.newhc.admin.entity.en.ModelFactoryEnvironmentEn;

public class ModelFactoryEnvironmentEnDaoImpl extends BaseDaoImpl implements
		ModelFactoryEnvironmentEnDao {

	public void addModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe) {
		super.getHibernateTemplate().save(mfe);
	}

	public void deleteModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe) {
		super.getHibernateTemplate().delete(mfe);
	}

	public ModelFactoryEnvironmentEn queryModelFactoryEnvironmentEnById(Integer id) {
		return (ModelFactoryEnvironmentEn)super.getHibernateTemplate().load(ModelFactoryEnvironmentEn.class, id);
	}

	public Pagination queryModelFactoryEnvironmentEnPage(String name,
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,max_image,min_image,status,sequence,creator,create_time ");
		query.append("FROM model_factory_environment_en WHERE 1 = 1 ");
		
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

	public void updateModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe) {
		super.getHibernateTemplate().update(mfe);
	}

	public List queryModelFactoryEnvironmentEnWebList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,min_image,status,sequence,creator,create_time ");
		query.append("FROM model_factory_environment_en WHERE status = 1 ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	

}
