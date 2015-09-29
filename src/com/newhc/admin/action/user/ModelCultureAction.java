package com.newhc.admin.action.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.search.SearchException;

import net.sf.json.JSONException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.ModelCultureView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelCulture;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.NewStringHelper;

public class ModelCultureAction extends JSONPrintAction {
	
	private String name;
	
	private Integer status;
	
	private Integer id;
	
	private Integer pageMaxSize =10;
	
	private Integer pageNumber = 1;
	
	private String ShenHeId;
	
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private ModelCulture modelCulture = new ModelCulture();
	
	public String processModelCulturePageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelCultureDao().queryModelCulturePage(name, status, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelCultureView miv = new ModelCultureView();
				miv.setId(NumbericHelper.getIntValue(map.get("id"), -1));
				miv.setName(NewStringHelper.truncate((String)map.get("name"), 10, "..."));
				String content = (String)map.get("content");
				miv.setContent(NewStringHelper.truncate(content.replaceAll("<[^>]*>","").trim() , 20, "..."));
				miv.setSequence(NumbericHelper.getIntValue(map.get("sequence"),-1));
				miv.setStatus(NumbericHelper.getIntValue(map.get("status"), -1));
				miv.setCreator((String)map.get("creator"));
				miv.setCreateTime(DateHelper.toString((Timestamp)map.get("create_time"), DATE_FORMAT));
				l.add(miv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("statusList", statusList);
		return SUCCESS;
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelCultureAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelCultureAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelCulture.setStatus(new Integer(0));
		modelCulture.setCreator(super.getOnlineUser().getName());
		modelCulture.setCreateTime(new Date());
		DaoFactory.getModelCultureDao().addModelCulture(modelCulture);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelCultureAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelCultureAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelCulture mi = DaoFactory.getModelCultureDao().queryModelCultureId(id);
		mi.setName(modelCulture.getName());
		mi.setEnglishName(modelCulture.getEnglishName());
		mi.setContent(modelCulture.getContent());
		mi.setSequence(modelCulture.getSequence());
		mi.setUpdator(super.getOnlineUser().getName());
		mi.setUpdateTime(new Date());
		DaoFactory.getModelCultureDao().updateModelCulture(mi);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelCultureAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(id);
			if(modelCulture==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			DaoFactory.getModelCultureDao().deleteModelCulture(modelCulture);
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 * @return
	 */
	public String procesdeleteAlltModelCultureAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);		
			String shenheId = ShenHeId.substring(0,ShenHeId.length()-1);
			String[] shenHe = shenheId.split(",");
			if(shenheId == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0 ; i<shenHe.length;i++){
				modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(Integer.valueOf(shenHe[i]));
				DaoFactory.getModelCultureDao().deleteModelCulture(modelCulture);		
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 审核
	 * @return
	 */
	public String processAuditModelCultureAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(id);
			modelCulture.setStatus(new Integer(1));
			DaoFactory.getModelCultureDao().updateModelCulture(modelCulture);
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 *重审核
	 * @return
	 */
	public String processReAuditModelCultureAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(id);
			modelCulture.setStatus(new Integer(0));
			DaoFactory.getModelCultureDao().updateModelCulture(modelCulture);
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 * @return
	 */
	public String procesUpdateAlltModelCultureAction(){		
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);		
			String shenheId = ShenHeId.substring(0,ShenHeId.length()-1);
			String[] shenHe = shenheId.split(",");
			if(shenheId == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0 ; i<shenHe.length;i++){
				modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(Integer.valueOf(shenHe[i]));
				modelCulture.setStatus(new Integer(1));
				DaoFactory.getModelCultureDao().updateModelCulture(modelCulture);		
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 批量重审核
	 * @return
	 */
	public String procesReUpdateAlltModelCultureAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);		
			String shenheId = ShenHeId.substring(0,ShenHeId.length()-1);
			String[] shenHe = shenheId.split(",");
			if(shenheId == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0 ; i<shenHe.length;i++){
				modelCulture = DaoFactory.getModelCultureDao().queryModelCultureId(Integer.valueOf(shenHe[i]));
				modelCulture.setStatus(new Integer(0));
				DaoFactory.getModelCultureDao().updateModelCulture(modelCulture);		
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException e) {
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
	
	public ModelCulture getModelCulture() {
		return modelCulture;
	}
	public void setModelCulture(ModelCulture modelCulture) {
		this.modelCulture = modelCulture;
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
