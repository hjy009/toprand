package com.newhc.admin.helper;

public class NewStringHelper {
	public static String truncate(String value,int count,String show){
		if(value==null||count==0){
			return value;
		}else{
			if(value.length()>count){
				return value.substring(0, count)+show;
			}else{
				return value;
			}
		}
	}
}
