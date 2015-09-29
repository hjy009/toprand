package com.newhc.admin.dao;

import java.util.Date;
import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelNews;

public interface ModelNewsDao {
	public Pagination queryModelNewsPage(String title,Integer centerId,Integer year,Integer status,Integer sequence,Date startTime,Date endTime,
			Integer pageMaxSize,Integer pageNumber);
	
	public ModelNews queryModelNewsById(Integer id);
	
	public void deleteModelNews(ModelNews modelNews);
	
	public void updateModelNews(ModelNews modelNews);
	
	public void addModelNews(ModelNews modelNews);
	
	public void updateNewsClick(Integer id,Integer click);
	
	public List<ModelNews> queryNews(ModelNews modelNews);
	
	public List queryNewsByDistinct(Integer centerId);
	
	public List queryNewsByLimit(Integer centerId);
	
	public Pagination queryModelNewsWebPage(String title,Integer pageMaxSize,Integer pageNumber);
}
