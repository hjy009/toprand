package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelFactoryEnvironment;

public interface ModelFactoryEnvironmentDao {
	public void addModelFactoryEnvironment(ModelFactoryEnvironment mfe);
	
	public void deleteModelFactoryEnvironment(ModelFactoryEnvironment mfe);
	
	public void updateModelFactoryEnvironment(ModelFactoryEnvironment mfe);
	
	public ModelFactoryEnvironment queryModelFactoryEnvironmentById(Integer id);
	
	public Pagination queryModelFactoryEnvironmentPage(String name,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelFactoryEnvironmentWebList();
}
