package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelAlbum;
import com.newhc.admin.entity.ModelPeriodical;


import cn.com.netmovie.util.Pagination;

public interface ModelAlbumDao {
	
	public Pagination queryModelAlbumPage(Integer typeId,String name,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelAlbum(ModelAlbum mp);
	
	public ModelAlbum queryModelAlbumById(Integer id);
	
	public void updateModelAlbum(ModelAlbum mp);
	
	public void deleteModelAlbum(ModelAlbum mp);
	
	public Pagination queryModelAlbumWebPage(Integer typeId,int pageMaxSize,int pageNumber);
	
	public List queryModelAlbumList(Integer typeId);
	
}
