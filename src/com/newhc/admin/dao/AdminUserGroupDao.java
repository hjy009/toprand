package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.AdminUserGroup;

public interface AdminUserGroupDao {
	
	public void deleteAdminUserGroup(Integer userId);
	
	public void addAdminUserGroup(AdminUserGroup adminUserGroup);
	
	public List queryAdminUserGroupBy(Integer userId);
	
	public void deleteAdminUserGroupByGroupId(Integer groupId);
	
	public void deleteAdminUserGroupByUserId(Integer userId);
}
