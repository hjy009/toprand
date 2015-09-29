package com.newhc.admin.common;

public class Response {
	private int status = 0;
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	//
	private String message = null;
	public void setMessage(String message){
		this.message = message;
	}
	public String getMessage(){
		return this.message;
	}
	public Response(int status,String message){
		this.status = status;
		this.message = message;
	}
	public Response(int status){
		this.status = status;
	}
	public static int SUCCESS = 0;
	public static int FALIURE = 1;
	public static int ERROR = -1;
}
