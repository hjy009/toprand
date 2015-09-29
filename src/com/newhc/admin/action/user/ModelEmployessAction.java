package com.newhc.admin.action.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.com.netmovie.helper.NumbericHelper;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelContact;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.exception.ServiceException;

public class ModelEmployessAction extends JSONPrintAction {
	private ModelEmployess modelEmployess;
	
	private Integer id;
	private String code;
	private String typeName;
	
	public String processEmployessAction(){
		
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id!=null){
			modelEmployess = DaoFactory.getModelEmployessDao().queryModelEmployessById(id);
		}else{
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		}
		return SUCCESS;
	}
	
	/**
	 * 修改或新增
	 * @return
	 */
	public String processUpdateEmployessAction(){
		if(modelEmployess.getId()!=null&&modelEmployess.getId()>0){
			ModelEmployess me = DaoFactory.getModelEmployessDao().queryModelEmployessById(id);
			me.setContent(modelEmployess.getContent());
			me.setUpdator(super.getOnlineUser().getName());
			me.setUpdateTime(new Date());
			DaoFactory.getModelEmployessDao().updateModelEmployess(me);
			super.setActionResponse(RESPONSE_SUCCESS);			
		}else{
			modelEmployess.setCreateTime(new Date());
			modelEmployess.setCreator(super.getOnlineUser().getName());
			DaoFactory.getModelEmployessDao().addModelEmployess(modelEmployess);
			super.setActionResponse(RESPONSE_SUCCESS);
		}	
		return SUCCESS;
	}
	
	public ModelEmployess getModelEmployess() {
		return modelEmployess;
	}
	public void setModelEmployess(ModelEmployess modelEmployess) {
		this.modelEmployess = modelEmployess;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
	
}
