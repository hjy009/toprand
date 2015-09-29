package com.newhc.admin.action.user;


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
import com.newhc.admin.action.user.view.ModelEnterprisesView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelEnterprises;
import com.newhc.admin.exception.ServiceException;
/**
 * 
 * @author liangzhongbao
 *
 * 2012-12-5
 */
public class ModelEnterprisesAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelLinkAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer pageMaxSize = 10;
	private Integer pageNumber = 1;
	private ModelEnterprises modelEnterprises = new ModelEnterprises();
	private Integer id;
	private String year;
	private String content;
	private Integer status;
	private Integer type;
	private String typeName;
	private Integer columnsType;
	
	
 
	public String processsModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		Pagination p = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesPage(columnsType,status, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if (p != null && p.getTotalCount() > 0) {
			for (Iterator i = p.getList().iterator(); i.hasNext();) {
				Map map = (Map) i.next();
				ModelEnterprisesView lv = new ModelEnterprisesView();
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
	public String processAuditModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelEnterprises mtb = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(id);
		mtb.setStatus(new Integer(1));
		DaoFactory.getModelEnterprisesDao().updateModelEnterprises(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelEnterprises mtb = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(id);
		mtb.setStatus(new Integer(0));
		DaoFactory.getModelEnterprisesDao().updateModelEnterprises(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelEnterprisesAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelEnterprises mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(1));
				DaoFactory.getModelEnterprisesDao().updateModelEnterprises(mtb);
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
	public String processReAuditAllModelEnterprisesAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelEnterprises mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(0));
				DaoFactory.getModelEnterprisesDao().updateModelEnterprises(mtb);
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
	public String processDeleteModelEnterprisesAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelEnterprises mtb = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(id);
		if (mtb == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelEnterprisesDao().deleteModelEnterprises(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	/**
	 * 批量删除
	 * 
	 * @return
	 */
	public String processDeleteAllModelEnterprisesAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelEnterprises mtb = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				mtb = DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelEnterprisesDao().deleteModelEnterprises(mtb);
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
	
	public String processPrepareAddModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		super.setRequestAttribute("typeList",typeList);
		return SUCCESS;
	}
	

	
	public String processAddModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);

		modelEnterprises.setCreateTime(new Date());
		modelEnterprises.setCreator(super.getOnlineUser().getName());
		modelEnterprises.setStatus(new Integer(0));
		DaoFactory.getModelEnterprisesDao().addModelEnterprises(modelEnterprises);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	
	/**
	 * 准备修改
	 * @return
	 */
	
	public String processPrepareUpadteModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ENTERPRISES_TYPE);
		super.setRequestAttribute("typeList",typeList);
		modelEnterprises=DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(id);
		return SUCCESS;
	}
	
	
	public String processUpadteModelEnterprisesAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id!=null){
			ModelEnterprises  mtb= DaoFactory.getModelEnterprisesDao().queryModelEnterprisesById(id);
			mtb.setType(modelEnterprises.getType());
			mtb.setRemarks(modelEnterprises.getRemarks());
			mtb.setContent(modelEnterprises.getContent());
			mtb.setUpdateTime(new Date());
			mtb.setUpdator(super.getOnlineUser().getName());
			mtb.setName(modelEnterprises.getName());
			DaoFactory.getModelEnterprisesDao().updateModelEnterprises(mtb);
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

	public ModelEnterprises getModelEnterprises() {
		return modelEnterprises;
	}

	public void setModelEnterprises(ModelEnterprises modelEnterprises) {
		this.modelEnterprises = modelEnterprises;
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
