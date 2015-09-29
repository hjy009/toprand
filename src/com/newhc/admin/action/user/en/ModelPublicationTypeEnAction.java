package com.newhc.admin.action.user.en;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.en.ModelPublicationTypeEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelPublicationType;
import com.newhc.admin.entity.en.ModelPublicationTypeEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.NewStringHelper;

public class ModelPublicationTypeEnAction extends JSONPrintAction {
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsCenterEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	
	private String name;
	private Integer id;
	private Integer status;
	private String ShenHeId;

	
	
	
	private ModelPublicationTypeEn modelPeriodicalEn = new ModelPublicationTypeEn();
	
	public String processModelPublicationTypePageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination pi = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnPage(name, status, pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(pi!=null&&pi.getTotalCount()>0){
			for(Iterator i = pi.getList().iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelPublicationTypeEnView mpv = new ModelPublicationTypeEnView();
				mpv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mpv.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));

				mpv.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mpv.setSequence(NumbericHelper.getIntValue((Integer)map.get("sequence"),0));
				mpv.setCreator((String)map.get("creator"));
				mpv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mpv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(pi.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelProductCategoryStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	
	
	public String processAddModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		modelPeriodicalEn.setCreator(super.getOnlineUser().getName());
		modelPeriodicalEn.setCreateTime(new Date());
		modelPeriodicalEn.setStatus(new Integer(0));
		DaoFactory.getModelPublicationTypeEnDao().addModelModelPublicationTypeEn(modelPeriodicalEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelPeriodicalEn = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		ModelPublicationTypeEn mp = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(id);
		
		mp.setName(modelPeriodicalEn.getName());
		mp.setSequence(modelPeriodicalEn.getSequence());
		mp.setUpdator(super.getOnlineUser().getName());
		mp.setUpdateTime(new Date());
		DaoFactory.getModelPublicationTypeEnDao().updateModelPublicationTypeEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelPublicationTypeEn mp = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(id);
		mp.setStatus(new Integer(1));
		DaoFactory.getModelPublicationTypeEnDao().updateModelPublicationTypeEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelPublicationTypeEn mp = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(id);
		mp.setStatus(new Integer(0));
		DaoFactory.getModelPublicationTypeEnDao().updateModelPublicationTypeEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelPublicationTypeEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelPublicationTypeEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(1));
				DaoFactory.getModelPublicationTypeEnDao().updateModelPublicationTypeEn(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量重审核
	 * @return
	 */
	public String processReAuditAllModelPublicationTypeEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelPublicationTypeEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(0));
				DaoFactory.getModelPublicationTypeEnDao().updateModelPublicationTypeEn(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelNewsEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelPublicationTypeEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				Integer shId = Integer.valueOf(shenhe[i]);
				mp =DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(shId);
				DaoFactory.getModelPublicationTypeEnDao().deleteModelPublicationTypeEn(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	
	
	/**
	 * 删除数据
	 * @return
	 */
	public String processDeleteModelPublicationTypeEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelPublicationTypeEn mp = DaoFactory.getModelPublicationTypeEnDao().queryModelPublicationTypeEnById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelPublicationTypeEnDao().deleteModelPublicationTypeEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	

	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	public ModelPublicationTypeEn getModelPeriodicalEn() {
		return modelPeriodicalEn;
	}
	public void setModelPeriodicalEn(ModelPublicationTypeEn modelPeriodicalEn) {
		this.modelPeriodicalEn = modelPeriodicalEn;
	}
	 
	
	
}
