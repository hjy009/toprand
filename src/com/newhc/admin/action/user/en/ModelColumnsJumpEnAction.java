package com.newhc.admin.action.user.en;

import java.util.List;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
/**
 * 子栏目跳转
 * @author liangzhongbao
 *
 * 2012-12-3
 */
public class ModelColumnsJumpEnAction extends JSONPrintAction{
	
	/**
	 * 产品与客户
	 * @return
	 */
	public String processProductsAndCustomerEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("PRODUCTS_CUSTOMER_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 员工与招聘
	 * @return
	 */
	public String processEmpAndRecruitmentEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("EMP_RECRUITMENT_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	/**
	 * 新华昌简介
	 * @return
	 */
	public String processCxicIntroductionEnAction(){
		List list = DaoFactory.getModelColumnsJumpEnDao().queryModelColumnsJumpEn("CXIC_INTRODUCTION_EN");
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
}
