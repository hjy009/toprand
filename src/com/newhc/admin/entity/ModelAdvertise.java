package com.newhc.admin.entity;

import java.io.Serializable;
import java.util.Date;

public class ModelAdvertise implements Serializable{
	private Integer id;
	private String name;
	private String adPerson;
	private String degree;
	private String company;
	private String workingPlace;
	private Date startTime;
	private Date endTime;
	private String description;
	private String requires;
	private String linkman;
	private String telephone;
	private String email;
	private Integer type;
	private Integer status;
	private String creator;
	private String updator;
	private Date createTime;
	private Date updateTime;
	private Date pubTime;
	public String getAdPerson() {
		return adPerson;
	}
	public void setAdPerson(String adPerson) {
		this.adPerson = adPerson;
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
 
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getDescription() {
		if(description==null){
			return description;
		}else{
			return description.replace("\"","'").replaceAll("\n", "").replaceAll("\r", "");
		}
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRequires() {
		if(requires==null){
			return requires;
		}else{
			return requires.replace("\"","'").replaceAll("\n", "").replaceAll("\r", "");
		}
	}
	public void setRequires(String requires) {
		this.requires = requires;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getWorkingPlace() {
		return workingPlace;
	}
	public void setWorkingPlace(String workingPlace) {
		this.workingPlace = workingPlace;
	}
	public Date getPubTime() {
		return pubTime;
	}
	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	
	
	
}
