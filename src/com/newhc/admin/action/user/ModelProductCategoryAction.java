package com.newhc.admin.action.user;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelProduct;
import com.newhc.admin.entity.ModelProductCategory;
import com.newhc.admin.entity.ModelProductHistory;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.ErrorMessageHelper;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;

public class ModelProductCategoryAction extends JSONPrintAction{
	
	private static final long serialVersionUID = 1L;
//	private static final Log logger = LogFactory.getLog(ModelContentCategoryAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private String name;
	private Integer status;
	private Integer type;
	private String typeName;
	private Integer columnsType;
	
	public String processModelProductCategoryPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryPage(name,columnsType,status,pageMaxSize, pageNumber);
		List<ModelProductCategory> l = new ArrayList<ModelProductCategory>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProductCategory> i = p.getList().iterator();i.hasNext();){
				ModelProductCategory mpc = (ModelProductCategory) i.next();
				mpc.setCreateTimeString(DateHelper.toString(mpc.getCreateTime(), DATE_FORMAT));
				l.add(mpc);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelProductCategoryStatus",statusList);
		return SUCCESS;
	}
	
	/**
	 * 准备新增
	 * @return
	 */
	
	public String processPrepareAddModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	
	private ModelProductCategory modelProductCategory = new ModelProductCategory();
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelProductCategory.setStatus(new Integer(0));
		modelProductCategory.setCreator(super.getOnlineUser().getName());
		modelProductCategory.setCreateTime(new Date());
		DaoFactory.getModelProductCategoryDao().addModelProductCategory(modelProductCategory);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProductCategory = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(id);
		return SUCCESS;
	}
	
	public String processUpdateModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductCategory mpc = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(id);
		mpc.setName(modelProductCategory.getName());
		mpc.setSequence(modelProductCategory.getSequence());
		mpc.setUpdator(super.getOnlineUser().getName());
		mpc.setUpdateTime(new Date());
		DaoFactory.getModelProductCategoryDao().updateModelProductCategory(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductCategory mpc = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(id);
		mpc.setStatus(new Integer(1));
		DaoFactory.getModelProductCategoryDao().updateModelProductCategory(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelProductCategoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductCategory mpc = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(id);
		mpc.setStatus(new Integer(0));
		DaoFactory.getModelProductCategoryDao().updateModelProductCategory(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelProductCategoryAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductCategory mpc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mpc=DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(Integer.valueOf(shenhe[i]));
				mpc.setStatus(new Integer(1));
				DaoFactory.getModelProductCategoryDao().updateModelProductCategory(mpc);
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
	public String processReAuditAllModelProductCategoryAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductCategory mpc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mpc=DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(Integer.valueOf(shenhe[i]));
				mpc.setStatus(new Integer(0));
				DaoFactory.getModelProductCategoryDao().updateModelProductCategory(mpc);
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
	public String processDeleteModelProductCategoryAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelProductCategory mpc = DaoFactory.getModelProductCategoryDao().queryModelProductCategoryById(id);
			if(mpc == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			int count = DaoFactory.getModelProductCategoryDao().queryModelProductByCategoryId(id);
			if(count==0){
				DaoFactory.getModelProductCategoryDao().deleteModelProductCategory(mpc);
				super.setActionResponse(RESPONSE_SUCCESS);
			}else{
				throw new ServiceException(ErrorCode.DELETE_PARENT_CATEGORY_FALSE);
			}
		}catch(ServiceException se){
//			logger.error("ERROR:ServiceException-->"+se.getMessage());
			super.setActionResponse(RESPONSE_FAILURE, ErrorMessageHelper.getMessage(se.getMessage()));
		}
		return execJSONReponseAction();
	}
	
	private Integer categoryId;
	private String categoryName;
	private Integer sequence;
	
	public String processModelProductPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryDao().queryModelProductPage(categoryId,name,status,sequence,pageMaxSize,pageNumber);
		List<ModelProduct> l = new ArrayList<ModelProduct>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProduct> i = p.getList().iterator();i.hasNext();){
				ModelProduct md = (ModelProduct) i.next();
				md.setPubTimeString(DateHelper.toString(md.getPubTime(), DATE_FORMAT_DAY));
				md.setCreateTimeString(DateHelper.toString(md.getCreateTime(), DATE_FORMAT));
				l.add(md);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelProductStatus",statusList);
		return SUCCESS;
	}
	
	private String pubTime;
	/**
	 * 准备新增
	 * @return
	 */
	
	public String processPrepareAddModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		pubTime = DateHelper.toString(new Date(), DATE_FORMAT_DAY);
		return SUCCESS;
	}
	
	private ModelProduct modelProduct = new ModelProduct();
	
	private File fileBigImage;
	private String fileBigImageFileName;
	private File fileSmallImage;
	private String fileSmallImageFileName;
	
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	private String uploadBigImagePath = realPath +"admin/uploadImage/Product/BigImage/";
	private String dataBigImagePath = "admin/uploadImage/Product/BigImage/";
	private String uploadSmallImagePath = realPath +"admin/uploadImage/Product/SmallImage/";
	private String dataSmallImagePath = "admin/uploadImage/Product/SmallImage/";
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(categoryId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		//判断大图片类型
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileBigImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断大图片大小
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileBigImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		//判断小图片类型
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileSmallImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断小图片大小
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileSmallImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		String timeFileImageFileName ="";
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileBigImageFileName);
		}
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileBigImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadBigImagePath,timeFileImageFileName, content);
		}
		if(fileBigImageFileName!=null&&fileBigImageFileName.length()>0){
			modelProduct.setBigImage(dataBigImagePath+timeFileImageFileName);
		}
		
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileSmallImageFileName);
		}
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSmallImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadSmallImagePath,timeFileImageFileName, content);
		}
		if(fileSmallImageFileName!=null&&fileSmallImageFileName.length()>0){
			modelProduct.setSmallImage(dataSmallImagePath+timeFileImageFileName);
		}
		modelProduct.setCategoryId(categoryId);
		modelProduct.setStatus(new Integer(0));
		modelProduct.setCreator(super.getOnlineUser().getName());
		modelProduct.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		modelProduct.setCreateTime(new Date());
		DaoFactory.getModelProductCategoryDao().addModelProduct(modelProduct);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProduct = DaoFactory.getModelProductCategoryDao().queryModelProductById(id);
		pubTime = DateHelper.toString(modelProduct.getPubTime(),DATE_FORMAT_DAY);
		return SUCCESS;
	}
	
	public String processUpdateModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProduct mp = DaoFactory.getModelProductCategoryDao().queryModelProductById(id);
		
		//判断大图片类型
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileBigImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断大图片大小
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileBigImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		//判断小图片类型
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitType(fileSmallImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageTypeString);
	        	return SUCCESS;
			}
		}
		//判断小图片大小
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitSize(fileSmallImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
	        	return SUCCESS;
			}
		}
		/**
		//历史
		modelProductHistory.setProductId(id);
		modelProductHistory.setName(mp.getName());
		modelProductHistory.setBigImage(mp.getBigImage());
		modelProductHistory.setSmallImage(mp.getSmallImage());
		modelProductHistory.setContent(mp.getContent());
		modelProductHistory.setInitPrice(mp.getInitPrice());
		modelProductHistory.setNowPrice(mp.getNowPrice());
		modelProductHistory.setDiscount(mp.getDiscount());
		modelProductHistory.setPubTime(mp.getPubTime());
		modelProductHistory.setSequence(mp.getSequence());
		modelProductHistory.setRemark(mp.getRemark());
		modelProductHistory.setStatus(mp.getStatus());
		modelProductHistory.setCreator(mp.getCreator());
		modelProductHistory.setCreateTime(mp.getCreateTime());
		modelProductHistory.setUpdateTime(mp.getUpdateTime());
		modelProductHistory.setUpdator(mp.getUpdator());
		DaoFactory.getModelProductCategoryDao().addModelProductHistory(modelProductHistory);**/
		
		String timeFileImageFileName ="";
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileBigImageFileName);
		}
		if(fileBigImage!=null&&fileBigImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileBigImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadBigImagePath,timeFileImageFileName, content);
		}
		if(fileBigImageFileName!=null&&fileBigImageFileName.length()>0){
			mp.setBigImage(dataBigImagePath+timeFileImageFileName);
		}
		
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileSmallImageFileName);
		}
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSmallImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadSmallImagePath,timeFileImageFileName, content);
		}
		if(fileSmallImageFileName!=null&&fileSmallImageFileName.length()>0){
			mp.setSmallImage(dataSmallImagePath+timeFileImageFileName);
		}
		
		mp.setName(modelProduct.getName());
		mp.setContent(modelProduct.getContent());
		mp.setInitPrice(modelProduct.getInitPrice());
		mp.setNowPrice(modelProduct.getNowPrice());
		mp.setDiscount(modelProduct.getDiscount());
		mp.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		mp.setSequence(modelProduct.getSequence());
		mp.setRemark(modelProduct.getRemark());
		mp.setUpdator(super.getOnlineUser().getName());
		mp.setUpdateTime(new Date());
		DaoFactory.getModelProductCategoryDao().updateModelProduct(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProduct mp = DaoFactory.getModelProductCategoryDao().queryModelProductById(id);
		mp.setStatus(new Integer(1));
		DaoFactory.getModelProductCategoryDao().updateModelProduct(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProduct mp = DaoFactory.getModelProductCategoryDao().queryModelProductById(id);
		mp.setStatus(new Integer(0));
		DaoFactory.getModelProductCategoryDao().updateModelProduct(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelProductAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProduct mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryDao().queryModelProductById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(1));
				DaoFactory.getModelProductCategoryDao().updateModelProduct(mp);
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
	public String processReAuditAllModelProductAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProduct mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryDao().queryModelProductById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(0));
				DaoFactory.getModelProductCategoryDao().updateModelProduct(mp);
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
	public String processDeleteModelProductAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProduct mp = DaoFactory.getModelProductCategoryDao().queryModelProductById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelProductCategoryDao().deleteModelProduct(mp);
		List list = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryByProductId(id);
		if(list!=null&&list.size()>0){
			for(Iterator i=list.iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelProductHistory mph = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById((Integer)map.get("id"));
				DaoFactory.getModelProductCategoryDao().deleteModelProductHistory(mph);
			}
		}
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelProductAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProduct mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryDao().queryModelProductById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelProductCategoryDao().deleteModelProduct(mp);
				List list = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryByProductId(Integer.valueOf(shenhe[i]));
				if(list!=null&&list.size()>0){
					for(Iterator f=list.iterator();f.hasNext();){
						Map map = (Map)f.next();
						ModelProductHistory mph = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById((Integer)map.get("id"));
						DaoFactory.getModelProductCategoryDao().deleteModelProductHistory(mph);
					}
				}
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	/**
	 * 产品历史
	 * @return
	 */
	private Integer productId;
	private ModelProductHistory modelProductHistory = new ModelProductHistory();
	public String processModelProductHistoryPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryPage(productId,name,status,sequence,pageMaxSize,pageNumber);
		List<ModelProduct> l = new ArrayList<ModelProduct>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProduct> i = p.getList().iterator();i.hasNext();){
				ModelProduct md = (ModelProduct) i.next();
				md.setPubTimeString(DateHelper.toString(md.getPubTime(), DATE_FORMAT_DAY));
				md.setCreateTimeString(DateHelper.toString(md.getCreateTime(), DATE_FORMAT));
				l.add(md);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("modelProductHistoryStatus",statusList);
		return SUCCESS;
	}
	/**
	 * 查看产品历史
	 * @return
	 */
	public String processQueryModelProductHistoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProductHistory = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById(id);
		pubTime = DateHelper.toString(modelProductHistory.getPubTime(),DATE_FORMAT_DAY);
		return SUCCESS;
	}
	/**
	 * 删除产品历史
	 * @return
	 */
	public String processDeleteModelProductHistoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductHistory mp = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelProductCategoryDao().deleteModelProductHistory(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除产品历史
	 * @return
	 */
	public String processDeleteAllModelProductHistoryAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductHistory mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelProductCategoryDao().deleteModelProductHistory(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	public String processRecoveryModelProductHistoryAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(productId==null||id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		try{
		modelProduct = DaoFactory.getModelProductCategoryDao().queryModelProductById(productId);
		//历史
		modelProductHistory.setProductId(modelProduct.getId());
		modelProductHistory.setName(modelProduct.getName());
		modelProductHistory.setBigImage(modelProduct.getBigImage());
		modelProductHistory.setSmallImage(modelProduct.getSmallImage());
		modelProductHistory.setContent(modelProduct.getContent());
		modelProductHistory.setInitPrice(modelProduct.getInitPrice());
		modelProductHistory.setNowPrice(modelProduct.getNowPrice());
		modelProductHistory.setDiscount(modelProduct.getDiscount());
		modelProductHistory.setPubTime(modelProduct.getPubTime());
		modelProductHistory.setSequence(modelProduct.getSequence());
		modelProductHistory.setRemark(modelProduct.getRemark());
		modelProductHistory.setStatus(modelProduct.getStatus());
		modelProductHistory.setCreator(modelProduct.getCreator());
		modelProductHistory.setCreateTime(modelProduct.getCreateTime());
		modelProductHistory.setUpdateTime(modelProduct.getUpdateTime());
		modelProductHistory.setUpdator(modelProduct.getUpdator());
		DaoFactory.getModelProductCategoryDao().addModelProductHistory(modelProductHistory);
		//恢复
		modelProductHistory = DaoFactory.getModelProductCategoryDao().queryModelProductHistoryById(id);
		modelProduct.setName(modelProductHistory.getName());
		modelProduct.setBigImage(modelProductHistory.getBigImage());
		modelProduct.setSmallImage(modelProductHistory.getSmallImage());
		modelProduct.setContent(modelProductHistory.getContent());
		modelProduct.setInitPrice(modelProductHistory.getInitPrice());
		modelProduct.setNowPrice(modelProductHistory.getNowPrice());
		modelProduct.setDiscount(modelProductHistory.getDiscount());
		modelProduct.setPubTime(modelProductHistory.getPubTime());
		modelProduct.setSequence(modelProductHistory.getSequence());
		modelProduct.setRemark(modelProductHistory.getRemark());
		modelProduct.setStatus(modelProductHistory.getStatus());
		modelProduct.setUpdateTime(new Date());
		modelProduct.setUpdator(super.getOnlineUser().getName());
		modelProduct.setCreator(modelProductHistory.getCreator());
		modelProduct.setCreateTime(modelProductHistory.getCreateTime());
		DaoFactory.getModelProductCategoryDao().updateModelProduct(modelProduct);
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public ModelProductCategory getModelProductCategory() {
		return modelProductCategory;
	}

	public void setModelProductCategory(ModelProductCategory modelProductCategory) {
		this.modelProductCategory = modelProductCategory;
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

	public Integer getCategoryId() {
		return categoryId;
	}



	public Integer getColumnsType() {
		return columnsType;
	}

	public void setColumnsType(Integer columnsType) {
		this.columnsType = columnsType;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPubTime() {
		return pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

	public ModelProduct getModelProduct() {
		return modelProduct;
	}

	public void setModelProduct(ModelProduct modelProduct) {
		this.modelProduct = modelProduct;
	}

	public File getFileBigImage() {
		return fileBigImage;
	}

	public void setFileBigImage(File fileBigImage) {
		this.fileBigImage = fileBigImage;
	}

	public String getFileBigImageFileName() {
		return fileBigImageFileName;
	}

	public void setFileBigImageFileName(String fileBigImageFileName) {
		this.fileBigImageFileName = fileBigImageFileName;
	}

	public File getFileSmallImage() {
		return fileSmallImage;
	}

	public void setFileSmallImage(File fileSmallImage) {
		this.fileSmallImage = fileSmallImage;
	}

	public String getFileSmallImageFileName() {
		return fileSmallImageFileName;
	}

	public void setFileSmallImageFileName(String fileSmallImageFileName) {
		this.fileSmallImageFileName = fileSmallImageFileName;
	}

	public ModelProductHistory getModelProductHistory() {
		return modelProductHistory;
	}

	public void setModelProductHistory(ModelProductHistory modelProductHistory) {
		this.modelProductHistory = modelProductHistory;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	} 
}
