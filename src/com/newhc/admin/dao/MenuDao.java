package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.Menu;

import cn.com.netmovie.util.Pagination;

public interface MenuDao {
	
	public Pagination queryMenuPage(String name,String code,Integer type,Integer order,int pageMaxSize,int pageNumber);
	
	public void addMenu(Menu menu);
	
	public Menu loadMenuById(Integer id);
	
	public void updateMenu(Menu menu);
	
	public void deleteMenu(Menu menu);
	
	public List queryMenuList(Integer type);
}
