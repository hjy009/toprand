package com.newhc.admin.dao.en;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelApplyforEn;

public interface ModelApplyforEnDao {
	public Pagination queryModelApplyforEn(String name,Integer pageMaxSize,Integer pageNumber);
	
	public ModelApplyforEn queryModelApplyforEnId(Integer id);
	
	public void addModelApplyforEn(ModelApplyforEn modelApplyforEn);
 
	public void deleteModelApplyforEn(ModelApplyforEn modelApplyforEn);
	
}
