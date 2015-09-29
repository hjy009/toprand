package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.ModelProductCategoryEn;
import com.newhc.admin.entity.en.ModelProductEn;
import com.newhc.admin.entity.en.ModelProductHistoryEn;

public interface ModelProductCategoryEnDao {
	
	public Pagination queryModelProductCategoryEnPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelProductCategoryEn(ModelProductCategoryEn mpc);
	
	public ModelProductCategoryEn queryModelProductCategoryEnById(Integer id);
	
	public void updateModelProductCategoryEn(ModelProductCategoryEn mpc);
	
	public void deleteModelProductCategoryEn(ModelProductCategoryEn mpc);
	
	
	public int queryModelProductByCategoryEnId(Integer categoryId);
	
	public Pagination queryModelProductEnPage(Integer categoryId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber);
	
	public void addModelProductEn(ModelProductEn modelProductEn);
	
	public ModelProductEn queryModelProductEnById(Integer id);
	
	public void updateModelProductEn(ModelProductEn mp);
	
	public void deleteModelProductEn(ModelProductEn mp);
	
	public List queryModelProductHistoryEnByProductId(Integer id);
	
	
	//	产品历史记录
	public Pagination queryModelProductHistoryEnPage(Integer productId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber);
	
	public void addModelProductHistoryEn(ModelProductHistoryEn modelProductHistoryEn);
	
	public ModelProductHistoryEn queryModelProductHistoryEnById(Integer id);
	
	public void deleteModelProductHistoryEn(ModelProductHistoryEn mp);
	
	
	//web
	
	public Pagination queryModelProductEnWebPage(String name,Integer productId,int pageMaxSize,int pageNumber);
	
	public List queryModelProductEnWebList(Integer categoryId);
}
