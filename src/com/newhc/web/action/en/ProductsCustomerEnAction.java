package com.newhc.web.action.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelProduct;
import com.newhc.admin.entity.en.ModelProductEn;

/**
 * @author Administrator
 *
 */
public class ProductsCustomerEnAction extends JSONPrintAction {
	
	private Integer imageType = new Integer(6);
	private Integer imageLimit = 1;
	private Integer pageMaxSize=9;
	private Integer pageNumber=1;
	private Integer categoryId;
	private String productName = "国际标准集装箱";
	private Integer productId;
	private ModelProductEn modelProduct = new ModelProductEn();
	
	public String processProductsCustomerEnWebAction(){
		Pagination pi = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnWebPage(null,categoryId, pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pi);
		return SUCCESS;
	}
	
	public String processProductsEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelProduct = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnById(productId);
		return SUCCESS;
	}
	
	public String processCategoryEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		List list = DaoFactory.getModelProductCategoryEnDao().queryModelProductEnWebList(categoryId);
		super.setRequestAttribute("list", list);
		return SUCCESS;
	}
	public Integer getPageMaxSize() {
		return pageMaxSize;
	}

	public void setPageMaxSize(Integer pageMaxSize) {
		this.pageMaxSize = pageMaxSize;
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}


	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	public ModelProductEn getModelProduct() {
		return modelProduct;
	}

	public void setModelProduct(ModelProductEn modelProduct) {
		this.modelProduct = modelProduct;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
}
