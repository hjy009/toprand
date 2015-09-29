package com.newhc.admin.entity;

import java.util.Date;

public class ModelEmployess {
	private Integer id;
	private String code;
	private String content;
	private String creator;
	private String updator;
	private Date createTime;
	private Date updateTime;
	

	public String getContent() {
		if(content==null){
			return content;
		}else{
			return content.replace("\"","'").replaceAll("\n","").replaceAll("\r","");
		}
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdator() {
		return updator;
	}
	public void setUpdator(String updator) {
		this.updator = updator;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
}
