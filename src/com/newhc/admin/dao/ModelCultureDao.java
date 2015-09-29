package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelCulture;

import cn.com.netmovie.util.Pagination;

public interface ModelCultureDao {
	public Pagination queryModelCulturePage(String name,Integer Status,Integer pageMaxSize,Integer pageNumber);
	public ModelCulture queryModelCultureId(Integer id);
	public void addModelCulture(ModelCulture modelCulture);
	public void deleteModelCulture(ModelCulture modelCulture);
	public void updateModelCulture(ModelCulture modelCulture);
	
	/** web */
	
	public List queryModelCultureList(Integer id);
}
