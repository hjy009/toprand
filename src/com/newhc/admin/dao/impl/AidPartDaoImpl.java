package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;


import com.newhc.admin.dao.AidPartDao;
import com.newhc.admin.entity.AidPart;

public class AidPartDaoImpl extends BaseDaoImpl implements AidPartDao {

	public void addAidPart(AidPart aidPart) {		
		super.getHibernateTemplate().save(aidPart);
	}

	public void deleteAidPart(AidPart aidPart) {		
		super.getHibernateTemplate().delete(aidPart);
	}

	public AidPart queryAidPartById(Integer id) {		
		return (AidPart)super.getHibernateTemplate().load(AidPart.class, id);
	}

	public Pagination queryAidPartPage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query=new StringBuffer();
		List value=new ArrayList();
		query.append("select id,name,status,sequence,content,create_time,creator ");
		query.append("from aid_part where 1=1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			value.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			value.add(status);
		}
		query.append("order by sequence,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), value.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public void updatgeAidPart(AidPart aidPart) {
		super.getHibernateTemplate().update(aidPart);
	}

	public List queryAidPartList() {
		StringBuffer query=new StringBuffer();
		query.append("select id,name,content from aid_part where status = 1 ");
		query.append("order by sequence");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), new MapObjectRowMapper());
	}

	
}
