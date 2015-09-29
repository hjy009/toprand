package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelAlbumEn;

public interface ModelAlbumEnDao {
	
	public Pagination queryModelAlbumEnPage(Integer typeId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelAlbumEn(ModelAlbumEn mp);
	
	public ModelAlbumEn queryModelAlbumEnById(Integer id);
	
	public void updateModelAlbumEn(ModelAlbumEn mp);
	
	public void deleteModelAlbumEn(ModelAlbumEn mp);
	
	public Pagination queryModelAlbumEnWebPage(Integer typeId,int pageMaxSize,int pageNumber);
	
	public List queryModelAlbumEnList(Integer typeId);
	
}
