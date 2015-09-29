package com.newhc.admin.tag;

import javax.servlet.jsp.tagext.TagSupport;

public class BaseTag extends TagSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * ����URL��ַ
	 * @param currentURI String : ��ǰҳ���URL��ַ
	 * @param uri String : ҳ���ڵ����URI��ַ
	 * @return String : ҳ�������URL��ַ���Ӧ�ľ��Ե�ַ���Ӹ�·����ʼ
	 */
	protected String parseURI(String currentURI,String uri){
		if(currentURI.startsWith("//")) currentURI = currentURI.substring(1);//tomcat���������ټӶ�һ��/
		if(uri.startsWith("/")) return uri;
		int i = currentURI.lastIndexOf("/");
		if( i < 0) return uri;
		String currentPath = currentURI.substring(0,i); //�����/����ǰĿ¼
		if(uri.startsWith("./")){
			if(uri.startsWith("./../")){
				return parseURI(currentPath+"/",uri.substring(2));//�����ݹ����
			}else{
				return currentPath+"/"+uri.substring(2);
			}
		}
		if(uri.startsWith("../")) return parseURI(currentPath,uri.substring(3));
		return currentPath+"/"+uri;		
	} 
}
