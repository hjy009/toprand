package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelLinkEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelLinkEn;

public class ModelLinkEnDaoImpl extends BaseDaoImpl implements ModelLinkEnDao {

	public void addModelLinkEn(ModelLinkEn modelLinkEn) {
		super.getHibernateTemplate().save(modelLinkEn);

	}

	public void deleteModelLinkEn(ModelLinkEn modelLinkEn) {
		super.getHibernateTemplate().delete(modelLinkEn);

	}

	public ModelLinkEn queryModelLinkEnById(Integer id) {
		
		return (ModelLinkEn) super.getHibernateTemplate().load(ModelLinkEn.class,id);
	}

	public Pagination queryModelLinkEnPage(String name, String logo,
			Integer status, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,name,link,logo,status,sequence,creator,create_time  ");
		query.append("FROM model_link_en WHERE 1 = 1 ");
		
		if(!StringHelper.isEmpty(name)){
			query.append("AND name LIKE ? ");
			values.add("%"+name+"%");
		}
		if(!StringHelper.isEmpty(logo)){
			query.append("AND logo LIKE ? ");
			values.add("%"+logo+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		
		query.append("ORDER BY sequence ASC,create_time DESC ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelLinkEn(ModelLinkEn modelLinkEn) {
		super.getHibernateTemplate().update(modelLinkEn);

	}

}
