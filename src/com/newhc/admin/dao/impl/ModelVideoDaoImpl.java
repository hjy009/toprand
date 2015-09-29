package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelVideoDao;
import com.newhc.admin.entity.ModelVideo;

public class ModelVideoDaoImpl extends BaseDaoImpl implements ModelVideoDao {

	public void addModelVideo(ModelVideo modelVideo) {
		super.getHibernateTemplate().save(modelVideo);

	}

	public void deleteModelVideo(ModelVideo modelVideo) {
		super.getHibernateTemplate().delete(modelVideo);

	}

	public ModelVideo loadModelVideo(Integer id) {
		
		return (ModelVideo) super.getHibernateTemplate().load(ModelVideo.class,id);
	}

	public Pagination queryModelVideoPage(Integer categoryId,String name, Date startTime,Date endTime,
			Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,category_id,name,image_path,path,remark,status,creator,create_time,pub_time  ");
		query.append("FROM model_video WHERE 1 = 1 ");
		if(NumbericHelper.getIntValue(categoryId, -1)>-1){
			query.append("AND category_id = ? ");
			values.add(categoryId);
		}
		if(!StringHelper.isEmpty(name)){
			query.append("AND name LIKE ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		if (startTime != null) {
			query.append("and pub_time >= ? ");
			values.add(startTime);
		}
		if (endTime != null) {
			query.append("and pub_time < ? ");
			values.add(DateHelper.add(endTime, DateHelper.DAY, +1));
		}
		
		
		query.append("ORDER BY pub_time DESC,create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelVideo(ModelVideo modelVideo) {
		super.getHibernateTemplate().update(modelVideo);

	}

	public Pagination queryVideoWebPage(int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,image_path,path,remark,status,creator,create_time,pub_time  ");
		query.append("FROM model_video WHERE status = 1 ");		
		query.append("ORDER BY pub_time DESC,create_time DESC ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}
	
	
	
	

}
