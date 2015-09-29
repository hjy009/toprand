package com.newhc.admin.action;

import cn.com.netmovie.webwork.WebworkActionSupport;

import com.newhc.admin.online.OnlineManager;
import com.newhc.admin.online.OnlineUser;
import com.opensymphony.webwork.ServletActionContext;

public class BaseAction extends WebworkActionSupport{
	private static final long serialVersionUID = 1L;
	/**
	 * 获取登录信息管理器
	 * @return OnlineManager : 
	 */
	public OnlineManager getOnlineManager(){		
		return new OnlineManager(ServletActionContext.getRequest(),ServletActionContext.getResponse());
	}
	
	public OnlineUser getOnlineUser(){
		if(getOnlineManager()!=null)return getOnlineManager().getOnlineUser();
		return null;
	}
	
	/**
	 * 通过request.attribute来传递对象
	 * @param name String : 
	 * @param value Object : 
	 */
	public void setRequestAttribute(String name,Object value){
		ServletActionContext.getRequest().setAttribute(name, value);		
	}
	
	/**
	 * 修改型的Action的响应状态和响应信息
	 */
	public static Integer RESPONSE_SUCCESS = new Integer(1);//成功
	public static Integer RESPONSE_FAILURE = new Integer(2);//失败
	public static Integer RESPONSE_NONE = new Integer(0);//默认
	private Integer responseStatus = RESPONSE_NONE;
	private String responseMessage = "";
	public void setActionResponse(Integer responseStatus,String responseMessage){
		this.responseStatus = responseStatus;
		this.responseMessage = responseMessage;
	}
	public void setActionResponse(Integer responseStatus){
		this.responseStatus = responseStatus;
	}
	public boolean isSuccess(){ return RESPONSE_SUCCESS.equals(responseStatus);}
	public boolean isFailure(){ return RESPONSE_FAILURE.equals(responseStatus);}
	
	public void setResponseMessage(String responseMessage){
		this.responseMessage = responseMessage;
	}
	public void setResponseStatus(Integer responseStatus){
		this.responseStatus = responseStatus;
	}
	public String getResponseMessage(){ return this.responseMessage;}
	public Integer getResponseStatus(){ return this.responseStatus;}
	
	public Integer getOnlineUserId(){
		if(getOnlineUser()!=null)return getOnlineUser().getId();
		return null;
	}
}
