package com.newhc.admin.action.user.en;

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
import com.newhc.admin.action.user.view.en.ModelFactoryEnvironmentEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelFactoryEnvironment;
import com.newhc.admin.entity.en.ModelFactoryEnvironmentEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

public class ModelFactoryEnvironmentEnAction extends JSONPrintAction {
	
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
	
	private String uploadMaxImagePath = realPath +"admin/uploadImage/Factory/MaxEn/";
	private String maxImagePath = "admin/uploadImage/Factory/MaxEn/";
	private String uploadMinImagePath = realPath +"admin/uploadImage/Factory/MinEn/";
	private String minImagePath = "admin/uploadImage/Factory/MinEn/";
	
	private ModelFactoryEnvironmentEn modelFactoryEnvironmentEn = new ModelFactoryEnvironmentEn();
	
	public String processModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnPage(name,status,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelFactoryEnvironmentEnView mfev = new ModelFactoryEnvironmentEnView();
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
	public String processAuditModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironmentEn mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(id);
		mfe.setStatus(new Integer(1));
		DaoFactory.getModelFactoryEnvironmentEnDao().updateModelFactoryEnvironmentEn(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核
	 */
	public String processReAuditModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironmentEn mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(id);
		mfe.setStatus(new Integer(0));
		DaoFactory.getModelFactoryEnvironmentEnDao().updateModelFactoryEnvironmentEn(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 */
	public String processAuditAllModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironmentEn mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i = 0;i<shenhe.length;i++){
		    	mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(Integer.valueOf(shenhe[i]));
		    	mfe.setStatus(new Integer(1));
		    	DaoFactory.getModelFactoryEnvironmentEnDao().updateModelFactoryEnvironmentEn(mfe);
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
	public String processReAuditAllModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironmentEn mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i=0;i<shenhe.length;i++){
				mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(Integer.valueOf(shenhe[i]));
				mfe.setStatus(new Integer(0));
				DaoFactory.getModelFactoryEnvironmentEnDao().updateModelFactoryEnvironmentEn(mfe);
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
	public String processDeleteModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelFactoryEnvironmentEn mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(id);
		DaoFactory.getModelFactoryEnvironmentEnDao().deleteModelFactoryEnvironmentEn(mfe);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 */
	public String processDeleteAllModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelFactoryEnvironmentEn mfe = null ;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
		    for(int i = 0;i<shenhe.length;i++){
		    	mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(Integer.valueOf(shenhe[i]));
		    	DaoFactory.getModelFactoryEnvironmentEnDao().deleteModelFactoryEnvironmentEn(mfe);
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
	public String processPrepareAddModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelFactoryEnvironmentEnAction(){
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
			modelFactoryEnvironmentEn.setMaxImage(maxImagePath+maxFileImageFileName);
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
			modelFactoryEnvironmentEn.setMinImage(minImagePath+minFileImageFileName);
		}
		modelFactoryEnvironmentEn.setStatus(new Integer(0));
		modelFactoryEnvironmentEn.setCreator(super.getOnlineUser().getName());
		modelFactoryEnvironmentEn.setCreateTime(new Date());
		DaoFactory.getModelFactoryEnvironmentEnDao().addModelFactoryEnvironmentEn(modelFactoryEnvironmentEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_FAILURE);
		modelFactoryEnvironmentEn = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelFactoryEnvironmentEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_FAILURE);
		ModelFactoryEnvironmentEn mfe = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(id);
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
		mfe.setName(modelFactoryEnvironmentEn.getName());
		mfe.setSequence(modelFactoryEnvironmentEn.getSequence());
		mfe.setCreator(super.getOnlineUser().getName());
		mfe.setCreateTime(new Date());
		DaoFactory.getModelFactoryEnvironmentEnDao().updateModelFactoryEnvironmentEn(mfe);
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
	public ModelFactoryEnvironmentEn getModelFactoryEnvironmentEn() {
		return modelFactoryEnvironmentEn;
	}
	public void setModelFactoryEnvironmentEn(
			ModelFactoryEnvironmentEn modelFactoryEnvironmentEn) {
		this.modelFactoryEnvironmentEn = modelFactoryEnvironmentEn;
	}
	
}
