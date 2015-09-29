package com.newhc.admin.action.user;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AdminUserGroup;
import com.newhc.admin.exception.ServiceException;

public class AdminUserGroupAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(AdminUserGroupAction.class);
	private static final long serialVersionUID = 1L;
	
	private Integer uId;
	private Integer groupId;
	
	private AdminUserGroup adminUserGroup = new AdminUserGroup();
	public String processUpdateAction(){
		try{
			if(uId==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getAdminUserGroupDao().deleteAdminUserGroup(uId);
				adminUserGroup.setUserId(uId);
				adminUserGroup.setGroupId(groupId);
				adminUserGroup.setCreateTime(new Date());
				adminUserGroup.setCreator(super.getOnlineUser().getName());
				DaoFactory.getAdminUserGroupDao().addAdminUserGroup(adminUserGroup);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return SUCCESS;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public AdminUserGroup getAdminUserGroup() {
		return adminUserGroup;
	}
	public void setAdminUserGroup(AdminUserGroup adminUserGroup) {
		this.adminUserGroup = adminUserGroup;
	}
	public Integer getUId() {
		return uId;
	}
	public void setUId(Integer id) {
		uId = id;
	}
}
