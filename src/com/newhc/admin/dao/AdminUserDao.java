package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.AdminUser;

import cn.com.netmovie.util.Pagination;

public interface AdminUserDao {
	
	public List queryAdminList(String userName,String password);
	
	public Pagination queryAdminPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber);
	
	public void addAdminUser(AdminUser adminUser);
	
	public void updateAdminUserStatus(AdminUser adminUser);
	
	public void updateAdminUser(AdminUser adminUser);
	
	public AdminUser loadAdminUser(Integer id);
	
	public void deleteAdminUser(AdminUser adminUser);
}
