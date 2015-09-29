package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelColumnImageEn;



public interface ModelColumnImageEnDao {
	
	public void addModelColumnImageEn(ModelColumnImageEn modelColumnImageEn);
	
	public void updateModelColumnImageEn(ModelColumnImageEn modelColumnImageEn);
	
	public ModelColumnImageEn queryModelColumnImageEnById(Integer id);
	
	public void deleteModelColumnImageEn(ModelColumnImageEn modelColumnImageEn);
	
	public Pagination queryModelColumnImageEnPage(String title,Integer status,Integer type,Integer parentType,Integer pageMaxSize,Integer pageNumber);
	
	public List queryModelColumnImageEnBy(Integer type,Integer limit);
	
	public List queryModelColumnImageEnBy(Integer userId);
	
	

}
