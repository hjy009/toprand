package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelPeriodicalDao;
import com.newhc.admin.dao.ModelPublicationTypeDao;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPublicationType;
import com.newhc.admin.entity.mapper.ModelProductCategoryRowMapper;

public class ModelPublicationTypeDaoImpl extends BaseDaoImpl implements ModelPublicationTypeDao {

	public void addModelPublicationType(ModelPublicationType mp) {
		
	}

	public void deleteModelPublicationType(ModelPublicationType mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelPublicationType queryModelPublicationTypeById(Integer id) {
		return (ModelPublicationType)super.getHibernateTemplate().load(ModelPublicationType.class, id);
	}

	public Pagination queryModelPublicationTypePage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,status,sequence,creator,create_time from model_publication_type where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public void updateModelPublicationType(ModelPublicationType mp) {
		super.getHibernateTemplate().update(mp);
	}

	public void addModelModelPublicationType(ModelPublicationType mp) {
		super.getHibernateTemplate().save(mp);
	}

	public List queryModelPublicationTypeList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,name ");
		query.append("FROM model_publication_type WHERE status = 1 ");
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	
}
