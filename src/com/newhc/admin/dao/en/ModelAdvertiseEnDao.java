package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelAdvertiseEn;


public interface ModelAdvertiseEnDao {
	
	public Pagination queryModelAdvertiseEnPage(String name,
			Integer type, Integer status, int pageMaxSize, int pageNumber);
	
	public ModelAdvertiseEn queryModelAdvertiseEnById(Integer id);
	
	public void updateModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn);
	
	public void addModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn);
	
	public void deleteModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn);
	
	public List queryAdvertiseEnByName(Integer type ,Integer status);
	
	
	public Pagination queryModelAdvertiseEnWebPage(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber);

}
