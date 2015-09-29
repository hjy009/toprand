package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.AdminGroupDao;
import com.newhc.admin.entity.AdminGroup;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

public class AdminGroupDaoImpl extends BaseDaoImpl implements AdminGroupDao{
	
	public Pagination queryAdminGroupPage(String name,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,remark,creator,create_time from admin_group where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addAdminGroup(AdminGroup adminGroup){
		super.getHibernateTemplate().save(adminGroup);
	}
	
	public void updateAdminGroup(AdminGroup adminGroup){
		super.getHibernateTemplate().update(adminGroup);
	}
	
	public AdminGroup loadAdminGroupById(Integer id){
		return (AdminGroup)super.getHibernateTemplate().load(AdminGroup.class, id);
	}
	
	public void deleteAdminGroup(AdminGroup adminGroup){
		super.getHibernateTemplate().delete(adminGroup);
	}
	
	public List queryAdminGroupList(){
		StringBuffer query = new StringBuffer();
		query.append("select id,name,remark from admin_group ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), new MapObjectRowMapper());
	}
}
