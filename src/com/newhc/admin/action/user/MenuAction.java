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
import com.newhc.admin.action.user.view.MenuView;
import com.newhc.admin.cache.DictionaryCache;
import com.newhc.admin.common.ErrorCode;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;
import com.newhc.admin.entity.Menu;
import com.newhc.admin.exception.ServiceException;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.Pagination;

public class MenuAction extends JSONPrintAction{
	private static final Log logger = LogFactory.getLog(MenuAction.class);
	private static final long serialVersionUID = 1L;
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private int pageMaxSize=10;
	private int pageNumber=1;
	private String name;
	private String code;
	private Integer type;
	private Integer order;
	
	public String processPageAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.MENU_TYPE);
		Pagination p = DaoFactory.getMenuDao().queryMenuPage(name,code,type,order,pageMaxSize, pageNumber);
		List l = new ArrayList();
		if(p!=null&&p.getTotalCount()>0){
			for(Iterator it = p.getList().iterator();it.hasNext();){
				Map map = (Map)it.next();
				MenuView mv = new MenuView();
				mv.setId((Integer)NumbericHelper.getIntValue(map.get("id"),0));
				mv.setName((String)map.get("name"));
				mv.setCode((String)map.get("code"));
				mv.setType((Integer)NumbericHelper.getIntValue(map.get("type"), -1));
				mv.setSequence((Integer)NumbericHelper.getIntValue(map.get("sequence"), -1));
				mv.setDescription((String)map.get("description"));
				mv.setCreateTime(DateHelper.toString(DateHelper.toDate((Timestamp)map.get("create_time")),DATE_FORMAT));
				mv.setCreator((String)map.get("creator"));
				l.add(mv);
			}
		}
		super.setRequestAttribute("pages", new Pagination(p.getTotalCount(),pageMaxSize,pageNumber,l));
		super.setRequestAttribute("typeList", typeList);
		return SUCCESS;
	}
	
	public String processPrepareAddAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.MENU_TYPE);
		super.setRequestAttribute("typeList", typeList);
		return SUCCESS;
	}
	
	private Menu menu = new Menu();
	private Integer sequence;
	private String description;
	public String processAddAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		if(StringHelper.isEmpty(name)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		if(StringHelper.isEmpty(code)){
			super.setActionResponse(RESPONSE_FAILURE);
			return INPUT;
		}
		menu.setName(name);
		menu.setCode(code);
		menu.setType(type);
		menu.setSequence(sequence);
		menu.setCreator(super.getOnlineUser().getName());
		menu.setCreateTime(new Date());
		menu.setDescription(description);
		DaoFactory.getMenuDao().addMenu(menu);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	private Integer id;
	public String processPrepareUpdateAction(){
		List typeList = DictionaryCache.getValuesListByParentCode(Dictionary.MENU_TYPE);
		super.setRequestAttribute("typeList", typeList);
		menu = DaoFactory.getMenuDao().loadMenuById(id);
		return SUCCESS;
	}
	
	public String processUpdateAction(){
		Integer userId = super.getOnlineUserId();
		if(userId==null) throw new ServiceException(ErrorCode.INVALID_REQUEST);
		
		Menu m = DaoFactory.getMenuDao().loadMenuById(id);
		m.setName(menu.getName());
		m.setCode(menu.getCode());
		m.setType(menu.getType());
		m.setSequence(menu.getSequence());
		m.setDescription(menu.getDescription());
		DaoFactory.getMenuDao().updateMenu(m);
		super.setActionResponse(RESPONSE_SUCCESS);
		return SUCCESS;
	}
	
	public String processDeleteAction(){
		try{
			menu = DaoFactory.getMenuDao().loadMenuById(id);
			if(menu==null){
				super.setActionResponse(RESPONSE_FAILURE);
				return INPUT;
			}else{
				DaoFactory.getMenuDao().deleteMenu(menu);
				DaoFactory.getAdminUserMenuDao().deleteAdminUserMenuByMenuId(id);
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

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
