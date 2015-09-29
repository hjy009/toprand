package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelFactoryEnvironmentEn;

public interface ModelFactoryEnvironmentEnDao {
	public void addModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe);
	
	public void deleteModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe);
	
	public void updateModelFactoryEnvironmentEn(ModelFactoryEnvironmentEn mfe);
	
	public ModelFactoryEnvironmentEn queryModelFactoryEnvironmentEnById(Integer id);
	
	public Pagination queryModelFactoryEnvironmentEnPage(String name,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelFactoryEnvironmentEnWebList();
}
