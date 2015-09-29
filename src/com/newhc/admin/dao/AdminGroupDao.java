package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.AdminGroup;

import cn.com.netmovie.util.Pagination;

public interface AdminGroupDao {
	
	public Pagination queryAdminGroupPage(String name,int pageMaxSize,int pageNumber);
	
	public void addAdminGroup(AdminGroup adminGroup);
	
	public void updateAdminGroup(AdminGroup adminGroup);
	
	public AdminGroup loadAdminGroupById(Integer id);
	
	public void deleteAdminGroup(AdminGroup adminGroup);
	
	public List queryAdminGroupList();
}
