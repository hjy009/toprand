package com.newhc.admin.action.user;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
/**
 * ����Ŀ��ת
 * @author liangzhongbao
 *
 * 2012-12-3
 */
public class ModelColumnsJumpAction extends JSONPrintAction{
	
	/**
	 * ��Ʒ��ͻ�
	 * @return
	 */
	public String processProductsAndCustomerAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("PRODUCTS_CUSTOMER");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * Ա������Ƹ
	 * @return
	 */
	public String processEmpAndRecruitmentAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("EMP_RECRUITMENT ");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * �»������
	 * @return
	 */
	public String processCxicIntroductionAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("CXIC_INTRODUCTION");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
}
