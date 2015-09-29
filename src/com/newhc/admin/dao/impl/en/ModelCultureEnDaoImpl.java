package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelCultureEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelCultureEn;

public class ModelCultureEnDaoImpl extends BaseDaoImpl implements ModelCultureEnDao {

	public void addModelCultureEn(ModelCultureEn modelCultureEn) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().save(modelCultureEn);
	}

	public void deleteModelCultureEn(ModelCultureEn modelCultureEn) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().delete(modelCultureEn);
	}

	public ModelCultureEn queryModelCultureEnId(Integer id) {
		// TODO Auto-generated method stub
		return (ModelCultureEn) super.getHibernateTemplate().load(ModelCultureEn.class, id);
	}

	public Pagination queryModelCultureEnPage(String name, Integer Status,
			Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,content,status,sequence,creator,create_time ");
		query.append("from model_culture_en where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(Status, -1)>-1){
			query.append("and status = ? ");
			values.add(Status);
		}
		query.append("order by sequence asc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public void updateModelCultureEn(ModelCultureEn modelCultureEn) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().update(modelCultureEn);
	}

	public List queryModelCultureEnList(Integer id) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,content from model_culture_en where status = 1 ");
		if(NumbericHelper.getIntValue(id, -1)>-1){
			query.append("and id = ? ");
			values.add(id);
		}
		query.append("order by sequence asc,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),values.toArray(), new MapObjectRowMapper());
	}

	
}
