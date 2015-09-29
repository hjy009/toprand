package com.newhc.admin.action.user.en;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.en.ModelApplyforEnView;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelApplyfor;
import com.newhc.admin.entity.en.ModelApplyforEn;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.FileHelperUtil;

public class ModelApplyforEnAction extends JSONPrintAction{
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsEnAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	
	private Integer pageMaxSize=10;
	private Integer pageNumber=1;
	private String name;
	private Integer id;
	private ModelApplyforEn  modelApplyforEn = new ModelApplyforEn();
	
	private String ShenHeId;
	
	
	public String processModelApplyforPageEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		Pagination pi = DaoFactory.getModelApplyforEnDao().queryModelApplyforEn(name, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(pi!=null&&pi.getTotalCount()>0){
			for(Iterator i = pi.getList().iterator();i.hasNext();){
				Map map = (Map)i.next();
				ModelApplyforEnView mav = new ModelApplyforEnView();
				mav.setId((Integer)map.get("id"));
				mav.setName((String)map.get("name"));
				mav.setAppliedPosition((String)map.get("applied_position"));
				mav.setMemberEnterprises((String)map.get("member_enterprises"));
				mav.setWorkExperience((String)map.get("work_experience"));
				String tablePath = (String) map.get("table_path");
				if (tablePath != null && tablePath.length() > 0) {
					int k = tablePath.lastIndexOf("/");
					mav.setTablePath(tablePath.substring(k + 1, tablePath.length()));
				}
				l.add(mav);
			}
		}
		super.setRequestAttribute("pages", new Pagination(pi.getTotalCount(),pageMaxSize,pageNumber,l));
		return SUCCESS;
	}
	/**
	 * 查看应聘
	 * @return
	 */
	public String processQueryModelApplyforEnAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_SUCCESS);
		modelApplyforEn = DaoFactory.getModelApplyforEnDao().queryModelApplyforEnId(id);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String processDeleteModelApplyforEnAction(){
		Integer userId = super.getOnlineUserId();
		if (userId == null)
			throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if (id == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		ModelApplyforEn ma = DaoFactory.getModelApplyforEnDao().queryModelApplyforEnId(id);
		if (ma == null) {
			super.setActionResponse(RESPONSE_FAILURE);
		}
		DaoFactory.getModelApplyforEnDao().deleteModelApplyforEn(ma);
		super.setActionResponse(RESPONSE_SUCCESS);
		return execJSONReponseAction();
	}
	/**
	 * 批量删除
	 * @return
	 */
	public String processDeleteAllModelApplyforEnAction() {
		String shenheId = ShenHeId.substring(0, ShenHeId.length() - 1);
		String[] shenhe = shenheId.split(",");
		ModelApplyforEn ma = null;
		try {
			if (shenheId == null) {
				super.setActionResponse(RESPONSE_FAILURE);
			}
			for (int i = 0; i < shenhe.length; i++) {
				ma = DaoFactory.getModelApplyforEnDao().queryModelApplyforEnId(Integer.valueOf(shenhe[i]));
				DaoFactory.getModelApplyforEnDao().deleteModelApplyforEn(ma);
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
	 */
	
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	
	public String processDownloadFiles(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		if(id==null) super.setActionResponse(RESPONSE_FAILURE);
		ModelApplyforEn ma = DaoFactory.getModelApplyforEnDao().queryModelApplyforEnId(id);
		String path=realPath+ma.getTablePath();
		String fileName=ma.getTablePath();
		FileHelperUtil.downLoadFile(path, fileName,17);
		return null;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public ModelApplyforEn getModelApplyforEn() {
		return modelApplyforEn;
	}
	public void setModelApplyforEn(ModelApplyforEn modelApplyforEn) {
		this.modelApplyforEn = modelApplyforEn;
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
	public String getShenHeId() {
		return ShenHeId;
	}
	public void setShenHeId(String shenHeId) {
		ShenHeId = shenHeId;
	}
	
}
