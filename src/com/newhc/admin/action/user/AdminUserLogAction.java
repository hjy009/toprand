package com.newhc.admin.action.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.action.BaseAction;
import com.newhc.admin.action.user.view.AdminUserLogView;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.exception.ServiceException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

public class AdminUserLogAction extends BaseAction{
	private static final Log logger = LogFactory.getLog(AdminUserLogAction.class);
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String username;
	private String name;
	private String roleName;
	
	public String processPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		Pagination p = DaoFactory.getAdminUserLogDao().queryAdminUserLogPage(username,name,roleName,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator it = p.getList().iterator();it.hasNext();){
				Map map = (Map)it.next();
				AdminUserLogView view = new AdminUserLogView();
				view.setId((Integer)NumbericHelper.getIntValue(map.get("id"),0));
				view.setUserName((String)map.get("username"));
				view.setName((String)map.get("name"));
				view.setRoleName((String)map.get("roleName"));
				view.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(view);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		return SUCCESS;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
