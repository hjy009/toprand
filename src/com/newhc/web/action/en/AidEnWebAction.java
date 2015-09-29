package com.newhc.web.action.en;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.en.AidPartEn;

public class AidEnWebAction extends JSONPrintAction {
	private Integer imageType = new Integer(8);
	private Integer imageLimit = 1;
	private Integer id;
	public String processAidEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		List aidPartList = DaoFactory.getAidPartEnDao().queryAidPartEnList();
		if(this.getId()==null)
			setId(6);
		AidPartEn aidpartEn = DaoFactory.getAidPartEnDao().queryAidPartEnById(id);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("aidPartList", aidPartList);
		super.setRequestAttribute("aidpart", aidpartEn);
		return SUCCESS;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
