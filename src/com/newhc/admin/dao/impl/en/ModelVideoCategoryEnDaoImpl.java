package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelVideoCategoryEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelVideoCategoryEn;

public class ModelVideoCategoryEnDaoImpl extends BaseDaoImpl implements ModelVideoCategoryEnDao {

	public void addModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn) {
		super.getHibernateTemplate().save(modelVideoCategoryEn);

	}

	public void deleteModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn) {
		super.getHibernateTemplate().delete(modelVideoCategoryEn);

	}

	public ModelVideoCategoryEn loadModelVideoCategoryEn(Integer id) {
		
		return (ModelVideoCategoryEn) super.getHibernateTemplate().load(ModelVideoCategoryEn.class,id);
	}

	public Pagination queryModelVideoCategoryEnPage(String name, Integer type,
			Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,type,volumn_count,remark,status,creator,updator,create_time,update_time  ");
		query.append("FROM model_video_category_en WHERE 1 = 1 ");
		
		if(!StringHelper.isEmpty(name)){
			query.append("AND name LIKE ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("AND type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		
		query.append("ORDER BY create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn) {
		super.getHibernateTemplate().update(modelVideoCategoryEn);

	}
	
	public Integer queryModelVideoByCategoryEnId(Integer categoryId){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select count(id) from model_video where category_id = ? ");
		values.add(categoryId);
		return super.getJdbcDao().getJdbcTemplate().queryForInt(query.toString(), values.toArray());
	}

}
