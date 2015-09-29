package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelEnterprisesEn;


public interface ModelEnterprisesEnDao {
	
	public void addModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn);
	
	public void updateModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn);
	
	public ModelEnterprisesEn queryModelEnterprisesEnById(Integer id);
	
	public void deleteModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn);
	
	public Pagination queryModelEnterprisesEnPage(Integer type ,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelEnterprisesEnList(Integer type) ;
	
	public List queryModelIndexEnterprisesEnList(Integer type) ;
}
