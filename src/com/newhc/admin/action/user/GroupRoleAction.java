package com.newhc.admin.action.user;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.GroupRole;
import com.newhc.admin.exception.ServiceException;

public class GroupRoleAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(GroupRoleAction.class);
	private static final long serialVersionUID = 1L;
	
	private Integer groupId;
	private Integer userId;
	
	private Integer typeCh = new Integer(1);
	private Integer typeEn = new Integer(2);
	private Integer typeJp = new Integer(3);
	
	public String processListAction(){
		if(groupId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List roleChList = DaoFactory.getRoleDao().queryRoleList(typeCh);
		List roleEnList = DaoFactory.getRoleDao().queryRoleList(typeEn);
		List roleJpList = DaoFactory.getRoleDao().queryRoleList(typeJp);
		List groupRoleList = DaoFactory.getGroupRoleDao().queryGroupRoleBy(groupId);
		super.setRequestAttribute("roleChList", roleChList);
		super.setRequestAttribute("roleEnList", roleEnList);
		super.setRequestAttribute("roleJpList", roleJpList);
		super.setRequestAttribute("groupRoleList", groupRoleList);
		return SUCCESS;
	}
	
	private String roleGroup;
	public String processUpdateAction(){
		try{
			if(groupId==null||roleGroup==null||roleGroup.length()==0){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				String[] roleGroups = roleGroup.split(",");
				if(roleGroups!=null&&roleGroups.length>0){
					DaoFactory.getGroupRoleDao().deleteGroupRole(groupId);
					GroupRole gr = new GroupRole();
					for(int i=0;i<roleGroups.length;i++){
						gr.setGroupId(groupId);
						gr.setRoleId(new Integer(roleGroups[i]));
						gr.setCreator(super.getOnlineUser().getName());
						gr.setCreateTime(new Date());
						DaoFactory.getGroupRoleDao().addGroupRole(gr);
					}
				}
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return SUCCESS;
	}

	public String getRoleGroup() {
		return roleGroup;
	}

	public void setRoleGroup(String roleGroup) {
		this.roleGroup = roleGroup;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
