package com.newhc.web.action.en;

import java.util.List;
import java.util.Map;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelFactoryEnvironment;
import com.newhc.admin.entity.en.ModelFactoryEnvironmentEn;

public class RemeberTheBigEnWebAction extends JSONPrintAction{
	
	private Integer columnsType=new Integer(2);
	private Integer remberColumnsType=new Integer(3);
	private Integer pageMaxSize = 6;
	private Integer pageNumber = 1;
	private Integer imageType = new Integer(2);
	private Integer imageLimit = 1;
	/**
	 * 企业荣誉
	 * @return
	 */
	public String processsQueryRemeberTheBigEnAction(){
		Pagination pages = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnPage(columnsType,new Integer(1), pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;
	}
	
	
	/**
	 * 大事记
	 * @return
	 */
	
	public String processsQueryRemeberBigEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		List remberList = DaoFactory.getModelRemeberTheBigEnDao().queryModelRemeberTheBigEnList(null, remberColumnsType, new Integer(1));
		super.setRequestAttribute("remberList", remberList);
		/*
		List rember1List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2011", remberColumnsType, new Integer(1));
		List rember2List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2010", remberColumnsType, new Integer(1));
		List rember3List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2009", remberColumnsType, new Integer(1));
		List rember4List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2008", remberColumnsType, new Integer(1));
		List rember5List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2007", remberColumnsType, new Integer(1));
		List rember6List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2006", remberColumnsType, new Integer(1));
		List rember7List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2005", remberColumnsType, new Integer(1));
		List rember8List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2004", remberColumnsType, new Integer(1));
		List rember9List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2003", remberColumnsType, new Integer(1));
		List rember10List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2002", remberColumnsType, new Integer(1));
		List rember11List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("2001", remberColumnsType, new Integer(1));
		List rember12List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("1999", remberColumnsType, new Integer(1));
		List rember13List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("1998", remberColumnsType, new Integer(1));
		List rember14List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("1997", remberColumnsType, new Integer(1));
		List rember15List=DaoFactory.getModelRemeberTheBigDao().queryModelRemeberTheBigList("1996", remberColumnsType, new Integer(1));
	
		super.setRequestAttribute("rember1List", rember1List);
		super.setRequestAttribute("rember2List",rember2List);
		super.setRequestAttribute("rember3List", rember3List);
		super.setRequestAttribute("rember4List", rember4List);
		super.setRequestAttribute("rember5List", rember5List);
		super.setRequestAttribute("rember6List", rember6List);
		super.setRequestAttribute("rember7List", rember7List);
		super.setRequestAttribute("rember8List", rember8List);
		super.setRequestAttribute("rember9List", rember9List);
		super.setRequestAttribute("rember10List", rember10List);
		super.setRequestAttribute("rember11List", rember11List);
		super.setRequestAttribute("rember12List", rember12List);
		super.setRequestAttribute("rember13List", rember13List);
		super.setRequestAttribute("rember14List", rember14List);
		super.setRequestAttribute("rember15List", rember15List);*/
	
		return SUCCESS;
	}
	
	
	private Integer pageFactoryMaxSize = 9;
	/**
	 * 厂区环境
	 * @return
	 */
	public String 	processsFactoryEnvironmentEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Pagination pages = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnPage(null,new Integer(1),pageFactoryMaxSize, pageNumber);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;	
	}
	
	private ModelFactoryEnvironmentEn factory= new ModelFactoryEnvironmentEn();
	private Integer factoryId;
	/**
	 * 厂区环境详细
	 * @return
	 */
	public String 	processsFactoryEnvironmentDetailEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Map  oneMap = null;//保存下标为0的Map
		Map twoMap = null;//保存当前下标的Map
		List list = DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnWebList();
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				Map map = (Map)list.get(i);
				if(map.get("id").equals(factoryId)){
					oneMap = (Map)list.get(0);
					twoMap = (Map)list.get(i);
					list.remove(0);
					list.add(0,twoMap); 
					list.remove(i);
					list.add(i,oneMap);
				}
			}
		}
		factory=DaoFactory.getModelFactoryEnvironmentEnDao().queryModelFactoryEnvironmentEnById(factoryId);
		super.setRequestAttribute("id", factoryId);
		super.setRequestAttribute("list", list);
		return SUCCESS;	
	}
	
	
	/**
	 * 联系方式
	 * @return
	 */
	public String 	processsContactEnAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;	
	}
	public Integer getColumnsType() {
		return columnsType;
	}
	public void setColumnsType(Integer columnsType) {
		this.columnsType = columnsType;
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


	public Integer getFactoryId() {
		return factoryId;
	}


	public void setFactoryId(Integer factoryId) {
		this.factoryId = factoryId;
	}


	public ModelFactoryEnvironmentEn getFactory() {
		return factory;
	}


	public void setFactory(ModelFactoryEnvironmentEn factory) {
		this.factory = factory;
	}


	 
}
