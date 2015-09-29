package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelPeriodicalCenterEn;

public interface ModelPeriodicalCenterEnDao {
	
	public Pagination queryModelPeriodicalCenterEnPage(Integer periodicalId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc);
	
	public ModelPeriodicalCenterEn queryModelPeriodicalCenterEnById(Integer id);
	
	public void updateModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc);
	
	public void deleteModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc);
	
	public List queryModelPeriodicalCenterEnWebList(Integer periodicalId);
	
}
