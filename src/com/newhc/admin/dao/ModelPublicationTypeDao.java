package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPublicationType;


import cn.com.netmovie.util.Pagination;

public interface ModelPublicationTypeDao {
	
	public Pagination queryModelPublicationTypePage(String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelModelPublicationType(ModelPublicationType mp);
	
	public ModelPublicationType queryModelPublicationTypeById(Integer id);
	
	public void updateModelPublicationType(ModelPublicationType mp);
	
	public void deleteModelPublicationType(ModelPublicationType mp);
	
	public List queryModelPublicationTypeList();
	
}
