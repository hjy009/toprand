package com.newhc.web.action.en;

import java.util.List;
import java.util.Map;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelCulture;
import com.newhc.admin.entity.en.ModelCultureEn;
import com.newhc.admin.entity.en.ModelPeriodicalEn;

public class CultureEnWebAction extends JSONPrintAction {
	private ModelCultureEn modelCulture = new ModelCultureEn();
	private Integer id=29;
	private Integer imageType = new Integer(3);
	private Integer imageLimit = 1;
	private Integer pageMaxSize = 6;
	private Integer pageNumber = 1;
	private Integer periodicalId;
	private String periodicalName;
	private Integer typeId;
	public String processCultureIdEnWebAction(){
		List columnFlashList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("columnFlashList", columnFlashList);
		modelCulture = DaoFactory.getModelCultureEnDao().queryModelCultureEnId(id);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		return SUCCESS;
	}
	/**
	 * 核心价值观
	 * @return
	 */
	public String processCultureByCoreEnWebAction(){
		imageType = new Integer(9);
		imageLimit = 1; 
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		super.setRequestAttribute("imageList", imageList);
		modelCulture = DaoFactory.getModelCultureEnDao().queryModelCultureEnId(id);
		return SUCCESS;
	}
	/**
	 * 企业目标
	 * @return
	 */
	public String processTargetEnWebAction(){
		imageType = new Integer(10);
		imageLimit = 1; 
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		modelCulture = DaoFactory.getModelCultureEnDao().queryModelCultureEnId(id);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	/**
	 * 电子期刊
	 * @return
	 */
	public String processEjournalsEnWebAction(){
		List columnFlashList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("columnFlashList", columnFlashList);
		Pagination pages = DaoFactory.getModelPeriodicalEnDao().queryModelPeriodicalEnWebPage(typeId,pageMaxSize, pageNumber);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("typeId", typeId);
		return SUCCESS;
	}
	/**
	 * 电子期刊内容
	 * @return
	 */
	public String processEjournalsDetailEnWebAction(){
		List columnFlashList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("columnFlashList", columnFlashList);
		ModelPeriodicalEn mp = DaoFactory.getModelPeriodicalEnDao().queryModelPeriodicalEnById(periodicalId);
		this.setPeriodicalName(mp.getName());
		List list =DaoFactory.getModelPeriodicalCenterEnDao().queryModelPeriodicalCenterEnWebList(periodicalId);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 电子画册类型
	 * @return
	 */
	public String processAlbumTypeEnWebAction(){
		List columnFlashList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("columnFlashList", columnFlashList);
		Pagination pages = DaoFactory.getModelAlbumTypeEnDao().queryModelAlbumTypeEnPage(null, new Integer(1), pageMaxSize, pageNumber);
		List mptList = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnList();
		super.setRequestAttribute("mptList", mptList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("typeId", typeId);
		return SUCCESS;
	}
	/**
	 * 电子画册
	 * @return
	 */
	public String processAlbumEnWebAction(){
		String img1="";
		String img2="";
		String str1 ="" ;
		String str2 ="" ;
		List list =DaoFactory.getModelAlbumEnDao().queryModelAlbumEnList(typeId);
		for(int i=0;i<list.size();i++){
			Map map = (Map)list.get(i);
			if(i+1==list.size()){
				img1+="\"/"+map.get("image_path")+"\"";
				img2+="/"+map.get("image_path");
				str1 += "\"\"";
				str2 += "|,";
			}
			else{
				img1+="\"/"+map.get("image_path")+"|\",";
				img2+="/"+map.get("image_path")+"|,";
				str1 += "\"|\",";
				str2 += "|,";
			}
			
		}
		
		super.setRequestAttribute("img1", img1);
		super.setRequestAttribute("img2", img2);
		super.setRequestAttribute("str1", str1);
		super.setRequestAttribute("str2", str2);
		return SUCCESS;
	}
	 

 
	public ModelCultureEn getModelCulture() {
		return modelCulture;
	}
	public void setModelCulture(ModelCultureEn modelCulture) {
		this.modelCulture = modelCulture;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
	public Integer getPeriodicalId() {
		return periodicalId;
	}
	public void setPeriodicalId(Integer periodicalId) {
		this.periodicalId = periodicalId;
	}
	public String getPeriodicalName() {
		return periodicalName;
	}
	public void setPeriodicalName(String periodicalName) {
		this.periodicalName = periodicalName;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	
}
