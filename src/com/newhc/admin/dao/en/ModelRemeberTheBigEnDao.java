package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelRemeberTheBigEn;


public interface ModelRemeberTheBigEnDao {
	
	public void addModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn);
	
	public void updateModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn);
	
	public ModelRemeberTheBigEn queryModelRemeberTheBigEnById(Integer id);
	
	public void deleteModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn);
	
	public Pagination queryModelRemeberTheBigEnPage(Integer type ,Integer status,Integer pageMaxSize,Integer pageNumber);

	public List queryModelReceiveVisitEnList(Integer receiveVisitLimit);
	
	public List queryReceiveVisitListEn(Integer receiveVisitLimit) ;
	
	public List queryModelRemeberTheBigEnList(String year,Integer type,Integer status);
}
