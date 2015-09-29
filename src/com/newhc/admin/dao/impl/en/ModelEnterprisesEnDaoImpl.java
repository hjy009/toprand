package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelEnterprisesEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelEnterprisesEn;



public class ModelEnterprisesEnDaoImpl extends BaseDaoImpl implements ModelEnterprisesEnDao {

	public void addModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn) {
		super.getHibernateTemplate().save(modelEnterprisesEn);

	}

	public void deleteModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn) {
		super.getHibernateTemplate().delete(modelEnterprisesEn);

	}

	public ModelEnterprisesEn queryModelEnterprisesEnById(Integer id) {
		
		return (ModelEnterprisesEn) super.getHibernateTemplate().load(ModelEnterprisesEn.class,id);
	}

	public Pagination queryModelEnterprisesEnPage(Integer type , 
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,type,creator, create_time  ");
		query.append("FROM model_enterprises_en WHERE 1 = 1 ");
		
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

	public void updateModelEnterprisesEn(ModelEnterprisesEn ModelEnterprisesEn) {
		super.getHibernateTemplate().update(ModelEnterprisesEn);

	}

	public List queryModelEnterprisesEnList(Integer type) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,remarks,type FROM model_enterprises_en WHERE status = 1 ");
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		
		query.append("ORDER BY create_time  ");
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public List queryModelIndexEnterprisesEnList(Integer type) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content,name,status,remarks,type FROM model_enterprises_en WHERE status = 1 ");
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		
		query.append("ORDER BY create_time limit 4 ");
	 
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
