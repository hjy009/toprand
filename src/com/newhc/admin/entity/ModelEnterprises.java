package com.newhc.admin.entity;

import java.util.Date;

public class ModelEnterprises implements java.io.Serializable {
		private Integer id;
		private String name;
		private String remarks;
		private String content;
		private Integer status;
		private String creator;
		private String updator; 
		private Date createTime;
		private String createTimeString;
		private Date updateTime;
		private Integer type;
		

		public Integer getType() {
			return type;
		}
		public void setType(Integer type) {
			this.type = type;
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
		public String getCreateTimeString() {
			return createTimeString;
		}
		public void setCreateTimeString(String createTimeString) {
			this.createTimeString = createTimeString;
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
		public Integer getStatus() {
			return status;
		}
		public void setStatus(Integer status) {
			this.status = status;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		
}
