package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelColumnImage;



public interface ModelColumnImageDao {
	
	public void addModelColumnImage(ModelColumnImage modelColumnImage);
	
	public void updateModelColumnImage(ModelColumnImage modelColumnImage);
	
	public ModelColumnImage queryModelColumnImageById(Integer id);
	
	public void deleteModelColumnImage(ModelColumnImage modelColumnImage);
	
	public Pagination queryModelColumnImagePage(String title,Integer status,Integer type,Integer parentType,Integer pageMaxSize,Integer pageNumber);
	
	public List queryModelColumnImageBy(Integer type,Integer limit);
	
	public List queryModelColumnImageBy(Integer userId);
	
	

}
