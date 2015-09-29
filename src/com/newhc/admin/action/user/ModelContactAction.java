package com.newhc.admin.action.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelContact;
import com.newhc.admin.exception.ServiceException;

import cn.com.netmovie.helper.NumbericHelper;


/**
 * 
 * @author liangzhongbao
 *
 * 2012-4-10
 */
public class ModelContactAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private ModelContact modelContact = new ModelContact();
	private Integer id;
	
	public String processViewModelContactAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List list = DaoFactory.getModelContactDao().queryModelContact();
		if(list!=null&&list.size()>0){
			modelContact.setId(NumbericHelper.getIntValue(((Map)list.get(0)).get("id"), 0));
			modelContact.setContent((String)((Map)list.get(0)).get("content"));
			
		}
		
		return SUCCESS;
	}
	private Integer imageType = new Integer(7);
	private Integer imageLimit = 1;
	
	/**
	 * 前台查询
	 * @return
	 */
	public String processQueryModelContactAction(){
		
		List list = DaoFactory.getModelContactDao().queryModelContact();
		super.setRequestAttribute("list", list);
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	
	
	/**
	 * 修改或新增
	 * @return
	 */
	public String processUpdateModelContactAction(){
		if(modelContact.getId()!=null&&modelContact.getId()>0){
			ModelContact ct = DaoFactory.getModelContactDao().queryModelContactById(modelContact.getId());
			ct.setContent(modelContact.getContent());
			ct.setUpdator(super.getOnlineUser().getName());
			ct.setUpdateTime(new Date());
			DaoFactory.getModelContactDao().updateModelContact(ct);
			super.setActionResponse(RESPONSE_SUCCESS);			
		}else{
			modelContact.setCreateTime(new Date());
			modelContact.setCreator(super.getOnlineUser().getName());
			DaoFactory.getModelContactDao().addModelContact(modelContact);
			super.setActionResponse(RESPONSE_SUCCESS);
		}	
		return SUCCESS;
	}
	
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public ModelContact getModelContact() {
		return modelContact;
	}
	public void setModelContact(ModelContact modelContact) {
		this.modelContact = modelContact;
	}	

}
