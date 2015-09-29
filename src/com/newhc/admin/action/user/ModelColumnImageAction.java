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

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.ModelColumnImageView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelColumnImage;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;



public class ModelColumnImageAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelColumnImageAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private String title;
	private Integer type;
	private Integer status;
	private Integer parentType;
	private String imagePath;
	private String path;
	
	public String processModelColumnImagePageAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.COLUMN_IMAGE_TYPE);
		List parentTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.PARENT_TYPE);
		Pagination p = DaoFactory.getModelColumnImageDao().queryModelColumnImagePage(title, status, type,parentType, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if (p != null && p.getTotalCount() > 0) {
			for (Iterator i = p.getList().iterator(); i.hasNext();) {
				Map map = (Map) i.next();
				ModelColumnImageView lv = new ModelColumnImageView();
				lv.setId((Integer)NumbericHelper.getIntValue(map.get("id"), 0));
				String content = (String) map.get("link");
				lv.setLink(NewStringHelper.truncate(content, 20, "..."));
				 
				String image = (String) map.get("path");
				if (image != null && image.length() > 0) {
					int k = image.lastIndexOf("/");
					lv.setPath(image.substring(k + 1, image.length()));
				}
				String flash = (String) map.get("flash");
				if (flash != null && flash.length() > 0) {
					int k = flash.lastIndexOf("/");
					lv.setFlash(flash.substring(k + 1, flash.length()));
				}
				lv.setTitle((String)map.get("title"));
				lv.setParentType((Integer)NumbericHelper.getIntValue(map.get("parent_type"), 0));
				lv.setStatus((Integer)NumbericHelper.getIntValue(map.get("status"), 0));
				lv.setType((Integer)NumbericHelper.getIntValue(map.get("type"), 0));
				lv.setCreator((String) map.get("creator"));
				lv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(lv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize, pageNumber, l));
		super.setRequestAttribute("modelColumnImageStatus",statusList);
		super.setRequestAttribute("modelColumnImageType",typeList);
		super.setRequestAttribute("modelColumnImageParentType",parentTypeList);
		return SUCCESS;
	}
	
	private Integer id;

	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelColumnImageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelColumnImage mci = DaoFactory.getModelColumnImageDao().queryModelColumnImageById(id);
		mci.setStatus(new Integer(1));
		DaoFactory.getModelColumnImageDao().updateModelColumnImage(mci);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelColumnImageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelColumnImage mci = DaoFactory.getModelColumnImageDao().queryModelColumnImageById(id);
		mci.setStatus(new Integer(0));
		DaoFactory.getModelColumnImageDao().updateModelColumnImage(mci);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelColumnImageAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelColumnImage mci=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mci=DaoFactory.getModelColumnImageDao().queryModelColumnImageById(Integer.valueOf(shenhe[i]));
				mci.setStatus(new Integer(1));
				DaoFactory.getModelColumnImageDao().updateModelColumnImage(mci);
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
	public String processReAuditAllModelColumnImageAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelColumnImage mci=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mci=DaoFactory.getModelColumnImageDao().queryModelColumnImageById(Integer.valueOf(shenhe[i]));
				mci.setStatus(new Integer(0));
				DaoFactory.getModelColumnImageDao().updateModelColumnImage(mci);
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
	public String processDeleteModelColumnImageAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelColumnImage mci = DaoFactory.getModelColumnImageDao().queryModelColumnImageById(id);
		if (mci == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		String flash = mci.getFlash();
		if(flash!=null&&flash.length()>0){
		String flashPath = realPath+flash;
		FileHelperUtil.deleteFile(flashPath);
		}
		String image = mci.getPath();
		if(image!=null&&image.length()>0){
		String imagePath = realPath+image;
		FileHelperUtil.deleteFile(imagePath);
		}
		DaoFactory.getModelColumnImageDao().deleteModelColumnImage(mci);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	/**
	 * 准备新增
	 * @return
	 */
	
	public String processPrepareAddModelColumnImageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.COLUMN_IMAGE_TYPE);
		super.setRequestAttribute("modelColumnImageType",typeList);
		return SUCCESS;
	}
	
	private ModelColumnImage modelColumnImage = new ModelColumnImage();
	
	private File fileImage;
	private File fileFlash;
	private String fileImageFileName;
	private String fileFlashFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath + "admin/uploadImage/ModelColumnImage/image/";
	private String dataImagePath = "admin/uploadImage/ModelColumnImage/image/";
	private String uploadFlashPath = realPath + "admin/uploadImage/ModelColumnImage/flash/";
	private String dataFlashPath = "admin/uploadImage/ModelColumnImage/flash/";
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelColumnImageAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		// 判断图片类型
		if (fileImage != null && fileImageFileName != null) {
			boolean isSuitType = ImageHelperUtil.isSuitType(fileImageFileName);
			if (!isSuitType) {
				super.setActionResponse(RESPONSE_FAILURE,
						Constants.imageTypeString);
				return SUCCESS;
			}
		}
		// 判断图片大小
		if (fileImage != null && fileImageFileName != null) {
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileImage);
			if (!isSuitSize) {
				super.setActionResponse(RESPONSE_FAILURE,
						Constants.imageSizeString);
				return SUCCESS;
			}
		}
		String timeFileImageFileName = "";
		if (fileImage != null && fileImageFileName != null) {
			timeFileImageFileName = ImageHelperUtil
					.getNameFromTime(fileImageFileName);
		}
		if (fileImage != null && fileImageFileName != null) {
			byte[] content = FileHelperUtil.readFile(fileImage
					.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath, timeFileImageFileName,
					content);
		}
		if (fileImageFileName != null && fileImageFileName.length() > 0) {
			modelColumnImage.setPath(dataImagePath + timeFileImageFileName);
		}
		
		//判断Flash类型
		if (fileFlash != null && fileFlashFileName != null) {
			boolean isSuitType = ImageHelperUtil.isSuitFlashType(fileFlashFileName);
			if (!isSuitType) {
				super.setActionResponse(RESPONSE_FAILURE,Constants.flashTypeString);
				return SUCCESS;
			}
		}
		// 判断Flash大小
		if (fileFlash != null && fileFlashFileName != null) {
			boolean isSuitSize = ImageHelperUtil.isSuitFlashSize(fileFlash);
			if (!isSuitSize) {
				super.setActionResponse(RESPONSE_FAILURE,Constants.flashSizeString);
				return SUCCESS;
			}
		}
		String timeFileFlashFileName = "";
		if (fileFlash != null && fileFlashFileName != null) {
			timeFileFlashFileName = ImageHelperUtil.getNameFromTime(fileFlashFileName);
		}
		if (fileFlash != null && fileFlashFileName != null) {
			byte[] content = FileHelperUtil.readFile(fileFlash.getAbsolutePath());
			FileHelperUtil.writeFile(uploadFlashPath, timeFileFlashFileName,content);
		}
		if (fileFlashFileName != null && fileFlashFileName.length() > 0) {
			modelColumnImage.setFlash(dataFlashPath + timeFileFlashFileName);
		}
		modelColumnImage.setStatus(new Integer(0));
		modelColumnImage.setCreator(super.getOnlineUser().getName());
		modelColumnImage.setCreateTime(new Date());
		DaoFactory.getModelColumnImageDao().addModelColumnImage(modelColumnImage);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 准备修改
	 * @return
	 */
	
	public String processPrepareUpdateModelColumnImageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.COLUMN_IMAGE_TYPE);
		List parentTypeList = DictionaryCache.getValuesListByParentCode(Dictionary.PARENT_TYPE);
		if(id!=null){
			modelColumnImage=DaoFactory.getModelColumnImageDao().queryModelColumnImageById(id);
		}
		super.setRequestAttribute("modelColumnImageType",typeList);
		super.setRequestAttribute("modelColumnImageParentType",parentTypeList);
		return SUCCESS;
	}
	
	public String processUpdateModelColumnImageAction(){
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelColumnImage mci = DaoFactory.getModelColumnImageDao().queryModelColumnImageById(id);
		// 判断图片类型
		if (fileImage != null && fileImageFileName != null) {
			boolean isSuitType = ImageHelperUtil.isSuitType(fileImageFileName);
			if (!isSuitType) {
				super.setActionResponse(RESPONSE_FAILURE,
						Constants.imageTypeString);
				return SUCCESS;
			}
		}
		// 判断图片大小
		if (fileImage != null && fileImageFileName != null) {
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileImage);
			if (!isSuitSize) {
				super.setActionResponse(RESPONSE_FAILURE,
						Constants.imageSizeString);
				return SUCCESS;
			}
		}
		String timeFileImageFileName = "";
		if (fileImage != null && fileImageFileName != null) {
			timeFileImageFileName = ImageHelperUtil
					.getNameFromTime(fileImageFileName);
		}
		if (fileImage != null && fileImageFileName != null) {
			byte[] content = FileHelperUtil.readFile(fileImage
					.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath, timeFileImageFileName,
					content);
		}
		if (fileImageFileName != null && fileImageFileName.length() > 0) {
			mci.setPath(dataImagePath + timeFileImageFileName);
		}
		
		//判断Flash类型
		if (fileFlash != null && fileFlashFileName != null) {
			boolean isSuitType = ImageHelperUtil.isSuitFlashType(fileFlashFileName);
			if (!isSuitType) {
				super.setActionResponse(RESPONSE_FAILURE,Constants.flashTypeString);
				return SUCCESS;
			}
		}
		// 判断Flash大小
		if (fileFlash != null && fileFlashFileName != null) {
			boolean isSuitSize = ImageHelperUtil.isSuitFlashSize(fileFlash);
			if (!isSuitSize) {
				super.setActionResponse(RESPONSE_FAILURE,Constants.flashSizeString);
				return SUCCESS;
			}
		}
		String timeFileFlashFileName = "";
		if (fileFlash != null && fileFlashFileName != null) {
			timeFileFlashFileName = ImageHelperUtil.getNameFromTime(fileFlashFileName);
		}
		if (fileFlash != null && fileFlashFileName != null) {
			byte[] content = FileHelperUtil.readFile(fileFlash.getAbsolutePath());
			FileHelperUtil.writeFile(uploadFlashPath, timeFileFlashFileName,content);
		}
		if (fileFlashFileName != null && fileFlashFileName.length() > 0) {
			mci.setFlash(dataFlashPath + timeFileFlashFileName);
		}
		mci.setTitle(modelColumnImage.getTitle());
		mci.setType(modelColumnImage.getType());
		mci.setParentType(modelColumnImage.getParentType());
		mci.setLink(modelColumnImage.getLink());
		mci.setUpdator(super.getOnlineUser().getName());
		mci.setUpdateTime(new Date());
		DaoFactory.getModelColumnImageDao().updateModelColumnImage(mci);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * flash预览
	 * @return
	 */
	public String processPlayerFlashAction(){
		
		return SUCCESS;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getParentType() {
		return parentType;
	}
	public void setParentType(Integer parentType) {
		this.parentType = parentType;
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
	public ModelColumnImage getModelColumnImage() {
		return modelColumnImage;
	}
	public void setModelColumnImage(ModelColumnImage modelColumnImage) {
		this.modelColumnImage = modelColumnImage;
	}
	public String getASoPath() {
		return aSoPath;
	}
	public void setASoPath(String soPath) {
		aSoPath = soPath;
	}
	public File getFileFlash() {
		return fileFlash;
	}
	public void setFileFlash(File fileFlash) {
		this.fileFlash = fileFlash;
	}
	public String getFileFlashFileName() {
		return fileFlashFileName;
	}
	public void setFileFlashFileName(String fileFlashFileName) {
		this.fileFlashFileName = fileFlashFileName;
	}
	public File getFileImage() {
		return fileImage;
	}
	public void setFileImage(File fileImage) {
		this.fileImage = fileImage;
	}
	public String getFileImageFileName() {
		return fileImageFileName;
	}
	public void setFileImageFileName(String fileImageFileName) {
		this.fileImageFileName = fileImageFileName;
	}
	public int getPart() {
		return part;
	}
	public void setPart(int part) {
		this.part = part;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
