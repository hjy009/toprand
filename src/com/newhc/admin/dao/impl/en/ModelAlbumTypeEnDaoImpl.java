package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelAlbumTypeEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelAlbumTypeEn;

public class ModelAlbumTypeEnDaoImpl extends BaseDaoImpl implements ModelAlbumTypeEnDao {

	public void addModelAlbumTypeEn(ModelAlbumTypeEn mp) {
		
	}

	public void deleteModelAlbumTypeEn(ModelAlbumTypeEn mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelAlbumTypeEn queryModelAlbumTypeEnById(Integer id) {
		return (ModelAlbumTypeEn)super.getHibernateTemplate().load(ModelAlbumTypeEn.class, id);
	}

	public Pagination queryModelAlbumTypeEnPage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_album_type_en where 1 = 1 ");
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

	public void updateModelAlbumTypeEn(ModelAlbumTypeEn mp) {
		super.getHibernateTemplate().update(mp);
	}

	public void addModelModelAlbumTypeEn(ModelAlbumTypeEn mp) {
		super.getHibernateTemplate().save(mp);
	}

	public List queryModelAlbumTypeEnList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,name,image_path ");
		query.append("FROM model_album_type_en WHERE status = 1 ");
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	
}
