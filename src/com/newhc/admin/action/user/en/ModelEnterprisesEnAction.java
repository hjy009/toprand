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
import com.newhc.admin.action.user.view.en.ModelEnterprisesEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelEnterprises;
import com.newhc.admin.entity.en.ModelEnterprisesEn;
import com.newhc.admin.exception.ServiceException;
/**
 * 
 * @author liangzhongbao
 *
 * 2012-12-5
 */
public class ModelEnterprisesEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelLinkEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer pageMaxSize = 10;
	private Integer pageNumber = 1;
	private ModelEnterprisesEn modelEnterprisesEn = new ModelEnterprisesEn();
	private Integer id;
	private String year;
	private String content;
	private Integer status;
	private Integer type;
	private String typeName;
	private Integer columnsType;
	
	
 
	public String processsModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		Pagination p = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnPage(columnsType,status, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if (p != null && p.getTotalCount() > 0) {
			for (Iterator i = p.getList().iterator(); i.hasNext();) {
				Map map = (Map) i.next();
				ModelEnterprisesEnView lv = new ModelEnterprisesEnView();
				lv.setId((Integer)NumbericHelper.getIntValue(map.get("id"), 0));
				String contents =(String)map.get("content");
				lv.setContent(contents);
				lv.setName((String)map.get("name"));
				lv.setRemarks((String)map.get("remarks"));
				lv.setStatus((Integer)NumbericHelper.getIntValue(map.get("status"), 0));
				lv.setType((Integer)NumbericHelper.getIntValue(map.get("type"), 0));
				lv.setCreator((String) map.get("creator"));
				lv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(lv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize, pageNumber, l));
		super.setRequestAttribute("status", statusList);
		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}

	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelEnterprisesEn mtb = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(id);
		mtb.setStatus(new Integer(1));
		DaoFactory.getModelEnterprisesEnDao().updateModelEnterprisesEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelEnterprisesEn mtb = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(id);
		mtb.setStatus(new Integer(0));
		DaoFactory.getModelEnterprisesEnDao().updateModelEnterprisesEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelEnterprisesEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelEnterprisesEn mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(1));
				DaoFactory.getModelEnterprisesEnDao().updateModelEnterprisesEn(mtb);
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
	public String processReAuditAllModelEnterprisesEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelEnterprisesEn mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(0));
				DaoFactory.getModelEnterprisesEnDao().updateModelEnterprisesEn(mtb);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	/**
	 * 删除数据
	 * 
	 * @return
	 */
	public String processDeleteModelEnterprisesEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelEnterprisesEn mtb = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(id);
		if (mtb == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelEnterprisesEnDao().deleteModelEnterprisesEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	/**
	 * 批量删除
	 * 
	 * @return
	 */
	public String processDeleteAllModelEnterprisesEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelEnterprisesEn mtb = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				mtb = DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelEnterprisesEnDao().deleteModelEnterprisesEn(mtb);
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
	
	public String processPrepareAddModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}
	

	
	public String processAddModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);

		modelEnterprisesEn.setCreateTime(new Date());
		modelEnterprisesEn.setCreator(super.getOnlineUser().getName());
		modelEnterprisesEn.setStatus(new Integer(0));
		DaoFactory.getModelEnterprisesEnDao().addModelEnterprisesEn(modelEnterprisesEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	
	/**
	 * 准备修改
	 * @return
	 */
	
	public String processPrepareUpadteModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		super.setRequestAttribute("typeList",typeList);
		modelEnterprisesEn=DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(id);
		return SUCCESS;
	}
	
	
	public String processUpadteModelEnterprisesEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id!=null){
			ModelEnterprisesEn  mtb= DaoFactory.getModelEnterprisesEnDao().queryModelEnterprisesEnById(id);
			mtb.setType(modelEnterprisesEn.getType());
			mtb.setRemarks(modelEnterprisesEn.getRemarks());
			mtb.setContent(modelEnterprisesEn.getContent());
			mtb.setUpdateTime(new Date());
			mtb.setUpdator(super.getOnlineUser().getName());
			mtb.setName(modelEnterprisesEn.getName());
			DaoFactory.getModelEnterprisesEnDao().updateModelEnterprisesEn(mtb);
		}
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	 

	public ModelEnterprisesEn getModelEnterprisesEn() {
		return modelEnterprisesEn;
	}

	public void setModelEnterprisesEn(ModelEnterprisesEn modelEnterprisesEn) {
		this.modelEnterprisesEn = modelEnterprisesEn;
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}



	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getColumnsType() {
		return columnsType;
	}

	public void setColumnsType(Integer columnsType) {
		this.columnsType = columnsType;
	}
}
