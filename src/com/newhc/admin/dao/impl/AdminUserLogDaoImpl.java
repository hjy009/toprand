package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.AdminUserLogDao;
import com.newhc.admin.entity.AdminUserLog;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

public class AdminUserLogDaoImpl extends BaseDaoImpl implements AdminUserLogDao{
	
	public void addAdminUserLogDao(AdminUserLog adminUserLog){
		super.getHibernateTemplate().save(adminUserLog);
	}
	
	public Pagination queryAdminUserLogPage(String userName,String name,String roleName,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select aul.id,au.username,au.name,r.name as roleName,aul.create_time ");
		query.append("from admin_user_log aul,role r,admin_user au where aul.user_id = au.id and aul.role_id = r.id ");
		if(!StringHelper.isEmpty(userName)){
			query.append("and au.username like ? ");
			values.add("%"+userName+"%");
		}
		if(!StringHelper.isEmpty(name)){
			query.append("and au.name like ? ");
			values.add("%"+name+"%");
		}
		if(!StringHelper.isEmpty(roleName)){
			query.append("and r.name like ? ");
			values.add("%"+roleName+"%");
		}
		query.append("order by aul.create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
}
