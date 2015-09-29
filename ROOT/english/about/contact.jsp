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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/english/js/swfobject.js"></script>
</head>
<body>
<div class="footbg">
<div class="wrap">
 <%@ include file="/english/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
     <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span class="hover"><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2"><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2"><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/introWebEn.do">Group Profile</a>      
    <a href="/english/queryRemeberTheBigEn.do">Honor</a>      
    <a href="/english/queryRemeberBigEn.do">Highlights</a>      
    <a href="/english/queryFactoryEnvironmentEn.do">Workshop</a>      
    <a href="/english/enterprisesWebEn.do">Member  Enterprises</a>      
    <a href="/english/queryContactEn.do">Contact Us</a>
    <a href="/english/videoWebEn.do">Company Sight</a>
    </div>
    
    
     <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/english/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">About us </span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
                 		<li><a href="/english/introWebEn.do">Group Profile</a></li>
                        <li><a href="/english/queryRemeberTheBigEn.do">Honor</a></li>
                        <li ><a href="/english/queryRemeberBigEn.do">Highlights</a></li>
                        <li><a href="/english/queryFactoryEnvironmentEn.do">Workshop</a></li>
                        <li><a href="/english/enterprisesWebEn.do">Member  Enterprises</a></li>
                        <li class="hover"><a href="/english/queryContactEn.do">Contact Us</a></li>
                    	<li><a href="/english/videoWebEn.do">Company Sight</a></li>
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/introWebEn.do">About us</a>-Contact Us
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Contact Us</h2>
                 </div>
                 
                 
                 
                 <div class="mcon3">
             			<div class="contact">
               		    	 
               		    	 
               		    	 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"width="657" height="469">
					             <param name="movie" value="/english/contactSwf/map2.swf" />
					             <param name="quality" value="high" />
					             <param name="wmode" value="transparent" />
					             <embed src="/english/contactSwf/map2.swf" width="657" height="469" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent" ></embed>
					       </object>
               		    	
                        </div>
          </div>
        
        </div>
    <!-- mright end -->
    
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
    <%@ include file="/english/foot.jsp"%>
  <!-- foot end -->
  
  
</div>
</div>

	 
</body>
</html>
