package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelAlbumTypeDao;
import com.newhc.admin.dao.ModelPeriodicalDao;
import com.newhc.admin.dao.ModelPublicationTypeDao;
import com.newhc.admin.entity.ModelAlbumType;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPublicationType;
import com.newhc.admin.entity.mapper.ModelProductCategoryRowMapper;

public class ModelAlbumTypeDaoImpl extends BaseDaoImpl implements ModelAlbumTypeDao {

	public void addModelAlbumType(ModelAlbumType mp) {
		
	}

	public void deleteModelAlbumType(ModelAlbumType mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelAlbumType queryModelAlbumTypeById(Integer id) {
		return (ModelAlbumType)super.getHibernateTemplate().load(ModelAlbumType.class, id);
	}

	public Pagination queryModelAlbumTypePage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_album_type where 1 = 1 ");
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

	public void updateModelAlbumType(ModelAlbumType mp) {
		super.getHibernateTemplate().update(mp);
	}

	public void addModelModelAlbumType(ModelAlbumType mp) {
		super.getHibernateTemplate().save(mp);
	}

	public List queryModelAlbumTypeList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,name,image_path ");
		query.append("FROM model_album_type WHERE status = 1 ");
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	
}
