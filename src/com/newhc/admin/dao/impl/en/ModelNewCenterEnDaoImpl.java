package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelNewCenterEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelNewsCenterEn;

public class ModelNewCenterEnDaoImpl extends BaseDaoImpl implements ModelNewCenterEnDao{

	public Pagination queryNewCenterEnPage(String name, Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,status,sequence,creator,updator,create_time,update_time ");
		query.append("FROM model_news_center_en WHERE 1 = 1 ");
		
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

	public void deleteNewCenterEn(ModelNewsCenterEn modelNewsCenterEn) {
		super.getHibernateTemplate().delete(modelNewsCenterEn);
	}

	public ModelNewsCenterEn queryNewsCenterEnById(Integer id) {
		return (ModelNewsCenterEn)super.getHibernateTemplate().load(ModelNewsCenterEn.class, id);
	}

	public void addNewCenterEn(ModelNewsCenterEn modelNewsCenterEn) {
		super.getHibernateTemplate().save(modelNewsCenterEn);
	}

	public void updateNewCenterEn(ModelNewsCenterEn modelNewsCenterEn) {
		super.getHibernateTemplate().update(modelNewsCenterEn);
	}
	
}
