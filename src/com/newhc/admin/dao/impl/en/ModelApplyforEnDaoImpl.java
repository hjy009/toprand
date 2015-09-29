package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelApplyforEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelApplyforEn;

public class ModelApplyforEnDaoImpl extends BaseDaoImpl implements ModelApplyforEnDao {

	public void addModelApplyforEn(ModelApplyforEn modelApplyforEn) {
		super.getHibernateTemplate().save(modelApplyforEn);
	}

	public void deleteModelApplyforEn(ModelApplyforEn modelApplyforEn) {
		super.getHibernateTemplate().delete(modelApplyforEn);
	}

	public Pagination queryModelApplyforEn(String name, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,applied_position,member_enterprises,work_experience,table_path ");
		query.append("from model_applyfor_en where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
 
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public ModelApplyforEn queryModelApplyforEnId(Integer id) {
		return (ModelApplyforEn) super.getHibernateTemplate().load(ModelApplyforEn.class, id);
	}

	 

	
}
