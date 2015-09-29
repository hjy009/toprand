package com.newhc.admin.action.user;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.ModelFactoryEnvironmentView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelFactoryEnvironment;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

public class ModelFactoryEnvironmentAction extends JSONPrintAction {
	
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer id;
	private String name;
	private Integer status;
	
	private String ShenHeId;
	private Integer pageMaxSize = 10;
	private Integer pageNumber = 1;
	
	private File fileMaxImage;
	private String fileMaxImageFileName;
	private File fileMinImage;
	private String fileMinImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	private String uploadMaxImagePath = realPath +"admin/uploadImage/Factory/Max/";
	private String maxImagePath = "admin/uploadImage/Factory/Max/";
	private String uploadMinImagePath = realPath +"admin/uploadImage/Factory/Min/";
	private String minImagePath = "admin/uploadImage/Factory/Min/";
	
	private ModelFactoryEnvironment modelFactoryEnvironment = new ModelFactoryEnvironment();
	
	public String processModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentPage(name,status,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelFactoryEnvironmentView mfev = new ModelFactoryEnvironmentView();
				mfev.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mfev.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));
				String maxImage = (String) map.get("max_image");
				if (maxImage != null && maxImage.length() > 0) {
					int k = maxImage.lastIndexOf("/");
					mfev.setMaxImage(maxImage.substring(k + 1, maxImage.length()));
				}
				String minImage = (String) map.get("min_image");
				if (minImage != null && minImage.length() > 0) {
					int k = minImage.lastIndexOf("/");
					mfev.setMinImage(minImage.substring(k + 1, minImage.length()));
				}
//				mfev.setMaxImage((String)map.get("max_image"));
//				mfev.setMinImage((String)map.get("min_image"));
				mfev.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mfev.setSequence(NumbericHelper.getIntValue((Integer)map.get("sequence"),0));
				mfev.setCreator((String)map.get("creator"));
				mfev.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mfev);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelNewsStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 审核
	 */
	public String processAuditModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironment mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(id);
		mfe.setStatus(new Integer(1));
		DaoFactory.getModelFactoryEnvironmentDao().updateModelFactoryEnvironment(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核
	 */
	public String processReAuditModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironment mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(id);
		mfe.setStatus(new Integer(0));
		DaoFactory.getModelFactoryEnvironmentDao().updateModelFactoryEnvironment(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 */
	public String processAuditAllModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironment mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i = 0;i<shenhe.length;i++){
		    	mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(Integer.valueOf(shenhe[i]));
		    	mfe.setStatus(new Integer(1));
		    	DaoFactory.getModelFactoryEnvironmentDao().updateModelFactoryEnvironment(mfe);
		    }
		    super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException se) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
	    return execJSONReponseAction();
	}
	/**
	 * 批量重审核
	 */
	public String processReAuditAllModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironment mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i=0;i<shenhe.length;i++){
				mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(Integer.valueOf(shenhe[i]));
				mfe.setStatus(new Integer(0));
				DaoFactory.getModelFactoryEnvironmentDao().updateModelFactoryEnvironment(mfe);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		    super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException se) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
	    return execJSONReponseAction();
	}
	/**
	 * 删除
	 */
	public String processDeleteModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironment mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(id);
		DaoFactory.getModelFactoryEnvironmentDao().deleteModelFactoryEnvironment(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 */
	public String processDeleteAllModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironment mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i = 0;i<shenhe.length;i++){
		    	mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(Integer.valueOf(shenhe[i]));
		    	DaoFactory.getModelFactoryEnvironmentDao().deleteModelFactoryEnvironment(mfe);
		    }
		    super.setActionResponse(RESPONSE_SUCCESS);
		}catch (SecurityException se) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
	    return execJSONReponseAction();
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		//判断图片类型
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileMaxImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileMaxImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		
		//判断图片类型
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileMinImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileMinImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		String maxFileImageFileName ="";
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			maxFileImageFileName = ImageHelperUtil.getNameFromTime(fileMaxImageFileName);
		}
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileMaxImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadMaxImagePath, maxFileImageFileName, content);
		}
		if(fileMaxImageFileName!=null&&fileMaxImageFileName.length()>0){
			modelFactoryEnvironment.setMaxImage(maxImagePath+maxFileImageFileName);
		}
		
		
		String minFileImageFileName ="";
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			minFileImageFileName = ImageHelperUtil.getNameFromTime(fileMinImageFileName);
		}
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileMinImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadMinImagePath, minFileImageFileName, content);
		}
		if(minFileImageFileName!=null&&minFileImageFileName.length()>0){
			modelFactoryEnvironment.setMinImage(minImagePath+minFileImageFileName);
		}
		modelFactoryEnvironment.setStatus(new Integer(0));
		modelFactoryEnvironment.setCreator(super.getOnlineUser().getName());
		modelFactoryEnvironment.setCreateTime(new Date());
		DaoFactory.getModelFactoryEnvironmentDao().addModelFactoryEnvironment(modelFactoryEnvironment);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_FAILURE);
		modelFactoryEnvironment = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelFactoryEnvironmentAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_FAILURE);
		ModelFactoryEnvironment mfe = DaoFactory.getModelFactoryEnvironmentDao().queryModelFactoryEnvironmentById(id);
		//判断图片类型
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileMaxImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileMaxImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		
		//判断图片类型
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileMinImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileMinImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		String maxFileImageFileName ="";
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			maxFileImageFileName = ImageHelperUtil.getNameFromTime(fileMaxImageFileName);
		}
		if(fileMaxImage!=null&&fileMaxImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileMaxImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadMaxImagePath, maxFileImageFileName, content);
		}
		if(fileMaxImageFileName!=null&&fileMaxImageFileName.length()>0){
			mfe.setMaxImage(maxImagePath+maxFileImageFileName);
		}
		
		
		String minFileImageFileName ="";
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			minFileImageFileName = ImageHelperUtil.getNameFromTime(fileMinImageFileName);
		}
		if(fileMinImage!=null&&fileMinImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileMinImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadMinImagePath, minFileImageFileName, content);
		}
		if(minFileImageFileName!=null&&minFileImageFileName.length()>0){
			mfe.setMinImage(minImagePath+minFileImageFileName);
		}
		mfe.setName(modelFactoryEnvironment.getName());
		mfe.setSequence(modelFactoryEnvironment.getSequence());
		mfe.setCreator(super.getOnlineUser().getName());
		mfe.setCreateTime(new Date());
		DaoFactory.getModelFactoryEnvironmentDao().updateModelFactoryEnvironment(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 预览
	 * @return
	 */
//	public String processPreviewAction(){
//		if(previewType.intValue()==1){
//			return "imageSuccess";
//		}else{
//			return "videoSuccess";
//		}
//	}
	public ModelFactoryEnvironment getModelFactoryEnvironment() {
		return modelFactoryEnvironment;
	}
	
	public void setModelFactoryEnvironment(
			ModelFactoryEnvironment modelFactoryEnvironment) {
		this.modelFactoryEnvironment = modelFactoryEnvironment;
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
	public File getFileMaxImage() {
		return fileMaxImage;
	}
	public void setFileMaxImage(File fileMaxImage) {
		this.fileMaxImage = fileMaxImage;
	}
	public String getFileMaxImageFileName() {
		return fileMaxImageFileName;
	}
	public void setFileMaxImageFileName(String fileMaxImageFileName) {
		this.fileMaxImageFileName = fileMaxImageFileName;
	}
	public File getFileMinImage() {
		return fileMinImage;
	}
	public void setFileMinImage(File fileMinImage) {
		this.fileMinImage = fileMinImage;
	}
	public String getFileMinImageFileName() {
		return fileMinImageFileName;
	}
	public void setFileMinImageFileName(String fileMinImageFileName) {
		this.fileMinImageFileName = fileMinImageFileName;
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
