package com.newhc.admin.dao.en;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelLinkEn;

public interface ModelLinkEnDao {
	
	public void addModelLinkEn(ModelLinkEn modelLinkEn);
	
	public void updateModelLinkEn(ModelLinkEn modelLinkEn);
	
	public ModelLinkEn queryModelLinkEnById(Integer id);
	
	public void deleteModelLinkEn(ModelLinkEn modelLinkEn);
	
	public Pagination queryModelLinkEnPage(String name,String logo,Integer status,Integer pageMaxSize,Integer pageNumber);

}
