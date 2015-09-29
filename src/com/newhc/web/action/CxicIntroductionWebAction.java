package com.newhc.web.action;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.entity.ModelEnterprises;

public class CxicIntroductionWebAction extends JSONPrintAction{
	
	private ModelEmployess me = new ModelEmployess();
	
	private Integer imageType = new Integer(2);
	
	private Integer imageLimit = 1;
	/**
	 * 集团概况
	 * @return
	 */
	public String processIntroWebAction(){
		
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(new Integer(8), imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		me =  DaoFactory.getModelEmployessDao().queryModelEmployessById(new Integer(11));
		
		List t1List = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesList(new Integer(1));
		
		List t2List = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesList(new Integer(2));
		
		super.setRequestAttribute("t1List",t1List);
		
		super.setRequestAttribute("t2List",t2List);
		
		return SUCCESS;
	}
	/**
	 * 成员企业
	 * @return
	 */
	public String processEnterprisesWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		List t1List = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesList(new Integer(1));
		
		List t2List = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesList(new Integer(2));
		
		super.setRequestAttribute("t1List",t1List);
		
		super.setRequestAttribute("t2List",t2List);
		
		return SUCCESS;
	}
	
	private ModelEnterprises enterPrises= new ModelEnterprises();
	
	private Integer enterId;
	
	
	/**
	 * 成员企业详细
	 * @return
	 */
	public String processEnterprisesDetailWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		
		super.setRequestAttribute("imageList", imageList);
		
		enterPrises=DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(enterId);
		
		return SUCCESS;
	}

	
	public ModelEmployess getMe() {
		return me;
	}
	public void setMe(ModelEmployess me) {
		this.me = me;
	}

	public Integer getEnterId() {
		return enterId;
	}
	public void setEnterId(Integer enterId) {
		this.enterId = enterId;
	}
	public ModelEnterprises getEnterPrises() {
		return enterPrises;
	}
	public void setEnterPrises(ModelEnterprises enterPrises) {
		this.enterPrises = enterPrises;
	}

}
