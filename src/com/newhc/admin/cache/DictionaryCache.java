package com.newhc.admin.cache;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.Dictionary;

import cn.com.netmovie.cache.TimeCache;
import cn.com.netmovie.cache.TimeCacheManager;
import cn.com.netmovie.helper.StringHelper;

public class DictionaryCache extends TimeCache{
	private List dicts = null;

	protected boolean sync(){
		StringBuffer query = new StringBuffer();
		query.append(" select dict from ").append(Dictionary.class.getName());
		query.append(" dict order by dict.parentCode,dict.sequence asc,dict.id asc ");
		dicts = DaoFactory.getBaseDao().getHibernateTemplate().find(query.toString());
		return true;
	}

	public long getLifeCycle(){
		return ONE_DAY;
	}
	
	/**
	 * 根据PARENT_CODE得到字典表List
	 * @param id
	 * @return List<Dictionary>
	 */
	public static List getValuesListByParentCode(String parentCode){
		List list = new LinkedList();
		if(!StringHelper.isEmpty(parentCode)){
			DictionaryCache cache = (DictionaryCache)TimeCacheManager.getCache(DictionaryCache.class);
			if(cache.dicts!=null){
				for(Iterator it=cache.dicts.iterator();it.hasNext();){
					Dictionary d = (Dictionary)it.next();
					if(parentCode.equals(d.getParentCode().trim())){
						list.add(d);					
					}
				}
			}
		}
		return list;
	}
	
	/**
	 * 
	 * @param parentCode
	 * @return
	 */
	public static Map getValuesMapByParentCode(String parentCode){
		Map map = new HashMap();
		if(!StringHelper.isEmpty(parentCode)){
			DictionaryCache cache = (DictionaryCache)TimeCacheManager.getCache(DictionaryCache.class);
			if(cache.dicts!=null){
				for(Iterator it=cache.dicts.iterator();it.hasNext();){
					Dictionary d = (Dictionary)it.next();
					if(parentCode.equals(d.getParentCode())){
						map.put(d.getCode(),d.getValue());			
					}
				}
			}
		}
		return map;
	}
	
	/**
	 * 根据PARENT_CODE,CODE得到字典VALUE
	 * @param parentCode
	 * @param code
	 * @return
	 */
	public static String getValueByCode(String parentCode,String code){
		String value = "";
		if(!StringHelper.isEmpty(parentCode) && !StringHelper.isEmpty(code)){
			Map map = getValuesMapByParentCode(parentCode);
			if(map!=null){
				String dict = (String)map.get(code.trim());
				return dict==null?"":dict;
			}
		}
		return value; 
	}
}
