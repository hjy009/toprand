package com.newhc.admin.dao.en;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelVideoCategoryEn;

public interface ModelVideoCategoryEnDao {
	public Pagination queryModelVideoCategoryEnPage(String name,Integer type,
			Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn);
	
	public void updateModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn);
	
	public ModelVideoCategoryEn loadModelVideoCategoryEn(Integer id);
	
	public void deleteModelVideoCategoryEn(ModelVideoCategoryEn modelVideoCategoryEn);
	
	public Integer queryModelVideoByCategoryEnId(Integer categoryId);

}
