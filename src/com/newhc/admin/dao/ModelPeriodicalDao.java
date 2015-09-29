package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelPeriodical;


import cn.com.netmovie.util.Pagination;

public interface ModelPeriodicalDao {
	
	public Pagination queryModelPeriodicalPage(Integer typeId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelPeriodical(ModelPeriodical mp);
	
	public ModelPeriodical queryModelPeriodicalById(Integer id);
	
	public void updateModelPeriodical(ModelPeriodical mp);
	
	public void deleteModelPeriodical(ModelPeriodical mp);
	
	public Pagination queryModelPeriodicalWebPage(Integer typeId,int pageMaxSize,int pageNumber);
	
	public List queryModelPeriodicalList();
	
}
