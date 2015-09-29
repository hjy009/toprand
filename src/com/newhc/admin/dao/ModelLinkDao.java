package com.newhc.admin.dao;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelLink;

public interface ModelLinkDao {
	
	public void addModelLink(ModelLink modelLink);
	
	public void updateModelLink(ModelLink modelLink);
	
	public ModelLink queryModelLinkById(Integer id);
	
	public void deleteModelLink(ModelLink modelLink);
	
	public Pagination queryModelLinkPage(String name,String logo,Integer status,Integer pageMaxSize,Integer pageNumber);

}
