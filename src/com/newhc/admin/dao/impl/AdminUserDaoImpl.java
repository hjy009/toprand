package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.AdminUserDao;
import com.newhc.admin.entity.AdminUser;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

public class AdminUserDaoImpl extends BaseDaoImpl implements AdminUserDao{
	
	public List queryAdminList(String userName,String password){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,username,name,type from admin_user where username = ? and password = ? and status = 0 ");
		values.add(userName);
		values.add(password);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(),new MapObjectRowMapper());
	}
	
	public Pagination queryAdminPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,username,name,type,status,create_time,creator ");
		query.append("from admin_user where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("and username != 'administrator' ");//Òþ²Øadministrator
		query.append("order by id asc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}
	
	public void addAdminUser(AdminUser adminUser){
		super.getHibernateTemplate().save(adminUser);
	}
	
	public void updateAdminUserStatus(AdminUser adminUser){
		super.getHibernateTemplate().update(adminUser);
	}
	
	public void updateAdminUser(AdminUser adminUser){
		super.getHibernateTemplate().update(adminUser);
	}
	
	public AdminUser loadAdminUser(Integer id){
		return (AdminUser)super.getHibernateTemplate().load(AdminUser.class, id);
	}
	
	public void deleteAdminUser(AdminUser adminUser){
		super.getHibernateTemplate().delete(adminUser);
	}
}
