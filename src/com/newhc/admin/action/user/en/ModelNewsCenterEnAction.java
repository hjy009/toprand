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
import com.newhc.admin.action.user.view.en.ModelNewsCenterEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelNewsCenter;
import com.newhc.admin.entity.en.ModelNewsCenterEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.NewStringHelper;

/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-4-26
 */
public class ModelNewsCenterEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsCenterEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	
	private String name;
	private Integer id;
	private Integer status;
	private Integer sequence;

	private ModelNewsCenterEn modelNewsCenterEn = new ModelNewsCenterEn();
	
	public String processModelNewsCenterPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
	
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelNewsCenterEnDao().queryNewCenterEnPage(name,status,pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelNewsCenterEnView mnv = new ModelNewsCenterEnView();
				mnv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mnv.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));
				mnv.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mnv.setSequence(NumbericHelper.getIntValue((Integer)map.get("sequence"),0));
				mnv.setCreator((String)map.get("creator"));
				mnv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mnv);
			}
		}		
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelNewsStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsCenterEn mnc = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(id);
		System.out.println(mnc.getStatus());
		DaoFactory.getModelNewsCenterEnDao().updateNewCenterEn(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsCenterEn mnc = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(id);
		mnc.setStatus(new Integer(0));
		DaoFactory.getModelNewsCenterEnDao().updateNewCenterEn(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelNewsCenterEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenterEn mnc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc=DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(Integer.valueOf(shenhe[i]));
				mnc.setStatus(new Integer(1));
				DaoFactory.getModelNewsCenterEnDao().updateNewCenterEn(mnc);
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
	public String processReAuditAllModelNewsCenterEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenterEn mnc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc=DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(Integer.valueOf(shenhe[i]));
				mnc.setStatus(new Integer(0));
				DaoFactory.getModelNewsCenterEnDao().updateNewCenterEn(mnc);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	
	
	
	/**
	 * 准备新增
	 * @return
	 */
	
	
	public String processPrepareAddModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	
	/**
	 * 新增数据
	 * @return
	 */
	public String processAddModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelNewsCenterEn.setCreator(super.getOnlineUser().getName());
		modelNewsCenterEn.setCreateTime(new Date());
		modelNewsCenterEn.setStatus(new Integer(0));
		DaoFactory.getModelNewsCenterEnDao().addNewCenterEn(modelNewsCenterEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelNewsCenterEn = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(id);
		return SUCCESS;
	}
	
	/**
	 * 修改数据
	 * @return
	 */
	public String processUpdateModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsCenterEn mnc = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(id);
		mnc.setName(modelNewsCenterEn.getName());
		mnc.setSequence(modelNewsCenterEn.getSequence());
		mnc.setUpdateTime(new Date());
		mnc.setUpdator(super.getOnlineUser().getName());
		DaoFactory.getModelNewsCenterEnDao().updateNewCenterEn(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	

	
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelNewsCenterEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsCenterEn mnc = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(id);
		if(mnc == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelNewsCenterEnDao().deleteNewCenterEn(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelNewsCenterEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenterEn mnc = null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc = DaoFactory.getModelNewsCenterEnDao().queryNewsCenterEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelNewsCenterEnDao().deleteNewCenterEn(mnc);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}


	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	public ModelNewsCenterEn getModelNewsCenterEn() {
		return modelNewsCenterEn;
	}
	public void setModelNewsCenterEn(ModelNewsCenterEn modelNewsCenterEn) {
		this.modelNewsCenterEn = modelNewsCenterEn;
	}

 
	
}
