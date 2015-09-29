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
import com.newhc.admin.action.user.view.ModelVideoView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelVideo;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

public class ModelVideoAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelVideoAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private Integer id;
	private Integer categoryId;
	private String name;
	private Integer type;
	private Integer status;
	private Date startTime=null;
	private Date endTime=null;
	private String startT;
	private String endT;
	private String pubTime;
	private ModelVideo modelVideo = new ModelVideo();
	
	private File fileImage;
	private String fileImageFileName;
	
	private File fileSyImage;
	private String fileSyImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	private String uploadfalsePath = realPath +"chinese/uploadFile/Video/";
	private String datafalsePath = "chinese/uploadFile/Video/";
	
	private String uploadImagePath = realPath +"admin/uploadImage/Video/";
	private String dataImagePath = "admin/uploadImage/Video/";
	
	
	public String processModelVideoPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(startT!=null){
			startTime = DateHelper.toDate(getStartT(), DATE_FORMAT_DAY);
		}
		if(endT!=null){
			endTime = DateHelper.toDate(getEndT(), DATE_FORMAT_DAY);
		}
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelVideoDao().queryModelVideoPage(categoryId,name, startTime, endTime, status, pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelVideoView mnv = new ModelVideoView();
				mnv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				mnv.setName(NewStringHelper.truncate((String)map.get("name"),20,"..."));
				mnv.setCategoryId(NumbericHelper.getIntValue((Integer)map.get("category_id"),-1));
				mnv.setPubTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),DATE_FORMAT_DAY));
				String subPath = (String) map.get("path");
				if(subPath!=null&&subPath.length()>0){
					subPath = subPath.substring(25,subPath.length());
				}
				mnv.setPath(subPath);
				String content = (String)map.get("remark");
				if(content!=null&&content.length()>0){
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
	
	public String processAuditModelVideoAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelVideo ma = DaoFactory.getModelVideoDao().loadModelVideo(id);
			ma.setStatus(new Integer(1));
			DaoFactory.getModelVideoDao().updateModelVideo(ma);
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
	public String processReAuditModelVideoAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		try {
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelVideo ma = DaoFactory.getModelVideoDao().loadModelVideo(id);
			ma.setStatus(new Integer(0));
			DaoFactory.getModelVideoDao().updateModelVideo(ma);
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
	public String processPrepareAddModelVideoAction() {
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		pubTime = DateHelper.toString(new Date(), DATE_FORMAT_DAY);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelVideoAction() {
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		//判断视频类型
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitVideoType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.videoTypeString);
	        	return SUCCESS;
			}
		}
		//判断视频大小
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitVideoSize(fileImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.videoSizeString);
	        	return SUCCESS;
			}
		}
		//		判断图片类型
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileSyImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileSyImage);
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
			FileHelperUtil.writeFile(uploadfalsePath,timeFileImageFileName, content);
		}
		
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			modelVideo.setPath(datafalsePath+timeFileImageFileName);
		}
		String timeFileSyImageFileName ="";
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			timeFileSyImageFileName = ImageHelperUtil.getNameFromTime(fileSyImageFileName);
		}
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSyImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath, timeFileSyImageFileName, content);
		}
		if(fileSyImageFileName!=null&&fileSyImageFileName.length()>0){
			modelVideo.setImagePath(dataImagePath+timeFileSyImageFileName);
		}
		modelVideo.setCategoryId(categoryId);
		modelVideo.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		modelVideo.setStatus(new Integer(0));
		modelVideo.setCreator(super.getOnlineUser().getName());
		modelVideo.setCreateTime(new Date());
		DaoFactory.getModelVideoDao().addModelVideo(modelVideo);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelVideoAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelVideo mvc = DaoFactory.getModelVideoDao().loadModelVideo(id);
		String path = mvc.getPath();
		String realMdbPath = realPath+path;
		FileHelperUtil.deleteFile(realMdbPath);
		DaoFactory.getModelVideoDao().deleteModelVideo(mvc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
		
	}
	
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelVideoAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelVideo = DaoFactory.getModelVideoDao().loadModelVideo(id);
		pubTime = DateHelper.toString(modelVideo.getPubTime(), DATE_FORMAT_DAY);
		return SUCCESS;
	}
	/**
	 * 修改
	 * @return
	 */
	public String processUpdateModelVideoAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		ModelVideo mvc = DaoFactory.getModelVideoDao().loadModelVideo(id);
		
		//判断视频类型
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitVideoType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.videoTypeString);
	        	return SUCCESS;
			}
		}
		//判断视频大小
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitVideoSize(fileImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.videoSizeString);
	        	return SUCCESS;
			}
		}
		
//		判断图片类型
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileSyImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断图片大小
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileSyImage);
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
			FileHelperUtil.writeFile(uploadfalsePath,timeFileImageFileName, content);
		}
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			mvc.setPath(datafalsePath+timeFileImageFileName);
		}
		
		String timeFileSyImageFileName ="";
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			timeFileSyImageFileName = ImageHelperUtil.getNameFromTime(fileSyImageFileName);
		}
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSyImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath, timeFileSyImageFileName, content);
		}
		if(fileSyImageFileName!=null&&fileSyImageFileName.length()>0){
			mvc.setImagePath(dataImagePath+timeFileSyImageFileName);
		}
		
		mvc.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		mvc.setName(modelVideo.getName());
		mvc.setRemark(modelVideo.getRemark());
		mvc.setUpdateTime(new Date());
		mvc.setUpdator(super.getOnlineUser().getName());
		DaoFactory.getModelVideoDao().updateModelVideo(mvc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	private String ShenHeId;
	/**
	 * 批量审核
	 * 
	 * @return
	 */
	public String processUpdateAllModelVideoAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideo hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoDao().loadModelVideo(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(1));
				DaoFactory.getModelVideoDao().updateModelVideo(hs);
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
	public String processReUpdateAllModelVideoAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideo hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoDao().loadModelVideo(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(0));
				DaoFactory.getModelVideoDao().updateModelVideo(hs);
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
	public String processDeleteAllModelVideoAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelVideo hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelVideoDao().loadModelVideo(
						Integer.valueOf(shenhe[i]));
				String path = hs.getPath();
				String realMdbPath = realPath+path;
				FileHelperUtil.deleteFile(realMdbPath);
				DaoFactory.getModelVideoDao().deleteModelVideo(hs);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 下载
	 * @return
	 * @throws Exception
	 */
	public String processDownloadVideo() throws Exception
	{
		if(id != null && !"".equals(id)){
			ModelVideo fd = DaoFactory.getModelVideoDao().loadModelVideo(id);
			String path=realPath+fd.getPath();
			String fileName=fd.getPath();
			FileHelperUtil.downLoadFile(path, fileName,17);
		}
		return SUCCESS;
	}
	
	public ModelVideo getModelVideo() {
		return modelVideo;
	}
	public void setModelVideo(ModelVideo modelVideo) {
		this.modelVideo = modelVideo;
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
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getPubTime() {
		return pubTime;
	}
	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
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
	public String getEndT() {
		return endT;
	}
	public void setEndT(String endT) {
		this.endT = endT;
	}
	public String getStartT() {
		return startT;
	}
	public void setStartT(String startT) {
		this.startT = startT;
	}
	public File getFileSyImage() {
		return fileSyImage;
	}
	public void setFileSyImage(File fileSyImage) {
		this.fileSyImage = fileSyImage;
	}
	public String getFileSyImageFileName() {
		return fileSyImageFileName;
	}
	public void setFileSyImageFileName(String fileSyImageFileName) {
		this.fileSyImageFileName = fileSyImageFileName;
	}
	

}
