package com.newhc.admin.action.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.AdminGroupView;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AdminGroup;
import com.newhc.admin.exception.ServiceException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.Pagination;

public class AdminGroupAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(AdminGroupAction.class);
	private static final long serialVersionUID = 1L;
	
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String name;
	private String remark;
	
	public String processPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		Pagination p = DaoFactory.getAdminGroupDao().queryAdminGroupPage(name, pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator it = p.getList().iterator();it.hasNext(); ){
				Map map = (Map)it.next();
				AdminGroupView agv = new AdminGroupView();
				agv.setId((Integer)NumbericHelper.getIntValue(map.get("id"), 0));
				agv.setName((String)map.get("name"));
				agv.setRemark((String)map.get("remark"));
				agv.setCreator((String)map.get("creator"));
				agv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(agv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		return SUCCESS;
	}
	
	public String processPrepareAddAction(){
		return SUCCESS;
	}
	
	private AdminGroup adminGroup = new AdminGroup();
	public String processAddAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		if(StringHelper.isEmpty(name)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		adminGroup.setName(name);
		adminGroup.setRemark(remark);
		adminGroup.setCreator(super.getOnlineUser().getName());
		adminGroup.setCreateTime(new Date());
		DaoFactory.getAdminGroupDao().addAdminGroup(adminGroup);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	public String processPrepareUpdateAction(){
		adminGroup = DaoFactory.getAdminGroupDao().loadAdminGroupById(id);
		return SUCCESS;
	}
	
	public String processUpdateAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		AdminGroup ag = DaoFactory.getAdminGroupDao().loadAdminGroupById(id);
		ag.setName(adminGroup.getName());
		ag.setRemark(adminGroup.getRemark());
		DaoFactory.getAdminGroupDao().updateAdminGroup(ag);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processDeleteAction(){
		try{
			adminGroup = DaoFactory.getAdminGroupDao().loadAdminGroupById(id);
			if(adminGroup==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getAdminGroupDao().deleteAdminGroup(adminGroup);
				DaoFactory.getGroupRoleDao().deleteGroupRoleByGroupId(id);
				DaoFactory.getAdminUserGroupDao().deleteAdminUserGroupByGroupId(id);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	private Integer uId;
	public String processListAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List groupList = DaoFactory.getAdminGroupDao().queryAdminGroupList();
		List userGroupList = DaoFactory.getAdminUserGroupDao().queryAdminUserGroupBy(uId);
		super.setRequestAttribute("groupList", groupList);
		super.setRequestAttribute("userGroupList", userGroupList);
		return SUCCESS;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AdminGroup getAdminGroup() {
		return adminGroup;
	}

	public void setAdminGroup(AdminGroup adminGroup) {
		this.adminGroup = adminGroup;
	}

	public int getPageMaxSize() {
		return pageMaxSize;
	}

	public void setPageMaxSize(int pageMaxSize) {
		this.pageMaxSize = pageMaxSize;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUId() {
		return uId;
	}

	public void setUId(Integer id) {
		uId = id;
	}
}
