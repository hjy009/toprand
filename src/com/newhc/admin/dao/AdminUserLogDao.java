package com.newhc.admin.dao;

import com.newhc.admin.entity.AdminUserLog;

import cn.com.netmovie.util.Pagination;

public interface AdminUserLogDao {

	public void addAdminUserLogDao(AdminUserLog adminUserLog);
	
	public Pagination queryAdminUserLogPage(String userName,String name,String roleName,int pageMaxSize,int pageNumber);
}
