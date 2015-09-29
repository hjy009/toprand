package com.newhc.admin.entity;

import java.util.Date;

import cn.com.netmovie.helper.BeanHelper;

public class Dictionary {
	private Integer id = null;
	
	public void setId(Integer id){
		this.id = id;
	}
	/**
	 * @hibernate.id column="ID" generator-class="sequence" unsaved-value="null"
	 * @hibernate.generator-param name="sequence" value="SEQ_GLOBAL" 
	 * @return Integer : 
	 */
	public Integer getId(){
		return this.id;
	}
	//
	private String code = null;
	public void setCode(String code){
		this.code = code;
	}
	/**
	 * @hibernate.property column="CODE" not-null="true" length="32"
	 * @return String : code值
	 */
	public String getCode(){
		return this.code;
	}
	//
	private String value = null;
	public void setValue(String value){
		this.value = value;
	}
	/**
	 * @hibernate.property column = "VALUE" not-null = "true" length="255"
	 * @return String : value值
	 */
	public String getValue(){
		return this.value;
	}
	//
	private Integer sequence = new Integer(100);
	public void setSequence(Integer sequence){
		this.sequence = sequence;
	}
	/**
	 * @hibernate.property column="SEQUENCE"
	 * @return Integer : 顺序值
	 */
	public Integer getSequence(){
		return this.sequence;
	}
	//
	private Date createTime = new Date(System.currentTimeMillis());
	public void setCreateTime(Date createTime){
		this.createTime = createTime;
	}
	/**
	 * @hibernate.property column = "CREATE_TIME"
	 * @return Date : 创建时间
	 */
	public Date getCreateTime(){
		return this.createTime;
	}
	public static final String NONE = "NONE"; //系统字典
	public static final String ADMIN_USER_TYPE = "ADMIN_USER_TYPE";//管理员类型
	public static final String ADMIN_USER_STATUS = "ADMIN_USER_STATUS";//管理员状态
	public static final String MENU_TYPE = "MENU_TYPE";//菜单类型 1：中文菜单 2：英文菜单 3：日文菜单
	public static final String ROLE_TYPE = "ROLE_TYPE";//权限类型 1：中文权限 2：英文权限 3：日文权限
	public static final String AUDIT_STATUS="AUDIT_STATUS";
	public static final String COLUMN_IMAGE_TYPE = "COLUMN_IMAGE_TYPE";//栏目图片类型
	public static final String PARENT_TYPE = "PARENT_TYPE";//栏目父类型（图片，文字）
	public static final String MODEL_ADVERTISE_DEGREE_TYPE="MODEL_ADVERTISE_DEGREE_TYPE";//招聘信息_学历要求: 1:中专 2:高中 3:大专 4:本科 5:硕士 6:博士',
	public static final String MAGAZINE_CATEGORY_TYPE = "MAGAZINE_CATEGORY_TYPE";//类型：1;期刊，2:月刊 3:杂志',
	public static final String MAGAZINE_TYPE = "MAGAZINE_TYPE";//'类型：1:封面 2:插图 3:正文',
	public static final String ENTERPRISES_TYPE = "ENTERPRISES_TYPE";//成员企业类型：1,控股企业;2,非控股企业
	
	//
	private String parentCode = NONE;
	public void setParentCode(String parentCode){
		this.parentCode = parentCode;
	}
	/**
	 * @hibernate.property column="PARENT_CODE"
	 * @return String : 父ID的CODE值
	 */
	public String getParentCode(){
		return this.parentCode;
	}
	private String description = null;
	public void setDescription(String description){
		this.description = description;
	}
	/**
	 * @hibernate.property column="DESCRIPTION" length="255"
	 * @return String : 
	 */
	public String getDescription(){
		return this.description;
	}
	public String toString(){
		return BeanHelper.toString(this);
	}
}
