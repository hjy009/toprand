package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelAlbumDao;
import com.newhc.admin.dao.ModelPeriodicalDao;
import com.newhc.admin.entity.ModelAlbum;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.mapper.ModelProductCategoryRowMapper;

public class ModelAlbumDaoImpl extends BaseDaoImpl implements ModelAlbumDao {

	public void addModelAlbum(ModelAlbum mp) {
		super.getHibernateTemplate().save(mp);
	}

	public void deleteModelAlbum(ModelAlbum mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelAlbum queryModelAlbumById(Integer id) {
		return (ModelAlbum)super.getHibernateTemplate().load(ModelAlbum.class, id);
	}

	public Pagination queryModelAlbumPage(Integer typeId,String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_album where 1 = 1 ");
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

	public Pagination queryModelAlbumWebPage(Integer typeId,int pageMaxSize,int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path from model_album where status = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and type_id = ? ");
			values.add(typeId);
		}
		query.append("order by sequence desc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public void updateModelAlbum(ModelAlbum mp) {
		super.getHibernateTemplate().update(mp);
	}
	
	public List queryModelAlbumList(Integer typeId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select image_path from model_album where status = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and type_id = ? ");
			values.add(typeId);
		}
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(),new MapObjectRowMapper());
	}
}
