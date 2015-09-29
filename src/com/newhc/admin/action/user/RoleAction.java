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
import com.newhc.admin.action.user.view.RoleView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.Role;
import com.newhc.admin.exception.ServiceException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.Pagination;

public class RoleAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(RoleAction.class);
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String code;
	private String name;
	private Integer type;
	private Integer order;
	private Integer sequence;
	private String description;
	
	public String processPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ROLE_TYPE);
		Pagination p = DaoFactory.getRoleDao().queryRolePage(code, name, type,order,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator it = p.getList().iterator();it.hasNext(); ){
				Map map = (Map)it.next();
				RoleView rv = new RoleView();
				rv.setId((Integer)NumbericHelper.getIntValue(map.get("id"), 0));
				rv.setCode((String)map.get("code"));
				rv.setName((String)map.get("name"));
				rv.setType(NumbericHelper.getIntValue(map.get("type"), 0));
				rv.setSequence(NumbericHelper.getIntValue(map.get("sequence"), 0));
				rv.setCreator((String)map.get("creator"));
				rv.setDescription((String)map.get("description"));
				rv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				l.add(rv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("typeList", typeList);
		return SUCCESS;
	}
	
	public String processPrepareAddAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ROLE_TYPE);
		super.setRequestAttribute("typeList", typeList);
		return SUCCESS;
	}
	
	private Role role = new Role();
	public String processAddAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		if(StringHelper.isEmpty(code)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		if(StringHelper.isEmpty(name)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		role.setName(name);
		role.setCode(code);
		role.setType(type);
		role.setSequence(sequence);
		role.setCreator(super.getOnlineUser().getName());
		role.setCreateTime(new Date());
		role.setDescription(description);
		DaoFactory.getRoleDao().addRole(role);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	public String processPrepareUpdateAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.ROLE_TYPE);
		super.setRequestAttribute("typeList", typeList);
		role = DaoFactory.getRoleDao().loadRoleById(id);
		return SUCCESS;
	}
	
	public String processUpdateAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		Role r = DaoFactory.getRoleDao().loadRoleById(id);
		r.setName(role.getName());
		r.setCode(role.getCode());
		r.setType(role.getType());
		r.setSequence(role.getSequence());
		r.setDescription(role.getDescription());
		r.setUpdator(super.getOnlineUser().getName());
		r.setUpdateTime(new Date());
		DaoFactory.getRoleDao().updateRole(r);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processDeleteAction(){
		try{
			role = DaoFactory.getRoleDao().loadRoleById(id);
			if(role==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getRoleDao().deleteRole(role);
				DaoFactory.getGroupRoleDao().deleteGroupRoleByRoleId(id);
				super.setActionResponse(RESPONSE_SUCCESS);
			}
		}catch(ServiceException se){
			super.setActionResponse(RESPONSE_FAILURE);
		}
		return execJSONReponseAction();
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
}
