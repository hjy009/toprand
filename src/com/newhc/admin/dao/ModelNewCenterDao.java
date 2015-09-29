package com.newhc.admin.dao;

import com.newhc.admin.entity.ModelNewsCenter;

import cn.com.netmovie.util.Pagination;

public interface ModelNewCenterDao {
	public Pagination  queryNewCenterPage(String name,Integer status,Integer pageMaxSize,Integer pageNumber);
	public ModelNewsCenter queryNewsCenterById(Integer id);
	public void updateNewCenter(ModelNewsCenter modelNewsCenter);
	public void deleteNewCenter(ModelNewsCenter modelNewsCenter);
	public void addNewCenter(ModelNewsCenter modelNewsCenter);
}
