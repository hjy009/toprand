package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelAlbumTypeEn;

public interface ModelAlbumTypeEnDao {
	
	public Pagination queryModelAlbumTypeEnPage(String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelModelAlbumTypeEn(ModelAlbumTypeEn mp);
	
	public ModelAlbumTypeEn queryModelAlbumTypeEnById(Integer id);
	
	public void updateModelAlbumTypeEn(ModelAlbumTypeEn mp);
	
	public void deleteModelAlbumTypeEn(ModelAlbumTypeEn mp);
	
	public List queryModelAlbumTypeEnList();
	
}
