package com.newhc.admin.action.user.en;

import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.com.netmovie.helper.NumbericHelper;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelContact;
import com.newhc.admin.entity.en.ModelContactEn;
import com.newhc.admin.exception.ServiceException;


/**
 * 
 * @author liangzhongbao
 *
 * 2012-4-10
 */
public class ModelContactEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private ModelContactEn modelContactEn = new ModelContactEn();
	private Integer id;
	
	public String processViewModelContactEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List list = DaoFactory.getModelContactEnDao().queryModelContactEn();
		if(list!=null&&list.size()>0){
			modelContactEn.setId(NumbericHelper.getIntValue(((Map)list.get(0)).get("id"), 0));
			modelContactEn.setContent((String)((Map)list.get(0)).get("content"));
			
		}
		
		return SUCCESS;
	}
	private Integer imageType = new Integer(7);
	private Integer imageLimit = 1;
	
	/**
	 * 前台查询
	 * @return
	 */
	public String processQueryModelContactEnAction(){
		
		List list = DaoFactory.getModelContactEnDao().queryModelContactEn();
		super.setRequestAttribute("list", list);
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	
	
	/**
	 * 修改或新增
	 * @return
	 */
	public String processUpdateModelContactEnAction(){
		if(modelContactEn.getId()!=null&&modelContactEn.getId()>0){
			ModelContactEn ct = DaoFactory.getModelContactEnDao().queryModelContactEnById(modelContactEn.getId());
			ct.setContent(modelContactEn.getContent());
			ct.setUpdator(super.getOnlineUser().getName());
			ct.setUpdateTime(new Date());
			DaoFactory.getModelContactEnDao().updateModelContactEn(ct);
			super.setActionResponse(RESPONSE_SUCCESS);			
		}else{
			modelContactEn.setCreateTime(new Date());
			modelContactEn.setCreator(super.getOnlineUser().getName());
			DaoFactory.getModelContactEnDao().addModelContactEn(modelContactEn);
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


	public ModelContactEn getModelContactEn() {
		return modelContactEn;
	}


	public void setModelContactEn(ModelContactEn modelContactEn) {
		this.modelContactEn = modelContactEn;
	}
	 
}
