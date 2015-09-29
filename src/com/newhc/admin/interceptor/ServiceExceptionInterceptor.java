package com.newhc.admin.interceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.interceptor.ServiceExceptionInterceptor;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.exception.ServiceException;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

/**
 * �����쳣������
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-4-1
 */
public class ServiceExceptionInterceptor implements Interceptor{

	private static final Log logger = LogFactory
			.getLog(ServiceExceptionInterceptor.class);
	
	public void destroy() {
	}

	
	public void init() {
	}

	
	public String intercept(ActionInvocation ai) throws Exception {
		String result = null;
		try{
			result = ai.invoke();
		}catch(Throwable t){
			if(t instanceof ServiceException){
				ServiceException se = (ServiceException)t;
        		logger.info("�쳣������ ��⵽��֪�����쳣��["+se.getMessage()+"]��չ��Ϣ��["+se.getMsg()+"]");
			}else{
        		logger.warn("�쳣������ ��⵽δ֪�����쳣��",t);
			}
			ServletActionContext.getRequest().setAttribute(Constants.EXCEPTION, t);
			result = Constants.EXCEPTION;
		}
		return result;
	}
}
