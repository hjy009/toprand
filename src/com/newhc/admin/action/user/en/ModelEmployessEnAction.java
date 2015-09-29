package com.newhc.admin.action.user.en;

import java.util.Date;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.entity.en.ModelEmployessEn;
import com.newhc.admin.exception.ServiceException;

public class ModelEmployessEnAction extends JSONPrintAction {
	private ModelEmployessEn modelEmployessEn;
	
	private Integer id;
	private String code;
	private String typeName;
	
	public String processEmployessEnAction(){
		
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id!=null){
			modelEmployessEn = DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(id);
		}else{
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		}
		return SUCCESS;
	}
	
	/**
	 * 修改或新增
	 * @return
	 */
	public String processUpdateEmployessEnAction(){
		if(modelEmployessEn.getId()!=null&&modelEmployessEn.getId()>0){
			ModelEmployessEn me = DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(id);
			me.setContent(modelEmployessEn.getContent());
			me.setUpdator(super.getOnlineUser().getName());
			me.setUpdateTime(new Date());
			DaoFactory.getModelEmployessEnDao().updateModelEmployessEn(me);
			super.setActionResponse(RESPONSE_SUCCESS);			
		}else{
			modelEmployessEn.setCreateTime(new Date());
			modelEmployessEn.setCreator(super.getOnlineUser().getName());
			DaoFactory.getModelEmployessEnDao().addModelEmployessEn(modelEmployessEn);
			super.setActionResponse(RESPONSE_SUCCESS);
		}	
		return SUCCESS;
	}
	
	 
	public ModelEmployessEn getModelEmployessEn() {
		return modelEmployessEn;
	}

	public void setModelEmployessEn(ModelEmployessEn modelEmployessEn) {
		this.modelEmployessEn = modelEmployessEn;
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
