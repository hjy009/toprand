package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelAlbumType;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPublicationType;


import cn.com.netmovie.util.Pagination;

public interface ModelAlbumTypeDao {
	
	public Pagination queryModelAlbumTypePage(String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelModelAlbumType(ModelAlbumType mp);
	
	public ModelAlbumType queryModelAlbumTypeById(Integer id);
	
	public void updateModelAlbumType(ModelAlbumType mp);
	
	public void deleteModelAlbumType(ModelAlbumType mp);
	
	public List queryModelAlbumTypeList();
	
}
