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
import com.newhc.admin.action.user.view.en.ModelRemeberTheBigEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelRemeberTheBig;
import com.newhc.admin.entity.en.ModelRemeberTheBigEn;
import com.newhc.admin.exception.ServiceException;

public class ModelRemeberTheBigEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelLinkEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer pageMaxSize = 10;
	private Integer pageNumber = 1;
	private ModelRemeberTheBigEn modelRemeberTheBigEn = new ModelRemeberTheBigEn();
	private Integer id;
	private String year;
	private String content;
	private Integer status;
	private Integer type;
	private String typeName;
	private Integer columnsType;
	
	
 
	public String processsModelRemeberTheBigEnAction(){

		Integer userId = super.getOnlineUserId();
		if (userId == null)throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnPage(columnsType,status, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if (p != null && p.getTotalCount() > 0) {
			for (Iterator i = p.getList().iterator(); i.hasNext();) {
				Map map = (Map) i.next();
				ModelRemeberTheBigEnView lv = new ModelRemeberTheBigEnView();
				lv.setId((Integer)NumbericHelper.getIntValue(map.get("id"), 0));
				String contents =(String)map.get("content");
				lv.setContent(contents);
				lv.setYear((String)map.get("year"));
				lv.setStatus((Integer)NumbericHelper.getIntValue(map.get("status"), 0));
				lv.setCreator((String) map.get("creator"));
				lv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(lv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize, pageNumber, l));
		super.setRequestAttribute("status", statusList);
		return SUCCESS;
	}

	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelRemeberTheBigEn mtb = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(id);
		mtb.setStatus(new Integer(1));
		DaoFactory.getModelRemeberTheBigEnDao().updateModelRemeberTheBigEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelRemeberTheBigEn mtb = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(id);
		mtb.setStatus(new Integer(0));
		DaoFactory.getModelRemeberTheBigEnDao().updateModelRemeberTheBigEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelRemeberTheBigEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelRemeberTheBigEn mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(1));
				DaoFactory.getModelRemeberTheBigEnDao().updateModelRemeberTheBigEn(mtb);
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
	public String processReAuditAllModelRemeberTheBigEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelRemeberTheBigEn mtb=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mtb=DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(Integer.valueOf(shenhe[i]));
				mtb.setStatus(new Integer(0));
				DaoFactory.getModelRemeberTheBigEnDao().updateModelRemeberTheBigEn(mtb);
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
	public String processDeleteModelRemeberTheBigEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelRemeberTheBigEn mtb = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(id);
		if (mtb == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelRemeberTheBigEnDao().deleteModelRemeberTheBigEn(mtb);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	
	/**
	 * 批量删除
	 * 
	 * @return
	 */
	public String processDeleteAllModelRemeberTheBigEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelRemeberTheBigEn mtb = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				mtb = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelRemeberTheBigEnDao().deleteModelRemeberTheBigEn(mtb);
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
	
	public String processPrepareAddModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	
	private File fileImage;
	private String fileImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath +"admin/uploadImage/ModelRemeberTheBig/ImageEn/";
	private String dataImagePath = "admin/uploadImage/ModelRemeberTheBig/ImageEn/";
	
	public String processAddModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		/**
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
			modelRemeberTheBig.setPath(dataImagePath+timeFileImageFileName);
		}*/
		
		
		modelRemeberTheBigEn.setCreateTime(new Date());
		modelRemeberTheBigEn.setCreator(super.getOnlineUser().getName());
		modelRemeberTheBigEn.setStatus(new Integer(0));
		DaoFactory.getModelRemeberTheBigEnDao().addModelRemeberTheBigEn(modelRemeberTheBigEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	
	/**
	 * 准备修改
	 * @return
	 */
	
	public String processPrepareUpadteModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelRemeberTheBigEn=DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(id);
		return SUCCESS;
	}
	
	
	public String processUpadteModelRemeberTheBigEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id!=null){
			ModelRemeberTheBigEn  mtb= DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnById(id);
			/**
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
				mtb.setPath(dataImagePath+timeFileImageFileName);
			}*/
			
			mtb.setContent(modelRemeberTheBigEn.getContent());
			mtb.setUpdateTime(new Date());
			mtb.setUpdator(super.getOnlineUser().getName());
			mtb.setYear(modelRemeberTheBigEn.getYear());
			DaoFactory.getModelRemeberTheBigEnDao().updateModelRemeberTheBigEn(mtb);
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

	 
	public ModelRemeberTheBigEn getModelRemeberTheBigEn() {
		return modelRemeberTheBigEn;
	}

	public void setModelRemeberTheBigEn(ModelRemeberTheBigEn modelRemeberTheBigEn) {
		this.modelRemeberTheBigEn = modelRemeberTheBigEn;
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
