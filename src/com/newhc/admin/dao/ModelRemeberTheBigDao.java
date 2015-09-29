package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.ModelRemeberTheBig;


public interface ModelRemeberTheBigDao {
	
	public void addModelRemeberTheBig(ModelRemeberTheBig modelRemeberTheBig);
	
	public void updateModelRemeberTheBig(ModelRemeberTheBig modelRemeberTheBig);
	
	public ModelRemeberTheBig queryModelRemeberTheBigById(Integer id);
	
	public void deleteModelRemeberTheBig(ModelRemeberTheBig modelRemeberTheBig);
	
	public Pagination queryModelRemeberTheBigPage(Integer type ,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelReceiveVisitList(Integer receiveVisitLimit);
	
	public List queryReceiveVisitList(Integer receiveVisitLimit) ;
	
	public List queryModelRemeberTheBigList(String year,Integer type,Integer status);
}
