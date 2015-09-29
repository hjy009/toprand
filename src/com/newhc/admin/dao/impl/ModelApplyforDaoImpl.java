package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelApplyforDao;
import com.newhc.admin.entity.ModelApplyfor;

public class ModelApplyforDaoImpl extends BaseDaoImpl implements ModelApplyforDao {

	public void addModelApplyfor(ModelApplyfor modelApplyfor) {
		super.getHibernateTemplate().save(modelApplyfor);
	}

	public void deleteModelApplyfor(ModelApplyfor modelApplyfor) {
		super.getHibernateTemplate().delete(modelApplyfor);
	}

	public Pagination queryModelApplyfor(String name, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,applied_position,member_enterprises,work_experience,table_path ");
		query.append("from model_applyfor where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
 
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public ModelApplyfor queryModelApplyforId(Integer id) {
		return (ModelApplyfor) super.getHibernateTemplate().load(ModelApplyfor.class, id);
	}

	 

	
}
