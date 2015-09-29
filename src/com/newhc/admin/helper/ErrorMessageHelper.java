package com.newhc.admin.helper;

import cn.com.netmovie.util.PropertyManager;
import cn.com.netmovie.util.XMLPropertyManager;

public class ErrorMessageHelper {
	private static PropertyManager manager = new XMLPropertyManager("error-messages.xml",true);
	public static String getMessage(String errorCode){
		String message =  manager.getProperty(errorCode);
		if(message == null) return errorCode;
		return message;
	}
	public static String getMessage(String errorCode,String value){
		return getMessage(getMessage(errorCode),new Object[]{value});
	}
	private static String getMessage(String message,Object[] values){
		if(values == null || values.length == 0) return message;
		for(int i=0;i<values.length;i++){
			message = message.replaceAll("\\{"+i+"\\}", (String)values[i]);
		}
		return message;
	}
}
