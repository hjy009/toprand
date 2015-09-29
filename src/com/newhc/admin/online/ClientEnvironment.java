package com.newhc.admin.online;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.util.PropertyManager;
import cn.com.netmovie.util.XMLPropertyManager;

/**
 * 
 * @author kelvin
 * email:panweihui@vv8.com
 * 2011-11-29
 */
public class ClientEnvironment {	
	
	public static String VER = "1.0.0";
	
	public static String DOMAIN_NAME = "";//只能是同在此域下
	
	public static String ONLINE_COOKIE_NAME = "";
	
	public static String IGNORE_PAGES = "";
	
	private static final Log logger = LogFactory.getLog(ClientEnvironment.class);
	
	public static String LOGIN_URL = "/";//登录页面
	
	public static String DENY_URL = "/deny.do";//错误提示页面	
	
	public static PropertyManager manager = new XMLPropertyManager("newhc-admin-environment.xml",true);
		
	public static boolean DEBUG = false;
	
	public static String DATABASE_BIN_PATH = "";
	
	public static String DATABASE_NAME = "";
	
	public static String DATABASE_USERNAME = "";
	
	public static String DATABASE_PASSWORD = "";
	
	public static String DATABASE_HOST = "";
	
	static {
		//打印相应信息
		if(!StringHelper.isEmpty(manager.getProperty("DOMAIN_NAME"))){
			DOMAIN_NAME = manager.getProperty("DOMAIN_NAME");
		}		
		if(!StringHelper.isEmpty(manager.getProperty("ONLINE_COOKIE_NAME"))){
			ONLINE_COOKIE_NAME = manager.getProperty("ONLINE_COOKIE_NAME");
		}		
		if(!StringHelper.isEmpty(manager.getProperty("IGNORE_PAGES"))){
			IGNORE_PAGES = manager.getProperty("IGNORE_PAGES");
		}
		if(!StringHelper.isEmpty(manager.getProperty("DEBUG"))){
			DEBUG = "true".equalsIgnoreCase(manager.getProperty("DEBUG"))?true:false; 
		}	
		
		if(!StringHelper.isEmpty(manager.getProperty("DATABASE_BIN_PATH"))){
			DATABASE_BIN_PATH = manager.getProperty("DATABASE_BIN_PATH");
		}	
		if(!StringHelper.isEmpty(manager.getProperty("DATABASE_NAME"))){
			DATABASE_NAME = manager.getProperty("DATABASE_NAME");
		}	
		if(!StringHelper.isEmpty(manager.getProperty("DATABASE_USERNAME"))){
			DATABASE_USERNAME = manager.getProperty("DATABASE_USERNAME");
		}		
		if(!StringHelper.isEmpty(manager.getProperty("DATABASE_PASSWORD"))){
			DATABASE_PASSWORD = manager.getProperty("DATABASE_PASSWORD");
		}		
		if(!StringHelper.isEmpty(manager.getProperty("DATABASE_HOST"))){
			DATABASE_HOST = manager.getProperty("DATABASE_HOST");
		}
		logger.info("DOMAIN_NAME="+DOMAIN_NAME);
		logger.info("ONLINE_COOKIE_NAME="+ONLINE_COOKIE_NAME);
		logger.info("IGNORE_PAGES="+IGNORE_PAGES);
		logger.info("DEBUG="+DEBUG);
		logger.info("DATABASE_BIN_PATH="+DATABASE_BIN_PATH);
		logger.info("DATABASE_NAME="+DATABASE_NAME);
		logger.info("DATABASE_USERNAME="+DATABASE_USERNAME);
		logger.info("DATABASE_PASSWORD="+DATABASE_PASSWORD);
		logger.info("DATABASE_HOST="+DATABASE_HOST);
	}			
}
