package com.newhc.admin.exception;

import org.springframework.core.NestedRuntimeException;

public class ServiceException extends NestedRuntimeException{
	
	private static final long serialVersionUID = -8742388150033365813L;
	private String msg;
	public ServiceException(String message){
		super(message);
		this.msg = "";
	}
	
	public ServiceException(String message, String msg){
		super(message);
		this.msg = msg;
	}
	
	public ServiceException(String message, Throwable t){
		super(message, t);
		this.msg = "";
	}
	
	public ServiceException(String message, Throwable t, String msg){
		super(message, t);
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}
	
}

