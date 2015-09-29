package com.newhc.admin.dao;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelVideoCategory;

public interface ModelVideoCategoryDao {
	public Pagination queryModelVideoCategoryPage(String name,Integer type,
			Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelVideoCategory(ModelVideoCategory modelVideoCategory);
	
	public void updateModelVideoCategory(ModelVideoCategory modelVideoCategory);
	
	public ModelVideoCategory loadModelVideoCategory(Integer id);
	
	public void deleteModelVideoCategory(ModelVideoCategory modelVideoCategory);
	
	public Integer queryModelVideoByCategoryId(Integer categoryId);

}
