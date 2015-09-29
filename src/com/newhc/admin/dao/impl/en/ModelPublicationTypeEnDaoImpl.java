package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelPublicationTypeEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelPublicationTypeEn;

public class ModelPublicationTypeEnDaoImpl extends BaseDaoImpl implements ModelPublicationTypeEnDao {

	public void addModelPublicationTypeEn(ModelPublicationTypeEn mp) {
		
	}

	public void deleteModelPublicationTypeEn(ModelPublicationTypeEn mp) {
		super.getHibernateTemplate().delete(mp);
	}

	public ModelPublicationTypeEn queryModelPublicationTypeEnById(Integer id) {
		return (ModelPublicationTypeEn)super.getHibernateTemplate().load(ModelPublicationTypeEn.class, id);
	}

	public Pagination queryModelPublicationTypeEnPage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,status,sequence,creator,create_time from model_publication_type_en where 1 = 1 ");
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

	public void updateModelPublicationTypeEn(ModelPublicationTypeEn mp) {
		super.getHibernateTemplate().update(mp);
	}

	public void addModelModelPublicationTypeEn(ModelPublicationTypeEn mp) {
		super.getHibernateTemplate().save(mp);
	}

	public List queryModelPublicationTypeEnList() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append(" SELECT id,name ");
		query.append("FROM model_publication_type_en WHERE status = 1 ");
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	
}
