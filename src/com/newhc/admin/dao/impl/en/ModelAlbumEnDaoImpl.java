package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelAlbumEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelAlbumEn;

public class ModelAlbumEnDaoImpl extends BaseDaoImpl implements ModelAlbumEnDao {

	public void addModelAlbumEn(ModelAlbumEn mp) {
		super.getHibernateTemplate().save(mp);
	}

	public void deleteModelAlbumEn(ModelAlbumEn mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelAlbumEn queryModelAlbumEnById(Integer id) {
		return (ModelAlbumEn)super.getHibernateTemplate().load(ModelAlbumEn.class, id);
	}

	public Pagination queryModelAlbumEnPage(Integer typeId,String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_album_en where 1 = 1 ");
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

	public Pagination queryModelAlbumEnWebPage(Integer typeId,int pageMaxSize,int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path from model_album_en where status = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and type_id = ? ");
			values.add(typeId);
		}
		query.append("order by sequence desc,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public void updateModelAlbumEn(ModelAlbumEn mp) {
		super.getHibernateTemplate().update(mp);
	}
	
	public List queryModelAlbumEnList(Integer typeId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select image_path from model_album_en where status = 1 ");
		if(NumbericHelper.getIntValue(typeId, -1)>-1){
			query.append("and  type_id = ? ");
			values.add(typeId);
		}
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(),new MapObjectRowMapper());
	}
}
