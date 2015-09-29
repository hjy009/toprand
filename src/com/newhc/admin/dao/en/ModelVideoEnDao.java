package com.newhc.admin.dao.en;

import java.util.Date;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelVideoEn;

public interface ModelVideoEnDao {
	public Pagination queryModelVideoEnPage(Integer categoryId,String name ,Date startTime,Date endTime,
			Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelVideoEn(ModelVideoEn modelVideoEn);
	
	public void updateModelVideoEn(ModelVideoEn modelVideoEn);
	
	public ModelVideoEn loadModelVideoEn(Integer id);
	
	public void deleteModelVideoEn(ModelVideoEn modelVideoEn);
	
	public Pagination queryVideoEnWebPage(int pageMaxSize,int pageNumber);

}
