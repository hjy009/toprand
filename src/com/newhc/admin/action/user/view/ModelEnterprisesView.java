package com.newhc.admin.action.user.view;

import java.util.Date;

public class ModelEnterprisesView {
		private Integer id;
		private String name;
		private String remarks;
		private String content;
		private Integer status;
		private Integer type;
		private String creator;
		private String updator; 
		private String createTime;
		private String updateTime;
		
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
		public String getCreateTime() {
			return createTime;
		}
		public void setCreateTime(String createTime) {
			this.createTime = createTime;
		}
		public String getUpdateTime() {
			return updateTime;
		}
		public void setUpdateTime(String updateTime) {
			this.updateTime = updateTime;
		}
		public Integer getType() {
			return type;
		}
		public void setType(Integer type) {
			this.type = type;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		
}
