package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelEnterprises;


public interface ModelEnterprisesDao {
	
	public void addModelEnterprises(ModelEnterprises modelEnterprises);
	
	public void updateModelEnterprises(ModelEnterprises modelEnterprises);
	
	public ModelEnterprises queryModelEnterprisesById(Integer id);
	
	public void deleteModelEnterprises(ModelEnterprises modelEnterprises);
	
	public Pagination queryModelEnterprisesPage(Integer type ,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelEnterprisesList(Integer type) ;
	
	public List queryModelIndexEnterprisesList(Integer type) ;
}
