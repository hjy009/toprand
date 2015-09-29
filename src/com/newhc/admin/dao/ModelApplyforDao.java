package com.newhc.admin.dao;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelApplyfor;

public interface ModelApplyforDao {
	public Pagination queryModelApplyfor(String name,Integer pageMaxSize,Integer pageNumber);
	
	public ModelApplyfor queryModelApplyforId(Integer id);
	
	public void addModelApplyfor(ModelApplyfor modelApplyfor);
 
	public void deleteModelApplyfor(ModelApplyfor modelApplyfor);
	
}
