package com.newhc.admin.entity.en;

import java.util.Date;

public class ModelNewsEn {
	private Integer id;
	private Integer centerId;
	private String title;
	private String content;
	private String path;
	private String syPath;
	private String source;
	private String reporter;
	private Date pubTime;
	private Integer status;
	private Integer sequence;
	private String creator;
	private String updator;
	private Date createTime;
	private Date updateTime;
	private int click;
	private Integer year;
	
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	 

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
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getPubTime() {
		return pubTime;
	}
	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSyPath() {
		return syPath;
	}
	public void setSyPath(String syPath) {
		this.syPath = syPath;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Integer getCenterId() {
		return centerId;
	}
	public void setCenterId(Integer centerId) {
		this.centerId = centerId;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	
}
