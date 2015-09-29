package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.AdminUserMenuDao;
import com.newhc.admin.entity.AdminUserMenu;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

public class AdminUserMenuDaoImpl extends BaseDaoImpl implements AdminUserMenuDao{

	public List queryAdminUserMenuBy(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,menu_id from admin_user_menu where user_id = ? ");
		values.add(userId);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	public void addAdminUserMenu(AdminUserMenu adminUserMenu){
		super.getHibernateTemplate().save(adminUserMenu);
	}
	
	public void deleteAdminUserMenu(Integer id){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_menu where user_id = ? ");
		values.add(id);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}
	
	public void deleteAdminUserMenuByMenuId(Integer menuId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_menu where menu_id = ? ");
		values.add(menuId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(),values.toArray());
	}
	
	public void deleteAdminUserMenuByUserId(Integer userId){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("delete from admin_user_menu where user_id = ? ");
		values.add(userId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(),values.toArray());
	}
	
	public List queryAdminUserMenuBy(Integer userId,Integer type){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select m.name,m.code from menu m,admin_user_menu aum where m.id = aum.menu_id ");
		query.append("and aum.user_id = ? and m.type = ? ");
		values.add(userId);
		values.add(type);
		query.append("order by m.sequence asc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
