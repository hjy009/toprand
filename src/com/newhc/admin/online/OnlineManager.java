package com.newhc.admin.online;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newhc.admin.dao.DaoFactory;

import cn.com.netmovie.helper.HTTPHelper;
import cn.com.netmovie.helper.StringHelper;

/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-2-16
 */
public class OnlineManager {
	private HttpServletRequest request = null;
	private HttpServletResponse response = null;
	public OnlineManager(HttpServletRequest request,HttpServletResponse response){
		this.request = request;
		this.response = response;
	}
	/**
	 * 写cookie信息，浏览器关闭前有效
	 * @param name String : cookie名称
	 * @param value String : cookie值
	 */
	public void addCookie(String name,String value){
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(-1);//设置COOKIE时间,-1为关闭浏览器前有效
//		cookie.setDomain(ClientEnvironment.DOMAIN_NAME);
		cookie.setPath("/");
		this.response.addCookie(cookie);
	}	
	/**
	 * 清除cookie信息
	 * @param name String : 待清除的cookie名称
	 */
	public void removeCookie(String name){
		//清除COOKIE
		Cookie cookie = new Cookie(name,"");
		cookie.setDomain(ClientEnvironment.DOMAIN_NAME);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		this.response.addCookie(cookie);			
	}

	public void signIn(OnlineUser onlineUser){
		if(onlineUser == null) return ;
		String value = OnlineUser.encode(onlineUser);
		addCookie(ClientEnvironment.ONLINE_COOKIE_NAME,value);
	}
	public OnlineUser getOnlineUser(){
		Cookie cookie = HTTPHelper.getCookie(this.request, ClientEnvironment.ONLINE_COOKIE_NAME);
		String value = (cookie == null)?null:cookie.getValue();
		if(StringHelper.isEmpty(value)) return null;
		return OnlineUser.decode(value);
	}
	
	public boolean isSignIn(){
		return !(getOnlineUser() == null);
	}
	public void signOut(){
		removeCookie(ClientEnvironment.ONLINE_COOKIE_NAME);		
	}
	
	public boolean hasPermission(String pageURI){
		if(!isSignIn()) return false;
		
		if(getOnlineUser().getType().intValue()==1) return true;
		
		List roleList = DaoFactory.getGroupRoleDao().queryGroupRoleList(getOnlineUser().getId());
		if(roleList!=null&&roleList.size()>0){
			for(int i=0;i<roleList.size();i++){
				Map map = (Map)roleList.get(i);
				String code = (String)map.get("code");
				if(code.equalsIgnoreCase(pageURI)){
					return true;
				}
			}
		}else{
			return false;
		}
		return false;
	}
}
