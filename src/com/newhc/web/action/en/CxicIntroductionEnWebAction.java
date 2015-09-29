package com.newhc.web.action.en;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.entity.ModelEnterprises;
import com.newhc.admin.entity.en.ModelEmployessEn;
import com.newhc.admin.entity.en.ModelEnterprisesEn;

public class CxicIntroductionEnWebAction extends JSONPrintAction{
	
	private ModelEmployessEn me = new ModelEmployessEn();
	
	private Integer imageType = new Integer(2);
	
	private Integer imageLimit = 1;
	/**
	 * 集团概况
	 * @return
	 */
	public String processIntroEnWebAction(){
		
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(new Integer(8), imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		me =  DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(new Integer(4));
		
		List t1List = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnList(new Integer(1));
		
		List t2List = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnList(new Integer(2));
		
		super.setRequestAttribute("t1List",t1List);
		
		super.setRequestAttribute("t2List",t2List);
		
		return SUCCESS;
	}
	/**
	 * 成员企业
	 * @return
	 */
	public String processEnterprisesEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		List t1List = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnList(new Integer(1));
		
		List t2List = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnList(new Integer(2));
		
		super.setRequestAttribute("t1List",t1List);
		
		super.setRequestAttribute("t2List",t2List);
		
		return SUCCESS;
	}
	
	private ModelEnterprisesEn enterPrises= new ModelEnterprisesEn();
	
	private Integer enterId;
	
	
	/**
	 * 成员企业详细
	 * @return
	 */
	public String processEnterprisesDetailEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		enterPrises=DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(enterId);
		
		return SUCCESS;
	}

	
	 

	public Integer getEnterId() {
		return enterId;
	}
	public void setEnterId(Integer enterId) {
		this.enterId = enterId;
	}
	 
	public ModelEnterprisesEn getEnterPrises() {
		return enterPrises;
	}
	public void setEnterPrises(ModelEnterprisesEn enterPrises) {
		this.enterPrises = enterPrises;
	}
	public ModelEmployessEn getMe() {
		return me;
	}
	public void setMe(ModelEmployessEn me) {
		this.me = me;
	}
	 

}
