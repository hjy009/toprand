<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.newhc.admin.helper.NewStringHelper"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.sql.*"%>
<%
	List imageList = (List)request.getAttribute("imageList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-�»������</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/chinese/js/swfobject.js"></script>
</head>
<body>
<div class="footbg">
<div class="wrap">
 <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
     <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li class="hover"><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/introWeb.do">���Ÿſ�</a>      
    <a href="/chinese/queryRemeberTheBig.do">��ҵ����</a>      
    <a href="/chinese/queryRemeberBig.do">���Ŵ��¼�</a>      
    <a href="/chinese/queryFactoryEnvironment.do">��������</a>      
    <a href="/chinese/enterprisesWeb.do">��Ա��ҵ</a>      
    <a href="/chinese/queryContact.do">��ϵ��ʽ</a>
    <a href="/chinese/videoWeb.do">������Ӱ</a>
    </div>
    
    
     <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/chinese/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">�»������</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li><a href="/chinese/introWeb.do">���Ÿſ�</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">��ҵ����</a></li>
                        <li><a href="/chinese/queryRemeberBig.do">���Ŵ��¼�</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">��������</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">��Ա��ҵ</a></li>
                        <li class="hover"><a href="/chinese/queryContact.do">��ϵ��ʽ</a></li>
                    	<li><a href="/chinese/videoWeb.do">������Ӱ</a></li>
                    
                    
                
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/introWeb.do">�»������</a>-��ϵ��ʽ
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>��ϵ��ʽ</h2>
                 </div>
                 
                 
                 
                 <div class="mcon3">
             			<div class="contact">
               		    	 
               		    	 
               		    	 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"width="657" height="469">
					             <param name="movie" value="/chinese/contactSwf/map2.swf" />
					             <param name="quality" value="high" />
					             <param name="wmode" value="transparent" />
					             <embed src="/chinese/contactSwf/map2.swf" width="657" height="469" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent" ></embed>
					       </object>
               		    	
                        </div>
          </div>
        
        </div>
    <!-- mright end -->
    
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
    <%@ include file="/chinese/foot.jsp"%>
  <!-- foot end -->
  
  
</div>
</div>

	 
</body>
</html>