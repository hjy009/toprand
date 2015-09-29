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
	 * @return String : codeֵ
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
	 * @return String : valueֵ
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
	 * @return Integer : ˳��ֵ
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
	 * @return Date : ����ʱ��
	 */
	public Date getCreateTime(){
		return this.createTime;
	}
	public static final String NONE = "NONE"; //ϵͳ�ֵ�
	public static final String ADMIN_USER_TYPE = "ADMIN_USER_TYPE";//����Ա����
	public static final String ADMIN_USER_STATUS = "ADMIN_USER_STATUS";//����Ա״̬
	public static final String MENU_TYPE = "MENU_TYPE";//�˵����� 1�����Ĳ˵� 2��Ӣ�Ĳ˵� 3�����Ĳ˵�
	public static final String ROLE_TYPE = "ROLE_TYPE";//Ȩ������ 1������Ȩ�� 2��Ӣ��Ȩ�� 3������Ȩ��
	public static final String AUDIT_STATUS="AUDIT_STATUS";
	public static final String COLUMN_IMAGE_TYPE = "COLUMN_IMAGE_TYPE";//��ĿͼƬ����
	public static final String PARENT_TYPE = "PARENT_TYPE";//��Ŀ�����ͣ�ͼƬ�����֣�
	public static final String MODEL_ADVERTISE_DEGREE_TYPE="MODEL_ADVERTISE_DEGREE_TYPE";//��Ƹ��Ϣ_ѧ��Ҫ��: 1:��ר 2:���� 3:��ר 4:���� 5:˶ʿ 6:��ʿ',
	public static final String MAGAZINE_CATEGORY_TYPE = "MAGAZINE_CATEGORY_TYPE";//���ͣ�1;�ڿ���2:�¿� 3:��־',
	public static final String MAGAZINE_TYPE = "MAGAZINE_TYPE";//'���ͣ�1:���� 2:��ͼ 3:����',
	public static final String ENTERPRISES_TYPE = "ENTERPRISES_TYPE";//��Ա��ҵ���ͣ�1,�ع���ҵ;2,�ǿع���ҵ
	
	//
	private String parentCode = NONE;
	public void setParentCode(String parentCode){
		this.parentCode = parentCode;
	}
	/**
	 * @hibernate.property column="PARENT_CODE"
	 * @return String : ��ID��CODEֵ
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
