package com.newhc.web.action;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AidPart;

public class AidWebAction extends JSONPrintAction {
	private Integer imageType = new Integer(8);
	private Integer imageLimit = 1;
	private Integer id;
	public String processAidWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		List aidPartList = DaoFactory.getAidPartDao().queryAidPartList();
		if(this.getId()==null)
			setId(6);
		AidPart aidpart = DaoFactory.getAidPartDao().queryAidPartById(id);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("aidPartList", aidPartList);
		super.setRequestAttribute("aidpart", aidpart);
		return SUCCESS;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
