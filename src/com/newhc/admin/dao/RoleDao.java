package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.Role;

import cn.com.netmovie.util.Pagination;

public interface RoleDao {
	
	public Pagination queryRolePage(String code,String name,Integer type,Integer order,int pageMaxSize,int pageNumber);
	
	public void addRole(Role role);
	
	public void updateRole(Role role);
	
	public Role loadRoleById(Integer id);
	
	public void deleteRole(Role role);
	
	public List queryRoleList(Integer type);
	
	public List queryRoleIdByCode(String code);
}
