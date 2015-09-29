package com.newhc.admin.action.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.MD5Helper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.view.AdminUserView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.AdminUser;
import com.newhc.admin.entity.AdminUserLog;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.exception.ServiceException;
import com.newhc.admin.helper.ErrorMessageHelper;
import com.newhc.admin.online.OnlineManager;
import com.newhc.admin.online.OnlineUser;
import com.opensymphony.webwork.ServletActionContext;

public class AdminUserAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(AdminUserAction.class);
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private String username;
	private String password;
	private String rand;
	/**
	 * 登陆
	 * @return
	 */
	public String processLoginAction(){
		logger.info("username="+getUsername()+",password="+getPassword()+",code="+getRand());
		String randImage = (String)ServletActionContext.getContext().getSession().get("rand");
		try{
			//判断输入的验证码是否填写正确
			if(!getRand().equals(randImage)){
				throw new ServiceException(ErrorCode.VALIDATE_CODE_NOT_MATCH);
			}
			if(StringHelper.isEmpty(username)||StringHelper.isEmpty(password)) throw new ServiceException(ErrorCode.USERNAME_OR_PASSWORD_IS_NULL);
			password = MD5Helper.encode(password);
			List adminList = DaoFactory.getAdminUserDao().queryAdminList(username, password);
			if(adminList!=null&&adminList.size()>0){
				OnlineManager manager = super.getOnlineManager();
				OnlineUser onlineUser = new OnlineUser();
				//登录成功  写cookie
				Integer id = (Integer)((Map)adminList.get(0)).get("id");
				String userName = (String)((Map)adminList.get(0)).get("username");
				onlineUser.setId(id);
				onlineUser.setUsername(userName);
				onlineUser.setName((String)((Map)adminList.get(0)).get("name"));
				onlineUser.setType((Integer)((Map)adminList.get(0)).get("type"));
				onlineUser.setSignInTime(new Date(System.currentTimeMillis()));
				manager.signIn(onlineUser);
				//登陆操作日志
				List roleList = DaoFactory.getRoleDao().queryRoleIdByCode("/admin/adminLogin.do");
				if(roleList!=null&&roleList.size()>0){
					AdminUserLog adminUserLog = new AdminUserLog();
					adminUserLog.setUserId(id);
					Integer roleId = new Integer(NumbericHelper.getIntValue(((Map)roleList.get(0)).get("id"),0));
					adminUserLog.setRoleId(roleId);
					adminUserLog.setCreator(userName);
					adminUserLog.setCreateTime(new Date());
					DaoFactory.getAdminUserLogDao().addAdminUserLogDao(adminUserLog);
				}
				return SUCCESS;
			}else{
				throw new ServiceException(ErrorCode.USERNAME_OR_PASSWORD_IS_FALSE);
			}
		}catch(ServiceException se){
			logger.error("ERROR:ServiceException-->"+se.getMessage());
			super.setActionResponse(RESPONSE_FAILURE, ErrorMessageHelper.getMessage(se.getMessage()));
			return ERROR;
		}
	}
	 
	
	/**
	 * 退出登陆
	 * @return
	 */
	public String processLoginOutAction(){
		try{			
			OnlineManager manager = super.getOnlineManager();
			//更新登录历史
			if(manager.isSignIn()){
				//退出登陆操作日志
				List roleList = DaoFactory.getRoleDao().queryRoleIdByCode("/admin/adminLoginOut.do");
				if(roleList!=null&&roleList.size()>0){
					AdminUserLog adminUserLog = new AdminUserLog();
					adminUserLog.setUserId(super.getOnlineUserId());
					Integer roleId = new Integer(NumbericHelper.getIntValue(((Map)roleList.get(0)).get("id"),0));
					adminUserLog.setRoleId(roleId);
					adminUserLog.setCreator(super.getOnlineUser().getUsername());
					adminUserLog.setCreateTime(new Date());
					DaoFactory.getAdminUserLogDao().addAdminUserLogDao(adminUserLog);
				}
				//清除COOKIE
				manager.signOut();
			}
		}catch(ServiceException se){
			
		}
		return SUCCESS;			
	}
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String name;
	private Integer type;
	private Integer status;
	/**
	 * 用户管理
	 * @return
	 */
	public String processPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADMIN_USER_TYPE);
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.ADMIN_USER_STATUS);
		Pagination p = DaoFactory.getAdminUserDao().queryAdminPage(name,type,status,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator it = p.getList().iterator();it.hasNext();){
				Map map = (Map)it.next();
				AdminUserView auv = new AdminUserView();
				auv.setId((Integer)NumbericHelper.getIntValue(map.get("id"),0));
				auv.setUserName((String)map.get("username"));
				auv.setName((String)map.get("name"));
				auv.setType((Integer)NumbericHelper.getIntValue(map.get("type"), -1));
				auv.setStatus((Integer)NumbericHelper.getIntValue(map.get("status"), -1));
				auv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				auv.setCreator((String)map.get("creator"));
				l.add(auv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("typeList", typeList);
		super.setRequestAttribute("statusList", statusList);
		return SUCCESS;
	}
	
	public String processPrepareAddAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADMIN_USER_TYPE);
		super.setRequestAttribute("typeList", typeList);
		return SUCCESS;
	}
	
	private AdminUser adminUser = new AdminUser();
	private String userName;
	private String description;
	/**
	 * 新增用户
	 * @return
	 */
	
	public String processAddAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		if(StringHelper.isEmpty(userName)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		if(StringHelper.isEmpty(name)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		adminUser.setUserName(userName);
		adminUser.setPassword(MD5Helper.encode("888888"));//默认密码：888888
		adminUser.setName(name);
		adminUser.setType(type);
		adminUser.setStatus(new Integer(0));//0:正常
		adminUser.setCreateTime(new Date());
		adminUser.setCreator(super.getOnlineUser().getName());
		adminUser.setDescription(description);
		DaoFactory.getAdminUserDao().addAdminUser(adminUser);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	public String processPrepareUpdateStatusAction(){
		List statusList = DictionaryCache.getValuesListByParentCode(Dictionary.ADMIN_USER_STATUS);
		super.setRequestAttribute("statusList", statusList);
		adminUser = DaoFactory.getAdminUserDao().loadAdminUser(id);
		return SUCCESS;
	}
	
	/**
	 * 修改用户状态 
	 * @return
	 */
	public String processUpdateStatusAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		AdminUser au = DaoFactory.getAdminUserDao().loadAdminUser(id);
		au.setStatus(adminUser.getStatus());
		au.setUpdator(super.getOnlineUser().getName());
		au.setUpdateTime(new Date());
		DaoFactory.getAdminUserDao().updateAdminUserStatus(au);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processPrepareUpdateAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ADMIN_USER_TYPE);
		super.setRequestAttribute("typeList", typeList);
		adminUser = DaoFactory.getAdminUserDao().loadAdminUser(id);
		return SUCCESS;
	}
	
	/**
	 * 修改用户信息
	 * @return
	 */
	public String processUpdateAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		AdminUser au = DaoFactory.getAdminUserDao().loadAdminUser(id);
		au.setName(adminUser.getName());
		au.setType(adminUser.getType());
		au.setDescription(adminUser.getDescription());
		au.setUpdator(super.getOnlineUser().getName());
		au.setUpdateTime(new Date());
		DaoFactory.getAdminUserDao().updateAdminUserStatus(au);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processPrepareUpdatePasswordAction(){
		adminUser = DaoFactory.getAdminUserDao().loadAdminUser(id);
		return SUCCESS;
	}
	
	/**
	 * 修改用户密码
	 * @return
	 */
	public String processUpdatePasswordAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		AdminUser au = DaoFactory.getAdminUserDao().loadAdminUser(id);
		au.setPassword(MD5Helper.encode(password));
		au.setUpdator(super.getOnlineUser().getName());
		au.setUpdateTime(new Date());
		DaoFactory.getAdminUserDao().updateAdminUserStatus(au);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processDeleteAction(){
		try{
			adminUser = DaoFactory.getAdminUserDao().loadAdminUser(id);
			if(adminUser==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getAdminUserDao().deleteAdminUser(adminUser);
				DaoFactory.getAdminUserMenuDao().deleteAdminUserMenuByUserId(id);
				DaoFactory.getAdminUserGroupDao().deleteAdminUserGroupByUserId(id);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
