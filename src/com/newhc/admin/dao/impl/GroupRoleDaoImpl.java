package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.GroupRoleDao;
import com.newhc.admin.entity.GroupRole;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

public class GroupRoleDaoImpl extends BaseDaoImpl implements GroupRoleDao{
	
	public List queryGroupRoleBy(Integer groupId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,role_id from group_role where group_id = ? ");
		values.add(groupId);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public void addGroupRole(GroupRole groupRole){
		super.getHibernateTemplate().save(groupRole);
	}
	
	public void deleteGroupRole(Integer groupId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from group_role where group_id = ? ");
		values.add(groupId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
	
	public List queryGroupRoleList(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select r.code from admin_user_group aug,admin_group ag,group_role gr,role r ");
		query.append("where aug.group_id = ag.id and ag.id = gr.group_id and gr.role_id = r.id ");
		query.append("and aug.user_id = ? ");
		values.add(userId);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public void deleteGroupRoleByGroupId(Integer groupId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from group_role where group_id = ? ");
		values.add(groupId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
	
	public void deleteGroupRoleByRoleId(Integer roleId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from group_role where role_id = ? ");
		values.add(roleId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
}
