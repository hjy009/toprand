package com.newhc.web.action.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelVideo;
import com.newhc.admin.entity.en.ModelVideoEn;

public class VideoEnWebAction extends JSONPrintAction {
	private Integer imageType = new Integer(2);
	private Integer imageLimit = 1;
	private Integer pageMaxSize=6;
	private Integer pageNumber=1;
	private Integer id;
	private ModelVideoEn modelVideo;
	public String processVideoEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		Pagination pi= DaoFactory.getModelVideoEnDao().queryVideoEnWebPage(pageMaxSize, pageNumber);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pi);
		return SUCCESS;
	}
	public String processVideoDetaiEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		modelVideo =  DaoFactory.getModelVideoEnDao().loadModelVideoEn(id);
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
	public ModelVideoEn getModelVideo() {
		return modelVideo;
	}
	public void setModelVideo(ModelVideoEn modelVideo) {
		this.modelVideo = modelVideo;
	}
	 
	
	
	
}
