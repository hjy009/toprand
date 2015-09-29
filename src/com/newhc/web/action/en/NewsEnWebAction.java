package com.newhc.web.action.en;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.en.ModelNewsEn;
import com.newhc.admin.helper.NewStringHelper;


public class NewsEnWebAction extends JSONPrintAction{
	
	private Integer newsId;
	private Integer pageMaxSize=8;
	private Integer pageNumber=1;
	private Integer imageType = new Integer(4);
	private Integer imageLimit = 1;
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(NewsEnWebAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer years;
	
	
	
	public String processQiyeNewsEnWebAction(){
		Pagination pages = DaoFactory.getModelNewsEnDao().queryModelNewsEnPage(null,new Integer(1),years,new Integer(1),null, null,null,pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		List processList = DaoFactory.getModelNewsEnDao().queryNewsEnByDistinct(new Integer(1));
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("processList", processList);
		super.setRequestAttribute("years", years);
		return SUCCESS;
	}
	private ModelNewsEn news;

	public String processQiyeNewsDetailEnWebAction(){
		ModelNewsEn nextnew =new ModelNewsEn();
		ModelNewsEn lastnew =new ModelNewsEn();
		
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		news=DaoFactory.getModelNewsEnDao().queryModelNewsEnById(newsId);
		
		//找到当前新闻列表
		ModelNewsEn dnews = new ModelNewsEn();
		dnews.setCenterId(news.getCenterId());
		List<ModelNewsEn> newList = DaoFactory.getModelNewsEnDao().queryNewsEn(dnews);
		
		for(int i=0;i<newList.size();i++){
			Map map = (Map)newList.get(i);
			if(NumbericHelper.getIntValue((Integer)map.get("id"),-1) == news.getId()){
				//下一篇新闻
				if(i<(newList.size()-1)){
					Map map1 = (Map)newList.get(i+1);
					if(map1!=null){
						nextnew.setId(NumbericHelper.getIntValue((Integer)map1.get("id"),-1));
						nextnew.setTitle(NewStringHelper.truncate((String)map1.get("title"),50,"..."));
					} 
				}
				//上一篇新闻
				if(i>0){
					Map map2 = (Map)newList.get(i-1);
					if(map2!=null){
						lastnew.setId(NumbericHelper.getIntValue((Integer)map2.get("id"),-1));
						lastnew.setTitle(NewStringHelper.truncate((String)map2.get("title"),50,"..."));
					}
				}
				break;
			}
		}
		super.setRequestAttribute("lastnew", lastnew);
		super.setRequestAttribute("nextnew", nextnew);
		List processList = DaoFactory.getModelNewsEnDao().queryNewsEnByDistinct(new Integer(1));
		super.setRequestAttribute("processList", processList);
		Integer click = NumbericHelper.getIntValue(news.getClick(), 0);
		click = click+1;
		news.setClick(click);
		DaoFactory.getModelNewsEnDao().updateNewsEnClick(newsId,click);
		return SUCCESS;
	}
	
	public String processHyeNewsEnWebAction(){
		Pagination pages = DaoFactory.getModelNewsEnDao().queryModelNewsEnPage(null,new Integer(3),years,new Integer(1),null, null,null,pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		List processList = DaoFactory.getModelNewsEnDao().queryNewsEnByDistinct(new Integer(3));
		super.setRequestAttribute("processList", processList);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("years", years);
		return SUCCESS;
	}
	
	public String processHyeNewsDetailEnWebAction(){
		ModelNewsEn nextnew =new ModelNewsEn();
		ModelNewsEn lastnew =new ModelNewsEn();
		
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		news=DaoFactory.getModelNewsEnDao().queryModelNewsEnById(newsId);
		
		//找到当前新闻列表
		ModelNewsEn dnews = new ModelNewsEn();
		dnews.setCenterId(news.getCenterId());
		List<ModelNewsEn> newList = DaoFactory.getModelNewsEnDao().queryNewsEn(dnews);
		
		for(int i=0;i<newList.size();i++){
			Map map = (Map)newList.get(i);
			if(NumbericHelper.getIntValue((Integer)map.get("id"),-1) == news.getId()){
				//下一篇新闻
				if(i<(newList.size()-1)){
					Map map1 = (Map)newList.get(i+1);
					if(map1!=null){
						nextnew.setId(NumbericHelper.getIntValue((Integer)map1.get("id"),-1));
						nextnew.setTitle(NewStringHelper.truncate((String)map1.get("title"),20,"..."));
					} 
				}
				//上一篇新闻
				if(i>0){
					Map map2 = (Map)newList.get(i-1);
					if(map2!=null){
						lastnew.setId(NumbericHelper.getIntValue((Integer)map2.get("id"),-1));
						lastnew.setTitle(NewStringHelper.truncate((String)map2.get("title"),20,"..."));
					}
				}
				break;
			}
		}
		super.setRequestAttribute("lastnew", lastnew);
		super.setRequestAttribute("nextnew", nextnew);
		List processList = DaoFactory.getModelNewsEnDao().queryNewsEnByDistinct(new Integer(3));
		super.setRequestAttribute("processList", processList);
		Integer click = NumbericHelper.getIntValue(news.getClick(), 0);
		click = click+1;
		news.setClick(click);
		DaoFactory.getModelNewsEnDao().updateNewsEnClick(newsId,click);
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

	public Integer getNewsId() {
		return newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	 

	public ModelNewsEn getNews() {
		return news;
	}

	public void setNews(ModelNewsEn news) {
		this.news = news;
	}

	public Integer getYears() {
		return years;
	}

	public void setYears(Integer years) {
		this.years = years;
	}

	 
}
