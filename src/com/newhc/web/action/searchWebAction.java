package com.newhc.web.action;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;

public class searchWebAction extends JSONPrintAction {

	private String name;
	private Integer pageMaxSize=9;
	private Integer pageNumber=1;
	public String processByProductAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(8, 1);
		super.setRequestAttribute("imageList", imageList);
		Pagination pi = DaoFactory.getModelProductCategoryDao().queryModelProductWebPage(name,null, pageMaxSize, pageNumber);
		super.setRequestAttribute("pages", pi);
		return SUCCESS;
	}
	public String processByNewsAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(8, 1);
		super.setRequestAttribute("imageList", imageList);
		Pagination pi = DaoFactory.getModelNewsDao().queryModelNewsWebPage(name, pageMaxSize, pageNumber);
		super.setRequestAttribute("pages", pi);
		return SUCCESS;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPageMaxSize() {
		return pageMaxSize;
	}
	public void setPageMaxSize(Integer pageMaxSize) {
		this.pageMaxSize = pageMaxSize;
	}
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	
	
	
}
