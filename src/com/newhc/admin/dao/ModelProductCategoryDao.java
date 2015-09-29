package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelProduct;
import com.newhc.admin.entity.ModelProductCategory;
import com.newhc.admin.entity.ModelProductHistory;

import cn.com.netmovie.util.Pagination;

public interface ModelProductCategoryDao {
	
	public Pagination queryModelProductCategoryPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber);
	
	public void addModelProductCategory(ModelProductCategory mpc);
	
	public ModelProductCategory queryModelProductCategoryById(Integer id);
	
	public void updateModelProductCategory(ModelProductCategory mpc);
	
	public void deleteModelProductCategory(ModelProductCategory mpc);
	
	
	public int queryModelProductByCategoryId(Integer categoryId);
	
	public Pagination queryModelProductPage(Integer categoryId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber);
	
	public void addModelProduct(ModelProduct modelProduct);
	
	public ModelProduct queryModelProductById(Integer id);
	
	public void updateModelProduct(ModelProduct mp);
	
	public void deleteModelProduct(ModelProduct mp);
	
	public List queryModelProductHistoryByProductId(Integer id);
	
	
	//	产品历史记录
	public Pagination queryModelProductHistoryPage(Integer productId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber);
	
	public void addModelProductHistory(ModelProductHistory modelProductHistory);
	
	public ModelProductHistory queryModelProductHistoryById(Integer id);
	
	public void deleteModelProductHistory(ModelProductHistory mp);
	
	
	//web
	
	public Pagination queryModelProductWebPage(String name,Integer productId,int pageMaxSize,int pageNumber);
	
	public List queryModelProductWebList(Integer categoryId);
}
