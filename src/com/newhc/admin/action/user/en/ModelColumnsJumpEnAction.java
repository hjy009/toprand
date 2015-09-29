package com.newhc.admin.action.user.en;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
/**
 * ����Ŀ��ת
 * @author liangzhongbao
 *
 * 2012-12-3
 */
public class ModelColumnsJumpEnAction extends JSONPrintAction{
	
	/**
	 * ��Ʒ��ͻ�
	 * @return
	 */
	public String processProductsAndCustomerEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("PRODUCTS_CUSTOMER_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * Ա������Ƹ
	 * @return
	 */
	public String processEmpAndRecruitmentEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("EMP_RECRUITMENT_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * �»������
	 * @return
	 */
	public String processCxicIntroductionEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("CXIC_INTRODUCTION_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
}
