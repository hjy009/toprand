package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelPeriodicalDao;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.mapper.ModelProductCategoryRowMapper;

public class ModelPeriodicalDaoImpl extends BaseDaoImpl implements
		ModelPeriodicalDao {

	public void addModelPeriodical(ModelPeriodical mp) {
		super.getHibernateTemplate().save(mp);
	}

	public void deleteModelPeriodical(ModelPeriodical mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelPeriodical queryModelPeriodicalById(Integer id) {
		return (ModelPeriodical)super.getHibernateTemplate().load(ModelPeriodical.class, id);
	}

	public Pagination queryModelPeriodicalPage(Integer typeId,String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_periodical where 1 = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and type_id = ? ");
			values.add(typeId);
		}
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by sequence desc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public Pagination queryModelPeriodicalWebPage(Integer typeId,int pageMaxSize,int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path from model_periodical where status = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and type_id = ? ");
			values.add(typeId);
		}
		query.append("order by sequence desc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public void updateModelPeriodical(ModelPeriodical mp) {
		super.getHibernateTemplate().update(mp);
	}
	
	public List queryModelPeriodicalList(){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,type_id,name from model_periodical where status = 1 ");
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(),new MapObjectRowMapper());
	}
}
