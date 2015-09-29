package com.newhc.web.action;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelVideo;

public class VideoWebAction extends JSONPrintAction {
	private Integer imageType = new Integer(2);
	private Integer imageLimit = 1;
	private Integer pageMaxSize=6;
	private Integer pageNumber=1;
	private Integer id;
	private ModelVideo modelVideo;
	public String processVideoAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		Pagination pi= DaoFactory.getModelVideoDao().queryVideoWebPage(pageMaxSize, pageNumber);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pi);
		return SUCCESS;
	}
	public String processVideoDetaiAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		modelVideo =  DaoFactory.getModelVideoDao().loadModelVideo(id);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getImageLimit() {
		return imageLimit;
	}
	public void setImageLimit(Integer imageLimit) {
		this.imageLimit = imageLimit;
	}
	public Integer getImageType() {
		return imageType;
	}
	public void setImageType(Integer imageType) {
		this.imageType = imageType;
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
	public ModelVideo getModelVideo() {
		return modelVideo;
	}
	public void setModelVideo(ModelVideo modelVideo) {
		this.modelVideo = modelVideo;
	}
	
	
	
}
