package com.newhc.web.action;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.helper.NewStringHelper;

public class IndexWebAction extends JSONPrintAction{
	private Integer imageType = new Integer(1);
	private Integer imageLimit = 2;
	private String name;
	
	public String processIndexWebAction(){
		List columnFlashList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		List qiyeList = DaoFactory.getModelNewsDao().queryNewsByLimit(new Integer(1));//��ҵ����
		List hyeList = DaoFactory.getModelNewsDao().queryNewsByLimit(new Integer(3));//ҵ������
		List gjList = DaoFactory.getModelProductCategoryDao().queryModelProductWebList(new Integer(1));//���ʱ�׼��װ��
		List tzList = DaoFactory.getModelProductCategoryDao().queryModelProductWebList(new Integer(4));//���ָɻ���װ��
		List gsList = DaoFactory.getModelProductCategoryDao().queryModelProductWebList(new Integer(10));//��ʽ��װ��
		List enterpriseList =DaoFactory.getModelEnterprisesDao().queryModelIndexEnterprisesList(null);//��Ա��ҵ
		super.setRequestAttribute("columnFlashList", columnFlashList);
		super.setRequestAttribute("qiyeList", qiyeList);
		super.setRequestAttribute("hyeList", hyeList);
		super.setRequestAttribute("gjList", gjList);
		super.setRequestAttribute("tzList", tzList);
		super.setRequestAttribute("gsList", gsList);
		super.setRequestAttribute("enterpriseList", enterpriseList);
		return SUCCESS;
	}
	

	public Integer getImageLimit() {
		return imageLimit;
	}
	public void setImageLimit(Integer imageLimit) {
		this.imageLimit = imageLimit;
	}
	public Integer getImageType() {
		return imageType;
	}
	public void setImageType(Integer imageType) {
		this.imageType = imageType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
