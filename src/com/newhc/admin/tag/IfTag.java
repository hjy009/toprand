package com.newhc.admin.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.newhc.admin.online.OnlineManager;

public class IfTag extends BaseTag implements TryCatchFinally {
	private static final Log logger = LogFactory.getLog(IfTag.class);
  /**
   * 一般使用绝对路径
	 * <auth:if test="/admin/deleteAdmin.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	 * 可使用相对路径
	 * <auth:if test="deleteAdmin.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	 */
	private static final long serialVersionUID = 1L;

	private String test = null;
	public void setTest(String test){
		this.test = test;
	}
	private String status = null;
	public void setStatus(String status){
		this.status = status;
	}

	
  public int doStartTag() throws JspException {
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();			
		HttpServletResponse resp = (HttpServletResponse)pageContext.getResponse();
		OnlineManager onlineManager = new OnlineManager(req,resp);
		boolean hasPermission = false;
		if(this.test == null || "".equals(this.test)){
			hasPermission = true;
		}else{
    	String currentURI = req.getRequestURI();
    	//logger.info("currentURI="+currentURI);
        String pageURI = this.parseURI(currentURI, this.test);//得到真正的URI
			hasPermission = onlineManager.hasPermission(pageURI);
		}
		if(hasPermission && "true".equalsIgnoreCase(this.status)){
			//有权限并且status=true
			return EVAL_BODY_INCLUDE;
		}else if(!hasPermission && "false".equalsIgnoreCase(this.status)){
			//无权限并且status=false
			return EVAL_BODY_INCLUDE;
		}else{
			return SKIP_BODY; 
		}  
  }

  public void doCatch(Throwable e) throws Throwable {
  }

  public int doEndTag() throws JspException {

      return EVAL_PAGE;
    }

  public void doFinally() {
  }
}
