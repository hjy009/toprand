package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelVideoEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelVideoEn;

public class ModelVideoEnDaoImpl extends BaseDaoImpl implements ModelVideoEnDao {

	public void addModelVideoEn(ModelVideoEn modelVideoEn) {
		super.getHibernateTemplate().save(modelVideoEn);

	}

	public void deleteModelVideoEn(ModelVideoEn modelVideoEn) {
		super.getHibernateTemplate().delete(modelVideoEn);

	}

	public ModelVideoEn loadModelVideoEn(Integer id) {
		
		return (ModelVideoEn) super.getHibernateTemplate().load(ModelVideoEn.class,id);
	}

	public Pagination queryModelVideoEnPage(Integer categoryId,String name, Date startTime,Date endTime,
			Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,category_id,name,image_path,path,remark,status,creator,create_time,pub_time  ");
		query.append("FROM model_video_en WHERE 1 = 1 ");
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

	public void updateModelVideoEn(ModelVideoEn modelVideoEn) {
		super.getHibernateTemplate().update(modelVideoEn);

	}

	public Pagination queryVideoEnWebPage(int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,image_path,path,remark,status,creator,create_time,pub_time  ");
		query.append("FROM model_video_en WHERE status = 1 ");		
		query.append("ORDER BY pub_time DESC,create_time DESC ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}
	
	
	
	

}
