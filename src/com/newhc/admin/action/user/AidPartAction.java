package com.newhc.admin.action.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.Pagination;


import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.AidPartView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AidPart;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.NewStringHelper;

public class AidPartAction extends JSONPrintAction{
	private String name;
	private Integer status;
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String DATE_FORMAT="yyyy-MM-dd HH:mm:ss";
	private AidPart aidpart;
	private Integer id;
	private String ShenHeId;
	private Integer sequence = 1;
	public String processPageAction(){
		Integer userId=super.getOnlineUserId();	
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList=DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p=DaoFactory.getAidPartDao().queryAidPartPage(name, status, pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getPageCount()>0){
			for(Iterator i=p.getList().iterator();i.hasNext();){
				AidPartView apv=new AidPartView();
				Map map=(Map)i.next();
				apv.setId(NumbericHelper.getIntValue(map.get("id"), -1));
				apv.setName((String)map.get("name"));
				apv.setStatus(NumbericHelper.getIntValue(map.get("status"), -1));
				apv.setSequence(NumbericHelper.getIntValue(map.get("sequence"), 0));
				String content = (String)map.get("content");
				content = content.replaceAll("<[^>]*>","").trim();
				apv.setContent(NewStringHelper.truncate(content, 20, "...."));
				apv.setCreator((String)map.get("creator"));
				apv.setUpdator((String)map.get("updator"));
				apv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")), DATE_FORMAT));
				apv.setUpdateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("update_time")), DATE_FORMAT));
				l.add(apv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("status",statusList);
		return SUCCESS;
	}
	/**
	 * 准备增加
	 */
	public String processPrepareAddAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		return SUCCESS;
	}
	/**
	 * 增加
	 */
	public String processAddAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(StringHelper.isEmpty(aidpart.getName())){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		aidpart.setStatus(new Integer(0));
		aidpart.setCreator(super.getOnlineUser().getName());
		aidpart.setCreateTime(new Date());
		DaoFactory.getAidPartDao().addAidPart(aidpart);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 准备修改
	 */
	public String processPrepareUpdateAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		}
		aidpart=DaoFactory.getAidPartDao().queryAidPartById(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * 
	 */

	public String processUpdateAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		AidPart ap=DaoFactory.getAidPartDao().queryAidPartById(id);
		ap.setName(aidpart.getName());
		ap.setContent(aidpart.getContent());
		ap.setSequence(aidpart.getSequence());
		ap.setUpdator(super.getOnlineUser().getName());
		ap.setUpdateTime(new Date());
		DaoFactory.getAidPartDao().updatgeAidPart(ap);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 删除
	 */
	public String processDeleteAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			aidpart=DaoFactory.getAidPartDao().queryAidPartById(id);
			if(aidpart==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getAidPartDao().deleteAidPart(aidpart);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		} catch (SecurityException se) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 * 
	 */
	public String processDeleteAllAction(){
		String sheheid=ShenHeId.substring(0,ShenHeId.length()-1);
		String[] shehe=sheheid.split(",");
		try{
			if(shehe==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shehe.length;i++){
				aidpart=DaoFactory.getAidPartDao().queryAidPartById(Integer.valueOf(shehe[i]));
				DaoFactory.getAidPartDao().deleteAidPart(aidpart);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	/**
	 * 审核
	 * 
	 */
	public String processAuditAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		try{
			if(id==null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			AidPart ap=DaoFactory.getAidPartDao().queryAidPartById(id);
			ap.setStatus(new Integer(1));
			DaoFactory.getAidPartDao().updatgeAidPart(ap);
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 重审核
	 * 
	 */
	public String processReAuditAction(){
		Integer userId=super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		try{
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			AidPart ap=DaoFactory.getAidPartDao().queryAidPartById(id);
			ap.setStatus(new Integer(0));
			DaoFactory.getAidPartDao().updatgeAidPart(ap);
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 * 
	 */
	public String processUpdateAllAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    AidPart ap=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				ap=DaoFactory.getAidPartDao().queryAidPartById(Integer.valueOf(shenhe[i]));
				ap.setStatus(new Integer(1));
				DaoFactory.getAidPartDao().updatgeAidPart(ap);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量重审核
	 * 
	 */
	public String processUpdateReAllAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    AidPart ap=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				ap=DaoFactory.getAidPartDao().queryAidPartById(Integer.valueOf(shenhe[i]));
				ap.setStatus(new Integer(0));
				DaoFactory.getAidPartDao().updatgeAidPart(ap);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	public String getDATE_FORMAT() {
		return DATE_FORMAT;
	}
	public void setDATE_FORMAT(String date_format) {
		DATE_FORMAT = date_format;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public AidPart getAidpart() {
		return aidpart;
	}
	public void setAidpart(AidPart aidpart) {
		this.aidpart = aidpart;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageMaxSize() {
		return pageMaxSize;
	}
	public void setPageMaxSize(int pageMaxSize) {
		this.pageMaxSize = pageMaxSize;
	}
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	
}
