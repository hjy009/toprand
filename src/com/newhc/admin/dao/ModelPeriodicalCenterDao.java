package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPeriodicalCenter;


import cn.com.netmovie.util.Pagination;

public interface ModelPeriodicalCenterDao {
	
	public Pagination queryModelPeriodicalCenterPage(Integer periodicalId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelPeriodicalCenter(ModelPeriodicalCenter mpc);
	
	public ModelPeriodicalCenter queryModelPeriodicalCenterById(Integer id);
	
	public void updateModelPeriodicalCenter(ModelPeriodicalCenter mpc);
	
	public void deleteModelPeriodicalCenter(ModelPeriodicalCenter mpc);
	
	public List queryModelPeriodicalCenterWebList(Integer periodicalId);
	
}
