package com.newhc.admin.action;

public class BasePrintAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String contentText = null;
	public void setContentText(String contentText){
		this.contentText = contentText;
	}
	public String getContentText(){
		return this.contentText;
	}
	//
	private String contentType = null;
	public void setContentType(String contentType){
		this.contentType = contentType;
	}
	public String getContentType(){
		return this.contentType;
	}
}
