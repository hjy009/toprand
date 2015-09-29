package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.GroupRole;

public interface GroupRoleDao {
	
	public List queryGroupRoleBy(Integer groupId);
	
	public void addGroupRole(GroupRole groupRole);
	
	public void deleteGroupRole(Integer groupId);
	
	public List queryGroupRoleList(Integer userId);
	
	public void deleteGroupRoleByGroupId(Integer groupId);
	
	public void deleteGroupRoleByRoleId(Integer roleId);
}
