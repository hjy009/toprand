package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelPublicationTypeEn;

public interface ModelPublicationTypeEnDao {
	
	public Pagination queryModelPublicationTypeEnPage(String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelModelPublicationTypeEn(ModelPublicationTypeEn mp);
	
	public ModelPublicationTypeEn queryModelPublicationTypeEnById(Integer id);
	
	public void updateModelPublicationTypeEn(ModelPublicationTypeEn mp);
	
	public void deleteModelPublicationTypeEn(ModelPublicationTypeEn mp);
	
	public List queryModelPublicationTypeEnList();
	
}
