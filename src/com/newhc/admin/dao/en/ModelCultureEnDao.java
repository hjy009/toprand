package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelCultureEn;

public interface ModelCultureEnDao {
	public Pagination queryModelCultureEnPage(String name,Integer Status,Integer pageMaxSize,Integer pageNumber);
	public ModelCultureEn queryModelCultureEnId(Integer id);
	public void addModelCultureEn(ModelCultureEn modelCultureEn);
	public void deleteModelCultureEn(ModelCultureEn modelCultureEn);
	public void updateModelCultureEn(ModelCultureEn modelCultureEn);
	
	/** web */
	
	public List queryModelCultureEnList(Integer id);
}
