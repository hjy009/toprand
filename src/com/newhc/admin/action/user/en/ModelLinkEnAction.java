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
import com.newhc.admin.action.user.view.en.ModelLinkEnView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.ModelLink;
import com.newhc.admin.entity.en.ModelLinkEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;
import com.newhc.admin.helper.NewStringHelper;

public class ModelLinkEnAction extends JSONPrintAction {
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelLinkEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer pageMaxSize = 10;
	private Integer pageNumber = 1;
	private Integer id;
	private String name;
	private String logo;
	private Integer status;
	private Integer sequence;
	private ModelLinkEn modelLinkEn = new ModelLinkEn();
	private File fileImage;
	private String fileImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath + "admin/uploadImage/ModelLinkEn/";
	private String dataImagePath = "admin/uploadImage/ModelLinkEn/";
	
	public String processModelLinkPageEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		List statusList = DictionaryCache
				.getValuesListByParentCode(Dictionary.AUDIT_STATUS);
		Pagination p = DaoFactory.getModelLinkEnDao().queryModelLinkEnPage(name,
				logo, status, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if (p != null && p.getTotalCount() > 0) {
			for (Iterator i = p.getList().iterator(); i.hasNext();) {
				Map map = (Map) i.next();
				ModelLinkEnView lv = new ModelLinkEnView();
				lv.setId(NumbericHelper
						.getIntValue((Integer) map.get("id"), -1));
				String content = (String) map.get("link");
				lv.setLink(NewStringHelper.truncate(content, 20, "..."));
				lv.setName(NewStringHelper.truncate((String) map.get("name"),
						20, "..."));
				String logo = (String) map.get("logo");
				if (logo != null && logo.length() > 0) {
					int k = logo.lastIndexOf("/");
					lv.setLogo(logo.substring(k + 1, logo.length()));
				}
				lv.setStatus(NumbericHelper.getIntValue((Integer) map
						.get("status"), -1));
				lv.setSequence(NumbericHelper.getIntValue((Integer) map
						.get("sequence"), 0));
				lv.setCreator((String) map.get("creator"));
				lv.setCreateTime(DateHelper.toString(DateHelper
						.toDate((Timestamp) map.get("create_time")),
						DATE_FORMAT));
				l.add(lv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),
				pageMaxSize, pageNumber, l));
		super.setRequestAttribute("status", statusList);
		return SUCCESS;
	}
	/**
	 * 准备新增
	 * @return
	 */
	public String processPrepareAddModelLinkEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		return SUCCESS;
	}
	/**
	 * 新增
	 * @return
	 */
	public String processAddModelLinkEnAction() {
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
			modelLinkEn.setLogo(dataImagePath + timeFileImageFileName);
		}
		modelLinkEn.setStatus(new Integer(0));
		modelLinkEn.setCreator(super.getOnlineUser().getName());
		modelLinkEn.setCreateTime(new Date());
		DaoFactory.getModelLinkEnDao().addModelLinkEn(modelLinkEn);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}

	/**
	 * 审核数据
	 * 
	 * @return
	 */
	public String processAuditModelLinkEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelLinkEn ml = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(id);
		ml.setStatus(new Integer(1));
		DaoFactory.getModelLinkEnDao().updateModelLinkEn(ml);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}

	/**
	 * 重审核数据
	 * 
	 * @return
	 */
	public String processReAuditModelLinkEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		ModelLinkEn ml = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(id);
		ml.setStatus(new Integer(0));
		DaoFactory.getModelLinkEnDao().updateModelLinkEn(ml);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}

	/**
	 * 删除数据
	 * 
	 * @return
	 */
	public String processDeleteModelLinkEnAction() {
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelLinkEn ml = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(id);
		if (ml == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelLinkEnDao().deleteModelLinkEn(ml);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}

	private String ShenHeId;

	/**
	 * 批量审核
	 * 
	 * @return
	 */
	public String processUpdateAllModelLinkEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelLinkEn hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(1));
				DaoFactory.getModelLinkEnDao().updateModelLinkEn(hs);
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
	public String processReUpdateAllModelLinkEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelLinkEn hs = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				hs = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(
						Integer.valueOf(shenhe[i]));
				hs.setStatus(new Integer(0));
				DaoFactory.getModelLinkEnDao().updateModelLinkEn(hs);
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
	public String processDeleteAllModelLinkEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelLinkEn l = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				l = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(
						Integer.valueOf(shenhe[i]));
				DaoFactory.getModelLinkEnDao().deleteModelLinkEn(l);
			}
			super.setActionResponse(RESPONSE_SUCCESS);
		} catch (SecurityException e) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}

	/**
	 * 准备修改
	 * 
	 * @return
	 */
	public String processPrepareUpdateModelLinkEnAction() {
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		modelLinkEn = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(id);
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String processUpdateModelLinkEnAction() {
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelLinkEn ml = DaoFactory.getModelLinkEnDao().queryModelLinkEnById(id);
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
			ml.setLogo(dataImagePath + timeFileImageFileName);
		}
		ml.setLink(modelLinkEn.getLink());
		ml.setName(modelLinkEn.getName());
		ml.setSequence(modelLinkEn.getSequence());
		ml.setUpdator(super.getOnlineUser().getName());
		ml.setUpdateTime(new Date());
		DaoFactory.getModelLinkEnDao().updateModelLinkEn(ml);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	 
	public ModelLinkEn getModelLinkEn() {
		return modelLinkEn;
	}
	public void setModelLinkEn(ModelLinkEn modelLinkEn) {
		this.modelLinkEn = modelLinkEn;
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

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUploadImagePath() {
		return uploadImagePath;
	}

	public void setUploadImagePath(String uploadImagePath) {
		this.uploadImagePath = uploadImagePath;
	}
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}

}
