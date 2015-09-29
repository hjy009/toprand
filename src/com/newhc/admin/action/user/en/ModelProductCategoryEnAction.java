package com.newhc.admin.action.user.en;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import com.newhc.admin.entity.en.ModelProductCategoryEn;
import com.newhc.admin.entity.en.ModelProductEn;
import com.newhc.admin.entity.en.ModelProductHistoryEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.ErrorMessageHelper;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;

public class ModelProductCategoryEnAction extends JSONPrintAction{
	
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
	
	public String processModelProductCategoryPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnPage(name,columnsType,status,pageMaxSize, pageNumber);
		List<ModelProductCategoryEn> l = new ArrayList<ModelProductCategoryEn>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProductCategoryEn> i = p.getList().iterator();i.hasNext();){
				ModelProductCategoryEn mpc = (ModelProductCategoryEn)i.next();
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
	
	public String processPrepareAddModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	
	private ModelProductCategoryEn modelProductCategoryEn = new ModelProductCategoryEn();
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		modelProductCategoryEn.setStatus(new Integer(0));
		modelProductCategoryEn.setCreator(super.getOnlineUser().getName());
		modelProductCategoryEn.setCreateTime(new Date());
		DaoFactory.getModelProductCategoryEnDao().addModelProductCategoryEn(modelProductCategoryEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProductCategoryEn = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(id);
		return SUCCESS;
	}
	
	public String processUpdateModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductCategoryEn mpc = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(id);
		mpc.setName(modelProductCategoryEn.getName());
		mpc.setSequence(modelProductCategoryEn.getSequence());
		mpc.setUpdator(super.getOnlineUser().getName());
		mpc.setUpdateTime(new Date());
		DaoFactory.getModelProductCategoryEnDao().updateModelProductCategoryEn(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductCategoryEn mpc = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(id);
		mpc.setStatus(new Integer(1));
		DaoFactory.getModelProductCategoryEnDao().updateModelProductCategoryEn(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelProductCategoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductCategoryEn mpc = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(id);
		mpc.setStatus(new Integer(0));
		DaoFactory.getModelProductCategoryEnDao().updateModelProductCategoryEn(mpc);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	private String ShenHeId;
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelProductCategoryEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductCategoryEn mpc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mpc=DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(Integer.valueOf(shenhe[i]));
				mpc.setStatus(new Integer(1));
				DaoFactory.getModelProductCategoryEnDao().updateModelProductCategoryEn(mpc);
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
	public String processReAuditAllModelProductCategoryEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductCategoryEn mpc=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mpc=DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(Integer.valueOf(shenhe[i]));
				mpc.setStatus(new Integer(0));
				DaoFactory.getModelProductCategoryEnDao().updateModelProductCategoryEn(mpc);
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
	public String processDeleteModelProductCategoryEnAction(){
		try{
			Integer userId = super.getOnlineUserId();
			if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
			if(id==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			ModelProductCategoryEn mpc = DaoFactory.getModelProductCategoryEnDao().queryModelProductCategoryEnById(id);
			if(mpc == null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			int count = DaoFactory.getModelProductCategoryDao().queryModelProductByCategoryId(id);
			if(count==0){
				DaoFactory.getModelProductCategoryEnDao().deleteModelProductCategoryEn(mpc);
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
	
	public String processModelProductPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnPage(categoryId,name,status,sequence,pageMaxSize,pageNumber);
		List<ModelProductEn> l = new ArrayList<ModelProductEn>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProductEn> i = p.getList().iterator();i.hasNext();){
				ModelProductEn md = (ModelProductEn) i.next();
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
	
	public String processPrepareAddModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		pubTime = DateHelper.toString(new Date(), DATE_FORMAT_DAY);
		return SUCCESS;
	}
	
	private ModelProductEn modelProductEn = new ModelProductEn();
	
	private File fileBigImage;
	private String fileBigImageFileName;
	private File fileSmallImage;
	private String fileSmallImageFileName;
	
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	private String uploadBigImagePath = realPath +"admin/uploadImage/Product/BigImageEn/";
	private String dataBigImagePath = "admin/uploadImage/Product/BigImageEn/";
	private String uploadSmallImagePath = realPath +"admin/uploadImage/Product/SmallImageEn/";
	private String dataSmallImagePath = "admin/uploadImage/Product/SmallImageEn/";
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelProductEnAction(){
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
			modelProductEn.setBigImage(dataBigImagePath+timeFileImageFileName);
		}
		
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			timeFileImageFileName = ImageHelperUtil.getNameFromTime(fileSmallImageFileName);
		}
		if(fileSmallImage!=null&&fileSmallImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileSmallImage.getAbsolutePath());
			FileHelperUtil.writeFile(uploadSmallImagePath,timeFileImageFileName, content);
		}
		if(fileSmallImageFileName!=null&&fileSmallImageFileName.length()>0){
			modelProductEn.setSmallImage(dataSmallImagePath+timeFileImageFileName);
		}
		modelProductEn.setCategoryId(categoryId);
		modelProductEn.setStatus(new Integer(0));
		modelProductEn.setCreator(super.getOnlineUser().getName());
		modelProductEn.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		modelProductEn.setCreateTime(new Date());
		DaoFactory.getModelProductCategoryEnDao().addModelProductEn(modelProductEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 准备修改
	 * @return
	 */
	public String processPrepareUpdateModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProductEn = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(id);
		pubTime = DateHelper.toString(modelProductEn.getPubTime(),DATE_FORMAT_DAY);
		return SUCCESS;
	}
	
	public String processUpdateModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductEn mp = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(id);
		
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
		
		mp.setName(modelProductEn.getName());
		mp.setContent(modelProductEn.getContent());
		mp.setInitPrice(modelProductEn.getInitPrice());
		mp.setNowPrice(modelProductEn.getNowPrice());
		mp.setDiscount(modelProductEn.getDiscount());
		mp.setPubTime(DateHelper.toDate(getPubTime(), DATE_FORMAT_DAY));
		mp.setSequence(modelProductEn.getSequence());
		mp.setRemark(modelProductEn.getRemark());
		mp.setUpdator(super.getOnlineUser().getName());
		mp.setUpdateTime(new Date());
		DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	/**
	 * 审核数据
	 * @return
	 */
	public String processAuditModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductEn mp = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(id);
		mp.setStatus(new Integer(1));
		DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 重审核数据
	 * @return
	 */
	public String processReAuditModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelProductEn mp = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(id);
		mp.setStatus(new Integer(0));
		DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量审核
	 * @return
	 */
	public String processAuditAllModelProductEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductEn mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(1));
				DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(mp);
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
	public String processReAuditAllModelProductEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductEn mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(Integer.valueOf(shenhe[i]));
				mp.setStatus(new Integer(0));
				DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(mp);
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
	public String processDeleteModelProductEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductEn mp = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelProductCategoryEnDao().deleteModelProductEn(mp);
		List list = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnByProductId(id);
		if(list!=null&&list.size()>0){
			for(Iterator i=list.iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelProductHistoryEn mph = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById((Integer)map.get("id"));
				DaoFactory.getModelProductCategoryEnDao().deleteModelProductHistoryEn(mph);
			}
		}
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelProductEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductEn mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelProductCategoryEnDao().deleteModelProductEn(mp);
				List list = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnByProductId(Integer.valueOf(shenhe[i]));
				if(list!=null&&list.size()>0){
					for(Iterator f=list.iterator();f.hasNext();){
						Map map = (Map)f.next();
						ModelProductHistoryEn mph = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById((Integer)map.get("id"));
						DaoFactory.getModelProductCategoryEnDao().deleteModelProductHistoryEn(mph);
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
	private ModelProductHistoryEn modelProductHistoryEn = new ModelProductHistoryEn();
	public String processModelProductHistoryPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnPage(productId,name,status,sequence,pageMaxSize,pageNumber);
		List<ModelProductEn> l = new ArrayList<ModelProductEn>();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator<ModelProductEn> i = p.getList().iterator();i.hasNext();){
				ModelProductEn md = (ModelProductEn) i.next();
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
	public String processQueryModelProductHistoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelProductHistoryEn = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById(id);
		pubTime = DateHelper.toString(modelProductHistoryEn.getPubTime(),DATE_FORMAT_DAY);
		return SUCCESS;
	}
	/**
	 * 删除产品历史
	 * @return
	 */
	public String processDeleteModelProductHistoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelProductHistoryEn mp = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById(id);
		if(mp == null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelProductCategoryEnDao().deleteModelProductHistoryEn(mp);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	
	/**
	 * 批量删除产品历史
	 * @return
	 */
	public String processDeleteAllModelProductHistoryEnAction(){
		String shenheId=ShenHeId.substring(0,ShenHeId.length()-1);
	    String[] shenhe=shenheId.split(",");
	    ModelProductHistoryEn mp=null;
		try {
			if(shenheId==null){
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for(int i=0;i<shenhe.length;i++){
				mp=DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelProductCategoryEnDao().deleteModelProductHistoryEn(mp);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	public String processRecoveryModelProductHistoryEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(productId==null||id==null){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		try{
		modelProductEn = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(productId);
		//历史
		modelProductHistoryEn.setProductId(modelProductEn.getId());
		modelProductHistoryEn.setName(modelProductEn.getName());
		modelProductHistoryEn.setBigImage(modelProductEn.getBigImage());
		modelProductHistoryEn.setSmallImage(modelProductEn.getSmallImage());
		modelProductHistoryEn.setContent(modelProductEn.getContent());
		modelProductHistoryEn.setInitPrice(modelProductEn.getInitPrice());
		modelProductHistoryEn.setNowPrice(modelProductEn.getNowPrice());
		modelProductHistoryEn.setDiscount(modelProductEn.getDiscount());
		modelProductHistoryEn.setPubTime(modelProductEn.getPubTime());
		modelProductHistoryEn.setSequence(modelProductEn.getSequence());
		modelProductHistoryEn.setRemark(modelProductEn.getRemark());
		modelProductHistoryEn.setStatus(modelProductEn.getStatus());
		modelProductHistoryEn.setCreator(modelProductEn.getCreator());
		modelProductHistoryEn.setCreateTime(modelProductEn.getCreateTime());
		modelProductHistoryEn.setUpdateTime(modelProductEn.getUpdateTime());
		modelProductHistoryEn.setUpdator(modelProductEn.getUpdator());
		DaoFactory.getModelProductCategoryEnDao().addModelProductHistoryEn(modelProductHistoryEn);
		//恢复
		modelProductHistoryEn = DaoFactory.getModelProductCategoryEnDao().queryModelProductHistoryEnById(id);
		modelProductEn.setName(modelProductHistoryEn.getName());
		modelProductEn.setBigImage(modelProductHistoryEn.getBigImage());
		modelProductEn.setSmallImage(modelProductHistoryEn.getSmallImage());
		modelProductEn.setContent(modelProductHistoryEn.getContent());
		modelProductEn.setInitPrice(modelProductHistoryEn.getInitPrice());
		modelProductEn.setNowPrice(modelProductHistoryEn.getNowPrice());
		modelProductEn.setDiscount(modelProductHistoryEn.getDiscount());
		modelProductEn.setPubTime(modelProductHistoryEn.getPubTime());
		modelProductEn.setSequence(modelProductHistoryEn.getSequence());
		modelProductEn.setRemark(modelProductHistoryEn.getRemark());
		modelProductEn.setStatus(modelProductHistoryEn.getStatus());
		modelProductEn.setUpdateTime(new Date());
		modelProductEn.setUpdator(super.getOnlineUser().getName());
		modelProductEn.setCreator(modelProductHistoryEn.getCreator());
		modelProductEn.setCreateTime(modelProductHistoryEn.getCreateTime());
		DaoFactory.getModelProductCategoryEnDao().updateModelProductEn(modelProductEn);
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

	 
	public ModelProductCategoryEn getModelProductCategoryEn() {
		return modelProductCategoryEn;
	}

	public void setModelProductCategoryEn(
			ModelProductCategoryEn modelProductCategoryEn) {
		this.modelProductCategoryEn = modelProductCategoryEn;
	}

	public ModelProductEn getModelProductEn() {
		return modelProductEn;
	}

	public void setModelProductEn(ModelProductEn modelProductEn) {
		this.modelProductEn = modelProductEn;
	}

	public ModelProductHistoryEn getModelProductHistoryEn() {
		return modelProductHistoryEn;
	}

	public void setModelProductHistoryEn(ModelProductHistoryEn modelProductHistoryEn) {
		this.modelProductHistoryEn = modelProductHistoryEn;
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
