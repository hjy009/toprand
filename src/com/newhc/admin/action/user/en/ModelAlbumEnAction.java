package com.newhc.admin.action.user.en;

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
import com.newhc.admin.action.user.view.en.ModelAlbumEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelAlbum;
import com.newhc.admin.entity.en.ModelAlbumEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

public class ModelAlbumEnAction extends JSONPrintAction {
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelAlbumEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	
	private String name;
	private Integer id;
	private Integer typeId;
	private Integer status;
	private String ShenHeId;
	
	private File fileImage;
	private String fileImageFileName;
	
	
	
	private ModelAlbumEn modelAlbumEn = new ModelAlbumEn();
	
	public String processModelAlbumPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination pi = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnPage(typeId,name, status, pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(pi!=null&&pi.getTotalCount()>0){
			for(Iterator i = pi.getList().iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelAlbumEnView mpv = new ModelAlbumEnView();
				mpv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mpv.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));
				String imagePath = (String) map.get("image_path");
				if (imagePath != null && imagePath.length() > 0) {
					int k = imagePath.lastIndexOf("/");
					mpv.setImagePath(imagePath.substring(k + 1, imagePath.length()));
				}
				mpv.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mpv.setSequence(NumbericHelper.getIntValue((Integer)map.get("sequence"),0));
				mpv.setCreator((String)map.get("creator"));
				mpv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mpv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(pi.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelProductCategoryStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath +"admin/uploadImage/AlbumEn/";
	private String dataImagePath = "admin/uploadImage/AlbumEn/";
	
	public String processAddModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		//判断图片类型
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		String timeFileImageFileName ="";
		if(fileImage!=null&&fileImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileImageFileName);
		}
		if(fileImage!=null&&fileImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath,timeFileImageFileName, content);
		}
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			modelAlbumEn.setImagePath(dataImagePath+timeFileImageFileName);
		}
		modelAlbumEn.setCreator(super.getOnlineUser().getName());
		modelAlbumEn.setCreateTime(new Date());
		modelAlbumEn.setStatus(new Integer(0));
		modelAlbumEn.setTypeId(typeId);
		DaoFactory.getModelAlbumEnDao().addModelAlbumEn(modelAlbumEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelAlbumEn = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(id);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		ModelAlbumEn mp = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(id);
		//判断图片类型
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		String timeFileImageFileName ="";
		if(fileImage!=null&&fileImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileImageFileName);
		}
		if(fileImage!=null&&fileImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath,timeFileImageFileName, content);
		}
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			mp.setImagePath(dataImagePath+timeFileImageFileName);
		}
		mp.setName(modelAlbumEn.getName());
		mp.setSequence(modelAlbumEn.getSequence());
		mp.setUpdator(super.getOnlineUser().getName());
		mp.setUpdateTime(new Date());
		DaoFactory.getModelAlbumEnDao().updateModelAlbumEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelAlbumEn mp = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(id);
		mp.setStatus(new Integer(1));
		DaoFactory.getModelAlbumEnDao().updateModelAlbumEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelAlbumEn mp = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(id);
		mp.setStatus(new Integer(0));
		DaoFactory.getModelAlbumEnDao().updateModelAlbumEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelAlbumEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAlbumEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(1));
				DaoFactory.getModelAlbumEnDao().updateModelAlbumEn(mp);
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
	public String processReAuditAllModelAlbumEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAlbumEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(0));
				DaoFactory.getModelAlbumEnDao().updateModelAlbumEn(mp);
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
	public String processDeleteAllModelNewsEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelAlbumEn mp =null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				Integer shId = Integer.valueOf(shenhe[i]);
				mp =DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(shId);
				DaoFactory.getModelAlbumEnDao().deleteModelAlbumEn(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	
	
	/**
	 * 删除数据
	 * @return
	 */
	public String processDeleteModelAlbumEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelAlbumEn mp = DaoFactory.getModelAlbumEnDao().queryModelAlbumEnById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelAlbumEnDao().deleteModelAlbumEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
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

	 
	public ModelAlbumEn getModelAlbumEn() {
		return modelAlbumEn;
	}
	public void setModelAlbumEn(ModelAlbumEn modelAlbumEn) {
		this.modelAlbumEn = modelAlbumEn;
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
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
}
