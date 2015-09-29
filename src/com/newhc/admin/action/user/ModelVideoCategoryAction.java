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
import com.newhc.admin.action.user.view.ModelVideoCategoryView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelVideoCategory;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.ErrorMessageHelper;
import com.newhc.admin.helper.NewStringHelper;

public class ModelVideoCategoryAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelVideoCategoryAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private Integer id;
	private String name;
	private Integer type;
	private Integer status;
	private ModelVideoCategory modelVideoCategory = new ModelVideoCategory();
	
	public String processModelVideoCategoryPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelVideoCategoryDao().queryModelVideoCategoryPage(name, type, status, pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelVideoCategoryView mnv = new ModelVideoCategoryView();
				mnv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mnv.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));
				mnv.setType((Integer)NumbericHelper.getIntValue(map.get("type"),0));
				mnv.setVolumnCount((Integer)NumbericHelper.getIntValue(map.get("volumn_count"),0));
				String content = (String)map.get("remark");
				if(content!=null&&content.length()>0){
				content = content.replaceAll("<[^>]*>","").trim();
				mnv.setRemark(NewStringHelper.truncate(content,20,"..."));
				}
				mnv.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mnv.setCreator((String)map.get("creator"));
				mnv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mnv);
			}
		}		
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("status",statusList);
		return SUCCESS;
	}
	/**
	 * 审核数据
	 * @return
	 * */
	
	public String processAuditModelVideoCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelVideoCategory ma = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(id);
			ma.setStatus(new Integer(1));
			DaoFactory.getModelVideoCategoryDao().updateModelVideoCategory(ma);
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
	public String processReAuditModelVideoCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelVideoCategory ma = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(id);
			ma.setStatus(new Integer(0));
			DaoFactory.getModelVideoCategoryDao().updateModelVideoCategory(ma);
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
	public String processPrepareAddModelVideoCategoryAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelVideoCategoryAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelVideoCategory.setStatus(new Integer(0));
		modelVideoCategory.setCreator(super.getOnlineUser().getName());
		modelVideoCategory.setCreateTime(new Date());
		DaoFactory.getModelVideoCategoryDao().addModelVideoCategory(modelVideoCategory);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelVideoCategoryAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelVideoCategory mvc = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(id);
			if(mvc == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			Integer count = DaoFactory.getModelVideoCategoryDao().queryModelVideoByCategoryId(id);
			if(count==0){
				DaoFactory.getModelVideoCategoryDao().deleteModelVideoCategory(mvc);
				super.setActionResponse(RESPONSE_SUCCESS);
			}else{
				throw new ServiceException(ErrorCode.DELETE_PARENT_VIDEO_CATEGORY_FALSE);
			}
		}catch(ServiceException se){
			logger.error("ERROR:ServiceException-->"+se.getMessage());
			super.setActionResponse(RESPONSE_FAILURE, ErrorMessageHelper.getMessage(se.getMessage()));
		}
		return execJSONReponseAction();
	}
	
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelVideoCategoryAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelVideoCategory = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelVideoCategoryAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		ModelVideoCategory mvc = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(id);
		mvc.setName(modelVideoCategory.getName());
		mvc.setRemark(modelVideoCategory.getRemark());
		mvc.setVolumnCount(modelVideoCategory.getVolumnCount());
		mvc.setUpdateTime(new Date());
		mvc.setUpdator(super.getOnlineUser().getName());
		DaoFactory.getModelVideoCategoryDao().updateModelVideoCategory(mvc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	private String ShenHeId;
	/**
	 * 批量审核
	 * 
	 * @return
	 */
	public String processUpdateAllModelVideoCategoryAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideoCategory hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(1));
				DaoFactory.getModelVideoCategoryDao().updateModelVideoCategory(hs);
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
	 * @return
	 */
	public String processReUpdateAllModelVideoCategoryAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideoCategory hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(0));
				DaoFactory.getModelVideoCategoryDao().updateModelVideoCategory(hs);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 * 
	 * @return
	 */
	public String processDeleteAllModelVideoCategoryAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideoCategory hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoCategoryDao().loadModelVideoCategory(
						Integer.valueOf(shenhe[i]));
				DaoFactory.getModelVideoCategoryDao().deleteModelVideoCategory(hs);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	public ModelVideoCategory getModelVideoCategory() {
		return modelVideoCategory;
	}
	public void setModelVideoCategory(ModelVideoCategory modelVideoCategory) {
		this.modelVideoCategory = modelVideoCategory;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
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
	

}
