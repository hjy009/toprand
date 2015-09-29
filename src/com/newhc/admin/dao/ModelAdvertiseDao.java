package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelAdvertise;


public interface ModelAdvertiseDao {
	
	public Pagination queryModelAdvertisePage(String name,
			Integer type, Integer status, int pageMaxSize, int pageNumber);
	
	public ModelAdvertise queryModelAdvertiseById(Integer id);
	
	public void updateModelAdvertise(ModelAdvertise modelAdvertise);
	
	public void addModelAdvertise(ModelAdvertise modelAdvertise);
	
	public void deleteModelAdvertise(ModelAdvertise modelAdvertise);
	
	public List queryAdvertiseByName(Integer type ,Integer status);
	
	
	public Pagination queryModelAdvertiseWebPage(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber);

}
