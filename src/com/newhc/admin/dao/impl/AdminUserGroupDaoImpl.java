package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.AdminUserGroupDao;
import com.newhc.admin.entity.AdminUserGroup;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

public class AdminUserGroupDaoImpl extends BaseDaoImpl implements AdminUserGroupDao{
	
	public void deleteAdminUserGroup(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_group where user_id = ? ");
		values.add(userId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(),values.toArray());
	}
	
	public void addAdminUserGroup(AdminUserGroup adminUserGroup){
		super.getHibernateTemplate().save(adminUserGroup);
	}
	
	public List queryAdminUserGroupBy(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select group_id from admin_user_group where user_id = ? ");
		values.add(userId);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public void deleteAdminUserGroupByGroupId(Integer groupId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_group where group_id = ? ");
		values.add(groupId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
	
	public void deleteAdminUserGroupByUserId(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_group where user_id = ? ");
		values.add(userId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
}
