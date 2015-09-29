package com.newhc.admin.dao.en;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelNewsCenterEn;

public interface ModelNewCenterEnDao {
	public Pagination  queryNewCenterEnPage(String name,Integer status,Integer pageMaxSize,Integer pageNumber);
	public ModelNewsCenterEn queryNewsCenterEnById(Integer id);
	public void updateNewCenterEn(ModelNewsCenterEn modelNewsCenterEn);
	public void deleteNewCenterEn(ModelNewsCenterEn modelNewsCenterEn);
	public void addNewCenterEn(ModelNewsCenterEn modelNewsCenterEn);
}
