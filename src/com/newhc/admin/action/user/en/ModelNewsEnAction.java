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
import com.newhc.admin.action.user.view.en.ModelNewsEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelNews;
import com.newhc.admin.entity.en.ModelNewsEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-4-26
 */
public class ModelNewsEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private Integer centerId;
	private String title;
	private Integer status;
	private String companyName;
	private Integer sequence;
	private Integer type;
	private Integer id;
	private Integer click;
	private String dateFormat;//日期
	private ModelNewsEn modelNewsEn = new ModelNewsEn();
	
	private String startTime;
	private String endTime;
	
	
	private Date startT = null;
	private Date endT = null;
	private File fileImage;
	private String fileImageFileName;
	private File fileSyImage;
	private String fileSyImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	private String uploadImagePath = realPath +"admin/uploadImage/NewsEn/";
	private String dataImagePath = "admin/uploadImage/NewsEn/";
	private String uploadSyImagePath = realPath +"admin/uploadImage/News/SyEn/";
	private String dataSyImagePath = "admin/uploadImage/News/SyEn/";
	
	public String processModelNewsPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(startTime!=null){
			startT = DateHelper.toDate(getStartTime(), DATE_FORMAT_DAY);
		}
		if(endTime!=null){
			endT = DateHelper.toDate(getEndTime(), DATE_FORMAT_DAY);
		}
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelNewsEnDao().queryModelNewsEnPage(title,centerId,null,status,sequence, startT,endT,pageMaxSize, pageNumber);
		List l=new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator i = p.getList().iterator();i.hasNext();){
				Map map = (Map) i.next();
				ModelNewsEnView mnv = new ModelNewsEnView();
				mnv.setId(NumbericHelper.getIntValue((Integer)map.get("id"),-1));
				String content = (String)map.get("content");
				content = content.replaceAll("<[^>]*>","").trim();
				mnv.setContent(NewStringHelper.truncate(content,20,"..."));
				mnv.setTitle(NewStringHelper.truncate((String)map.get("title"),20,"..."));
			
				mnv.setPubTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),DATE_FORMAT_DAY));
				mnv.setStatus(NumbericHelper.getIntValue((Integer)map.get("status"),-1));
				mnv.setSequence(NumbericHelper.getIntValue((Integer)map.get("sequence"),0));
				mnv.setCreator((String)map.get("creator"));
				mnv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(mnv);
			}
		}		
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelNewsStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsEn mn = DaoFactory.getModelNewsEnDao().queryModelNewsEnById(id);
		mn.setStatus(new Integer(1));
		DaoFactory.getModelNewsEnDao().updateModelNewsEn(mn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelNewsEn mn = DaoFactory.getModelNewsEnDao().queryModelNewsEnById(id);
		mn.setStatus(new Integer(0));
		DaoFactory.getModelNewsEnDao().updateModelNewsEn(mn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelNewsEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsEn mn=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mn=DaoFactory.getModelNewsEnDao().queryModelNewsEnById(Integer.valueOf(shenhe[i]));
				mn.setStatus(new Integer(1));
				DaoFactory.getModelNewsEnDao().updateModelNewsEn(mn);
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
	public String processReAuditAllModelNewsEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelNewsEn mn=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i < shenhe.length;i++){
				mn=DaoFactory.getModelNewsEnDao().queryModelNewsEnById(Integer.valueOf(shenhe[i]));
				mn.setStatus(new Integer(0));
				DaoFactory.getModelNewsEnDao().updateModelNewsEn(mn);
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
	    ModelNewsEn mn=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				Integer shId = Integer.valueOf(shenhe[i]);
				mn=DaoFactory.getModelNewsEnDao().queryModelNewsEnById(shId);
				DaoFactory.getModelNewsEnDao().deleteModelNewsEn(mn);
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
	public String processDeleteModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsEn mn = DaoFactory.getModelNewsEnDao().queryModelNewsEnById(id);
		if(mn == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelNewsEnDao().deleteModelNewsEn(mn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备新增
	 * @return
	 */
	private String pubTime;
	
	public String processPrepareAddModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		pubTime = DateHelper.toString(new Date(), DATE_FORMAT_DAY);
		dateFormat = DateHelper.toString(new Date(), "yyyy");
		return SUCCESS;
	}
	
	/**
	 * 新增数据
	 * @return
	 */
	public String processAddModelNewsEnAction(){
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
		
		//判断图片类型
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
			FileHelperUtil.writeFile(uploadImagePath,timeFileImageFileName, content);
		}
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			modelNewsEn.setPath(dataImagePath+timeFileImageFileName);
		}
		
		
		String timeFileSyImageFileName ="";
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			timeFileSyImageFileName = ImageHelperUtil.getNameFromTime(fileSyImageFileName);
		}
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSyImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadSyImagePath, timeFileSyImageFileName, content);
		}
		if(fileSyImageFileName!=null&&fileSyImageFileName.length()>0){
			modelNewsEn.setSyPath(dataSyImagePath+timeFileSyImageFileName);
		}
		modelNewsEn.setCenterId(centerId);
		modelNewsEn.setCreator(super.getOnlineUser().getName());
		modelNewsEn.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		modelNewsEn.setCreateTime(new Date());
		modelNewsEn.setStatus(new Integer(0));
		DaoFactory.getModelNewsEnDao().addModelNewsEn(modelNewsEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelNewsEn = DaoFactory.getModelNewsEnDao().queryModelNewsEnById(id);
		pubTime = DateHelper.toString(modelNewsEn.getPubTime(),DATE_FORMAT_DAY);
		return SUCCESS;
	}
	
	/**
	 * 修改数据
	 * @return
	 */
	public String processUpdateModelNewsEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelNewsEn mn = DaoFactory.getModelNewsEnDao().queryModelNewsEnById(id);
		
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
		
		//判断图片类型
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
		
		//新增历史记录
		
	
		
		String timeFileImageFileName ="";
		if(fileImage!=null&&fileImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileImageFileName);
		}
		if(fileImage!=null&&fileImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadImagePath, timeFileImageFileName, content);
		}
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
			mn.setPath(dataImagePath+timeFileImageFileName);
		}
		
		
		String timeFileSyImageFileName ="";
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			timeFileSyImageFileName = ImageHelperUtil.getNameFromTime(fileSyImageFileName);
		}
		if(fileSyImage!=null&&fileSyImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSyImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadSyImagePath, timeFileSyImageFileName, content);
		}
		if(fileSyImageFileName!=null&&fileSyImageFileName.length()>0){
			mn.setSyPath(dataSyImagePath+timeFileSyImageFileName);
		}
		
		mn.setTitle(modelNewsEn.getTitle());
		mn.setContent(modelNewsEn.getContent());
	
		mn.setSource(modelNewsEn.getSource());
		mn.setReporter(modelNewsEn.getReporter());
		mn.setClick(modelNewsEn.getClick());
		mn.setYear(modelNewsEn.getYear());
		mn.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		mn.setSequence(modelNewsEn.getSequence());
		mn.setUpdator(super.getOnlineUser().getName());
		mn.setUpdateTime(new Date());
		DaoFactory.getModelNewsEnDao().updateModelNewsEn(mn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private Integer previewType;
	private String previewPath;
	/**
	 * 预览
	 * @return
	 */
	public String processPreviewAction(){
		if(previewType.intValue()==1){
			return "imageSuccess";
		}else{
			return "videoSuccess";
		}
	}
	
	
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getClick() {
		return click;
	}
	public void setClick(Integer click) {
		this.click = click;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	 
	public ModelNewsEn getModelNewsEn() {
		return modelNewsEn;
	}
	public void setModelNewsEn(ModelNewsEn modelNewsEn) {
		this.modelNewsEn = modelNewsEn;
	}
	public String getPreviewPath() {
		return previewPath;
	}
	public void setPreviewPath(String previewPath) {
		this.previewPath = previewPath;
	}
	public Integer getPreviewType() {
		return previewType;
	}
	public void setPreviewType(Integer previewType) {
		this.previewType = previewType;
	}
	public Integer getCenterId() {
		return centerId;
	}
	public void setCenterId(Integer centerId) {
		this.centerId = centerId;
	}
	
}
