package com.newhc.admin.action.user.en;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import com.newhc.admin.action.user.view.en.ModelAdvertiseEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelAdvertise;
import com.newhc.admin.entity.en.ModelAdvertiseEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.NewStringHelper;



public class ModelAdvertiseEnAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(ModelAdvertiseEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String name;
	private Integer type = new Integer(1);// 1:招聘信息 2:招工信息
	private Integer status;
	private Integer id;
	private String timeFormat;
//	private String startTime;
//	private String endTime;
	private String pubTime;
	private ModelAdvertiseEn modelAdvertiseEn = new ModelAdvertiseEn();
	
	public String processModelAdvertisePageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		Pagination p = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnPage(name, type, status, pageMaxSize, pageNumber);
		List l = new  ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelAdvertiseEnView ai = new ModelAdvertiseEnView();
				ai.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				ai.setName(NewStringHelper.truncate(((String)map.get("name")).replaceAll("<[^>]*>","").trim(),20,"..."));
				ai.setWorkingPlace(NewStringHelper.truncate(((String)map.get("working_place")).replaceAll("<[^>]*>","").trim(),20,"..."));
				ai.setCompany(NewStringHelper.truncate(((String)map.get("company")).replaceAll("<[^>]*>","").trim(),20,"..."));
				ai.setLinkman((String)map.get("linkman"));
				ai.setType(NumbericHelper.getIntValue((Integer)map.get("type"),-1));
				ai.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"), -1));
				ai.setCreator((String)map.get("creator"));
				ai.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")), DATE_FORMAT));
				l.add(ai);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
//		super.setRequestAttribute("typeList",typeList);
		super.setRequestAttribute("statusList", statusList);
		return SUCCESS;
	}
	/**
	 * 审核数据
	 * @return
	 * */
	
	public String processAuditModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelAdvertiseEn ma = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
			ma.setStatus(new Integer(1));
			DaoFactory.getModelAdvertiseEnDao().updateModelAdvertiseEn(ma);
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 * */
	public String processReAuditModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelAdvertiseEn ma = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
			ma.setStatus(new Integer(0));
			DaoFactory.getModelAdvertiseEnDao().updateModelAdvertiseEn(ma);
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	private String ShenHeId;
	
	/**
	 * 批量审核
	 * @return
	 */
	public String 	processUpdateAllModelAdvertiseEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAdvertiseEn hs=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				hs=DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(1));
				DaoFactory.getModelAdvertiseEnDao().updateModelAdvertiseEn(hs);
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
	public String 	processReUpdateAllModelAdvertiseEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAdvertiseEn hs=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				hs=DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(0));
				DaoFactory.getModelAdvertiseEnDao().updateModelAdvertiseEn(hs);
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
	public String 	processDeleteAllModelAdvertiseEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAdvertiseEn hs=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				hs=DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelAdvertiseEnDao().deleteModelAdvertiseEn(hs);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	/**
	 * 查看信息
	 * @return
	 */
	public String processQueryModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		modelAdvertiseEn  = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
		modelAdvertiseEn.setDescription(modelAdvertiseEn.getDescription().replaceAll("<[^>]*>","").trim());
		modelAdvertiseEn.setRequires(modelAdvertiseEn.getRequires().replaceAll("<[^>]*>","").trim());
//		startTime = DateHelper.toString(modelAdvertise.getStartTime(), DATE_FORMAT_DAY);
//		endTime = DateHelper.toString(modelAdvertise.getEndTime(), DATE_FORMAT_DAY);
		pubTime = DateHelper.toString(modelAdvertiseEn.getPubTime(), DATE_FORMAT_DAY);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		timeFormat = sdf.format(modelAdvertiseEn.getCreateTime());
//		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		List degreeTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.MODEL_ADVERTISE_DEGREE_TYPE);
		super.setRequestAttribute("degreeTypeList",degreeTypeList);
//		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		List degreeTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.MODEL_ADVERTISE_DEGREE_TYPE);
//		modelAdvertise.setStartTime(DateHelper.toDate(startTime,DATE_FORMAT_DAY));
//		modelAdvertise.setEndTime(DateHelper.toDate(endTime,DATE_FORMAT_DAY));
		modelAdvertiseEn.setPubTime(DateHelper.toDate(pubTime,DATE_FORMAT_DAY));
		modelAdvertiseEn.setType(new Integer(1));
		modelAdvertiseEn.setStatus(new Integer(0));
		modelAdvertiseEn.setCreator(super.getOnlineUser().getName());
		modelAdvertiseEn.setCreateTime(new Date());
		DaoFactory.getModelAdvertiseEnDao().addModelAdvertiseEn(modelAdvertiseEn);
		super.setRequestAttribute("degreeTypeList",degreeTypeList);
//		super.setRequestAttribute("typeList",typeList);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		List degreeTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.MODEL_ADVERTISE_DEGREE_TYPE);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelAdvertiseEn = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
//		startTime = DateHelper.toString(modelAdvertise.getStartTime(), DATE_FORMAT_DAY);
//		endTime = DateHelper.toString(modelAdvertise.getEndTime(), DATE_FORMAT_DAY);
		pubTime = DateHelper.toString(modelAdvertiseEn.getPubTime(), DATE_FORMAT_DAY);
		super.setRequestAttribute("degreeTypeList",degreeTypeList);
//		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
//		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADVERTISE_INFO_TYPE);
		List degreeTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.MODEL_ADVERTISE_DEGREE_TYPE);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelAdvertiseEn ai = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
		ai.setUpdateTime(new Date());
		ai.setUpdator(super.getOnlineUser().getName());
		ai.setName(modelAdvertiseEn.getName());
		ai.setCompany(modelAdvertiseEn.getCompany());
		ai.setAdPerson(modelAdvertiseEn.getAdPerson());
		ai.setDegree(modelAdvertiseEn.getDegree());
//		ai.setStartTime(DateHelper.toDate(startTime, DATE_FORMAT_DAY));
//		ai.setEndTime(DateHelper.toDate(endTime, DATE_FORMAT_DAY));
		ai.setPubTime(DateHelper.toDate(pubTime, DATE_FORMAT_DAY));
		ai.setDescription(modelAdvertiseEn.getDescription());
		ai.setRequires(modelAdvertiseEn.getRequires());
		ai.setLinkman(modelAdvertiseEn.getLinkman());
		ai.setTelephone(modelAdvertiseEn.getTelephone());
		ai.setEmail(modelAdvertiseEn.getEmail());
		ai.setWorkingPlace(modelAdvertiseEn.getWorkingPlace());
		DaoFactory.getModelAdvertiseEnDao().updateModelAdvertiseEn(ai);
		super.setRequestAttribute("degreeTypeList",degreeTypeList);
//		super.setRequestAttribute("typeList",typeList);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelAdvertiseEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		try {
			modelAdvertiseEn = DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(id);
			
			if(modelAdvertiseEn==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getModelAdvertiseEnDao().deleteModelAdvertiseEn(modelAdvertiseEn);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		} catch (SecurityException se) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
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
	public int getPageMaxSize() {
		return pageMaxSize;
	}
	public void setPageMaxSize(int pageMaxSize) {
		this.pageMaxSize = pageMaxSize;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTimeFormat() {
		return timeFormat;
	}
	public void setTimeFormat(String timeFormat) {
		this.timeFormat = timeFormat;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
//	public String getEndTime() {
//		return endTime;
//	}
//	public void setEndTime(String endTime) {
//		this.endTime = endTime;
//	}
//	public String getStartTime() {
//		return startTime;
//	}
//	public void setStartTime(String startTime) {
//		this.startTime = startTime;
//	}
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	 
	public ModelAdvertiseEn getModelAdvertiseEn() {
		return modelAdvertiseEn;
	}
	public void setModelAdvertiseEn(ModelAdvertiseEn modelAdvertiseEn) {
		this.modelAdvertiseEn = modelAdvertiseEn;
	}
	public String getPubTime() {
		return pubTime;
	}
	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}
	
	

}
