package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelPeriodicalEn;

public interface ModelPeriodicalEnDao {
	
	public Pagination queryModelPeriodicalEnPage(Integer typeId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelPeriodicalEn(ModelPeriodicalEn mp);
	
	public ModelPeriodicalEn queryModelPeriodicalEnById(Integer id);
	
	public void updateModelPeriodicalEn(ModelPeriodicalEn mp);
	
	public void deleteModelPeriodicalEn(ModelPeriodicalEn mp);
	
	public Pagination queryModelPeriodicalEnWebPage(Integer typeId,int pageMaxSize,int pageNumber);
	
	public List queryModelPeriodicalEnList();
	
}
