package com.newhc.admin.dao.en;

import java.util.Date;
import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelNewsEn;

public interface ModelNewsEnDao {
	public Pagination queryModelNewsEnPage(String title,Integer centerId,Integer year,Integer status,Integer sequence,Date startTime,Date endTime,
			Integer pageMaxSize,Integer pageNumber);
	
	public ModelNewsEn queryModelNewsEnById(Integer id);
	
	public void deleteModelNewsEn(ModelNewsEn modelNewsEn);
	
	public void updateModelNewsEn(ModelNewsEn modelNewsEn);
	
	public void addModelNewsEn(ModelNewsEn modelNewsEn);
	
	public void updateNewsEnClick(Integer id,Integer click);
	
	public List<ModelNewsEn> queryNewsEn(ModelNewsEn modelNewsEn);
	
	public List queryNewsEnByDistinct(Integer centerId);
	
	public List queryNewsEnByLimit(Integer centerId);
	
	public Pagination queryModelNewsEnWebPage(String title,Integer pageMaxSize,Integer pageNumber);
}
