package com.newhc.admin.action.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.BaseAction;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AdminUserMenu;
import com.newhc.admin.exception.ServiceException;

public class AdminUserMenuAction extends BaseAction{
	private static final Log logger = LogFactory.getLog(AdminUserMenuAction.class);
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	private Integer typeCh = new Integer(1);
	private Integer typeEn = new Integer(2);
	private Integer typeJp = new Integer(3);
	
	public String processListAction(){
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List menuChList = DaoFactory.getMenuDao().queryMenuList(typeCh);
		List menuEnList = DaoFactory.getMenuDao().queryMenuList(typeEn);
		List menuJpList = DaoFactory.getMenuDao().queryMenuList(typeJp);
		List userMenuList = DaoFactory.getAdminUserMenuDao().queryAdminUserMenuBy(userId);
		super.setRequestAttribute("menuChList", menuChList);
		super.setRequestAttribute("menuEnList", menuEnList);
		super.setRequestAttribute("menuJpList", menuJpList);
		super.setRequestAttribute("userMenuList", userMenuList);
		return SUCCESS;
	}
	
	private String menuGroup;
	public String processUpdateAction(){
		try{
			if(userId==null||menuGroup==null||menuGroup.length()==0){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				String[] menuGroups = menuGroup.split(",");
				if(menuGroups!=null&&menuGroups.length>0){
					DaoFactory.getAdminUserMenuDao().deleteAdminUserMenu(userId);
					AdminUserMenu aum = new AdminUserMenu();
					for(int i=0;i<menuGroups.length;i++){
						aum.setUserId(userId);
						aum.setMenuId(new Integer(menuGroups[i]));
						aum.setCreator(super.getOnlineUser().getName());
						aum.setCreateTime(new Date());
						DaoFactory.getAdminUserMenuDao().addAdminUserMenu(aum);
					}
				}
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return SUCCESS;
	}
	
	public String processMenuListAction(){
		userId = super.getOnlineUser().getId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		Integer type = super.getOnlineUser().getType();
		List menuChList = new ArrayList();
		List menuEnList = new ArrayList();
		List menuJpList = new ArrayList();
		if(type.intValue()==1){
			menuChList = DaoFactory.getMenuDao().queryMenuList(typeCh);
			menuEnList = DaoFactory.getMenuDao().queryMenuList(typeEn);
			menuJpList = DaoFactory.getMenuDao().queryMenuList(typeJp);
		}else{
			menuChList = DaoFactory.getAdminUserMenuDao().queryAdminUserMenuBy(userId,typeCh);
			menuEnList = DaoFactory.getAdminUserMenuDao().queryAdminUserMenuBy(userId,typeEn);
			menuJpList = DaoFactory.getAdminUserMenuDao().queryAdminUserMenuBy(userId,typeJp);
		}
		super.setRequestAttribute("menuChList", menuChList);
		super.setRequestAttribute("menuEnList", menuEnList);
		super.setRequestAttribute("menuJpList", menuJpList);
		return SUCCESS;
	}
	
	public String processMenuIntorListAction(){
		userId = super.getOnlineUser().getId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		Integer type = super.getOnlineUser().getType();
		List menuChList = new ArrayList();
		List menuEnList = new ArrayList();
		if(type.intValue()==1){
			menuChList = DaoFactory.getMenuDao().queryMenuList(typeCh);
			menuEnList = DaoFactory.getMenuDao().queryMenuList(typeEn);
		}else{
			menuChList = DaoFactory.getAdminUserMenuDao().queryAdminUserMenuBy(userId,typeCh);
		}
		super.setRequestAttribute("menuChList", menuChList);
		super.setRequestAttribute("menuEnList", menuEnList);
		return SUCCESS;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getMenuGroup() {
		return menuGroup;
	}

	public void setMenuGroup(String menuGroup) {
		this.menuGroup = menuGroup;
	}
}
