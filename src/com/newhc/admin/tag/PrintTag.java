package com.newhc.admin.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TryCatchFinally;

//import cn.com.imovie.boss.client.OnlineManager;

/**
 * <auth:print test="/admin/prepareAddAdmin.do" falsePrint="alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;"/>
 * <auth:print test="prepareAddAdmin.do" truePrint="alert('��ϲ��ӵ�д�Ȩ��!');return;"/>
 */
public class PrintTag extends BaseTag implements TryCatchFinally {
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
  
  private String test = null;
	public void setTest(String test){
		this.test = test;
	}

	private String truePrint = "";
	public void setTruePrint(String truePrint){
		this.truePrint = truePrint;
	}
  
	private String falsePrint = null;
	public void setFalsePrint(String falsePrint){
		this.falsePrint = falsePrint;
	}

  
  public int doStartTag() throws JspException {
      return SKIP_BODY;
  }
  public void doCatch(Throwable e) throws Throwable {
  }
  public int doEndTag() throws JspException {
    try {
      JspWriter out = pageContext.getOut();
			HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();			
			HttpServletResponse resp = (HttpServletResponse)pageContext.getResponse();      
			//OnlineManager onlineManager = new OnlineManager(req,resp);
      if(this.test == null || "".equals(this.test)){
      	out.print("");
      }else{
      	String currentURI = req.getRequestURI();
        String pageURI = this.parseURI(currentURI, this.test);//�õ�������URI
	      //if(onlineManager.hasPermission(pageURI)){
        if(true){
	      	out.print(this.truePrint);
	      }else{
	      	out.print(this.falsePrint);
	      }
      }
    } catch(java.io.IOException e) {
      e.printStackTrace();
    }
      return EVAL_PAGE;
    }

  public void doFinally() {
  }

}
