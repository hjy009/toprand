package com.newhc.admin.tag;

import javax.servlet.jsp.tagext.TagSupport;

public class BaseTag extends TagSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 解析URL地址
	 * @param currentURI String : 当前页面的URL地址
	 * @param uri String : 页面内的相对URI地址
	 * @return String : 页面内相对URL地址相对应的绝对地址，从根路径开始
	 */
	protected String parseURI(String currentURI,String uri){
		if(currentURI.startsWith("//")) currentURI = currentURI.substring(1);//tomcat服务器会再加多一个/
		if(uri.startsWith("/")) return uri;
		int i = currentURI.lastIndexOf("/");
		if( i < 0) return uri;
		String currentPath = currentURI.substring(0,i); //最后无/，当前目录
		if(uri.startsWith("./")){
			if(uri.startsWith("./../")){
				return parseURI(currentPath+"/",uri.substring(2));//继续递归求解
			}else{
				return currentPath+"/"+uri.substring(2);
			}
		}
		if(uri.startsWith("../")) return parseURI(currentPath,uri.substring(3));
		return currentPath+"/"+uri;		
	} 
}
