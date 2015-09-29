package com.newhc.web.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.action.user.ModelNewsAction;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelNews;
import com.newhc.admin.helper.NewStringHelper;


public class NewsWebAction extends JSONPrintAction{
	
	private Integer newsId;
	private Integer pageMaxSize=1;
	private Integer pageNumber=1;
	private Integer imageType = new Integer(4);
	private Integer imageLimit = 1;
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(ModelNewsAction.class);
	private String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private String DATE_FORMAT_DAY = "yyyy-MM-dd";
	private Integer years;
	
	
	
	public String processQiyeNewsWebAction(){
		Pagination pages = DaoFactory.getModelNewsDao().queryModelNewsPage(null,new Integer(1),years,new Integer(1),null, null,null,pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		List processList = DaoFactory.getModelNewsDao().queryNewsByDistinct(new Integer(1));
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("processList", processList);
		super.setRequestAttribute("years", years);
		return SUCCESS;
	}
	private ModelNews news;

	public String processQiyeNewsDetailWebAction(){
		ModelNews nextnew =new ModelNews();
		ModelNews lastnew =new ModelNews();
		
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		news=DaoFactory.getModelNewsDao().queryModelNewsById(newsId);
		
		//找到当前新闻列表
		ModelNews dnews = new ModelNews();
		dnews.setCenterId(news.getCenterId());
		List<ModelNews> newList = DaoFactory.getModelNewsDao().queryNews(dnews);
		
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
		List processList = DaoFactory.getModelNewsDao().queryNewsByDistinct(new Integer(1));
		super.setRequestAttribute("processList", processList);
		Integer click = NumbericHelper.getIntValue(news.getClick(), 0);
		click = click+1;
		news.setClick(click);
		DaoFactory.getModelNewsDao().updateNewsClick(newsId,click);
		return SUCCESS;
	}
	
	public String processHyeNewsWebAction(){
		Pagination pages = DaoFactory.getModelNewsDao().queryModelNewsPage(null,new Integer(3),years,new Integer(1),null, null,null,pageMaxSize, pageNumber);
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		List processList = DaoFactory.getModelNewsDao().queryNewsByDistinct(new Integer(3));
		super.setRequestAttribute("processList", processList);
		super.setRequestAttribute("imageList", imageList);
		super.setRequestAttribute("pages", pages);
		super.setRequestAttribute("years", years);
		return SUCCESS;
	}
	
	public String processHyeNewsDetailWebAction(){
		ModelNews nextnew =new ModelNews();
		ModelNews lastnew =new ModelNews();
		
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		news=DaoFactory.getModelNewsDao().queryModelNewsById(newsId);
		
		//找到当前新闻列表
		ModelNews dnews = new ModelNews();
		dnews.setCenterId(news.getCenterId());
		List<ModelNews> newList = DaoFactory.getModelNewsDao().queryNews(dnews);
		
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
		List processList = DaoFactory.getModelNewsDao().queryNewsByDistinct(new Integer(3));
		super.setRequestAttribute("processList", processList);
		Integer click = NumbericHelper.getIntValue(news.getClick(), 0);
		click = click+1;
		news.setClick(click);
		DaoFactory.getModelNewsDao().updateNewsClick(newsId,click);
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

	public ModelNews getNews() {
		return news;
	}

	public void setNews(ModelNews news) {
		this.news = news;
	}

	public Integer getYears() {
		return years;
	}

	public void setYears(Integer years) {
		this.years = years;
	}

	 
}
