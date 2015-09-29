package com.newhc.admin.action.user;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
/**
 * 子栏目跳转
 * @author liangzhongbao
 *
 * 2012-12-3
 */
public class ModelColumnsJumpAction extends JSONPrintAction{
	
	/**
	 * 产品与客户
	 * @return
	 */
	public String processProductsAndCustomerAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("PRODUCTS_CUSTOMER");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 员工与招聘
	 * @return
	 */
	public String processEmpAndRecruitmentAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("EMP_RECRUITMENT ");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 新华昌简介
	 * @return
	 */
	public String processCxicIntroductionAction(){
		List list = DaoFactory.getModelColumnsJumpDao().queryModelColumnsJump("CXIC_INTRODUCTION");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
}
