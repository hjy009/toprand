package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.AdminUserMenu;

public interface AdminUserMenuDao {
	
	public List queryAdminUserMenuBy(Integer userId);
	
	public void addAdminUserMenu(AdminUserMenu adminUserMenu);
	
	public void deleteAdminUserMenu(Integer id);
	
	public void deleteAdminUserMenuByMenuId(Integer menuId);
	
	public void deleteAdminUserMenuByUserId(Integer userId);
	
	public List queryAdminUserMenuBy(Integer userId,Integer type);
}
