package com.newhc.admin.dao;

import java.util.Date;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelVideo;

public interface ModelVideoDao {
	public Pagination queryModelVideoPage(Integer categoryId,String name ,Date startTime,Date endTime,
			Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelVideo(ModelVideo modelVideo);
	
	public void updateModelVideo(ModelVideo modelVideo);
	
	public ModelVideo loadModelVideo(Integer id);
	
	public void deleteModelVideo(ModelVideo modelVideo);
	
	public Pagination queryVideoWebPage(int pageMaxSize,int pageNumber);

}
