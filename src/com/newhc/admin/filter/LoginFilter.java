package com.newhc.admin.filter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newhc.admin.online.OnlineManager;

import cn.com.netmovie.helper.HTTPHelper;

public class LoginFilter extends HttpServlet implements Filter {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig){
		this.filterConfig = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain){
		try{			
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp = (HttpServletResponse)response;
			if(this.isIgnorePage(req,resp) == false){
				//以下页面需要检查是否登录
				OnlineManager manager = new OnlineManager(req,resp);
				String server = HTTPHelper.getServerPath(req);
				if(manager.isSignIn() == false){
					//未登录					
					resp.sendRedirect(server+"admin/index.jsp");
					return;
				}
			}
			filterChain.doFilter(request, response);
		}catch(ServletException sx){
			sx.printStackTrace(System.out);
			filterConfig.getServletContext().log(sx.getMessage());
		}catch(IOException iox){
			iox.printStackTrace(System.out);
			filterConfig.getServletContext().log(iox.getMessage());
		}finally{
			
		}
	}
	private boolean isIgnorePage(HttpServletRequest req,HttpServletResponse response){
		//以下页面忽略检验
		String[] ignores = {"/admin/index.jsp","/admin/adminLogin.do","/validate/image.jsp"};
		for(int i=0;i<ignores.length;i++){
			String rule = req.getContextPath()+ignores[i];
			Pattern p = Pattern.compile(rule);
			Matcher m = p.matcher(req.getRequestURI());			
			if(m.matches()) return true;			
		}
		if(req.getRequestURI().indexOf(".jpg")>0||req.getRequestURI().indexOf(".gif")>0
				||req.getRequestURI().indexOf(".bmp")>0||req.getRequestURL().indexOf(".css")>0
				||req.getRequestURL().indexOf(".swf")>0){
			return true;
		}
		return false;
	}
}
