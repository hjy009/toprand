package com.newhc.admin.action.user;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.ModelNewsCenterView;
import com.newhc.admin.action.user.view.ModelNewsView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelNews;
import com.newhc.admin.entity.ModelNewsCenter;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-4-26
 */
public class ModelNewsCenterAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsCenterAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	
	private String name;
	private Integer id;
	private Integer status;
	private Integer sequence;

	private ModelNewsCenter modelNewsCenter = new ModelNewsCenter();
	
	public String processModelNewsCenterPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
	
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelNewsCenterDao().queryNewCenterPage(name,status,pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelNewsCenterView mnv = new ModelNewsCenterView();
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
	public String processAuditModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsCenter mnc = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(id);
		System.out.println(mnc.getStatus());
		DaoFactory.getModelNewsCenterDao().updateNewCenter(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsCenter mnc = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(id);
		mnc.setStatus(new Integer(0));
		DaoFactory.getModelNewsCenterDao().updateNewCenter(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelNewsCenterAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenter mnc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc=DaoFactory.getModelNewsCenterDao().queryNewsCenterById(Integer.valueOf(shenhe[i]));
				mnc.setStatus(new Integer(1));
				DaoFactory.getModelNewsCenterDao().updateNewCenter(mnc);
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
	public String processReAuditAllModelNewsCenterAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenter mnc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc=DaoFactory.getModelNewsCenterDao().queryNewsCenterById(Integer.valueOf(shenhe[i]));
				mnc.setStatus(new Integer(0));
				DaoFactory.getModelNewsCenterDao().updateNewCenter(mnc);
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
	
	
	public String processPrepareAddModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	
	/**
	 * 新增数据
	 * @return
	 */
	public String processAddModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelNewsCenter.setCreator(super.getOnlineUser().getName());
		modelNewsCenter.setCreateTime(new Date());
		modelNewsCenter.setStatus(new Integer(0));
		DaoFactory.getModelNewsCenterDao().addNewCenter(modelNewsCenter);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelNewsCenter = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(id);
		return SUCCESS;
	}
	
	/**
	 * 修改数据
	 * @return
	 */
	public String processUpdateModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsCenter mnc = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(id);
		mnc.setName(modelNewsCenter.getName());
		mnc.setSequence(modelNewsCenter.getSequence());
		mnc.setUpdateTime(new Date());
		mnc.setUpdator(super.getOnlineUser().getName());
		DaoFactory.getModelNewsCenterDao().updateNewCenter(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	

	
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelNewsCenterAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsCenter mnc = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(id);
		if(mnc == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelNewsCenterDao().deleteNewCenter(mnc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelNewsCenterAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsCenter mnc = null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mnc = DaoFactory.getModelNewsCenterDao().queryNewsCenterById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelNewsCenterDao().deleteNewCenter(mnc);
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


	public ModelNewsCenter getModelNewsCenter() {
		return modelNewsCenter;
	}
	public void setModelNewsCenter(ModelNewsCenter modelNewsCenter) {
		this.modelNewsCenter = modelNewsCenter;
	}

	
}
