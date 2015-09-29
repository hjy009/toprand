<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%
	List imageList = (List)request.getAttribute("imageList");
	List list = (List)request.getAttribute("list");
%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Contact us</title>
<link rel="stylesheet" type="text/css" href="/english//css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
 <%@ include file="/english/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2" ><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2"  ><span class="hover"><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/queryModelContactEn.do">Contact Us</a>       
  
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
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="../images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%>
  
  </div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">Contact Us</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/english/queryModelContactEn.do">Contact Us</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
         
            
        </div>
         
           <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/queryModelContactEn.do">Contact Us</a>-Contact Us
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Contact Us</h2>
                 </div>
                 
                 
                 <div class="mcon3">
                 
                    <%if(list!=null&&list.size()>0){
				Map map = (Map)list.get(0);%>
				<%=(String)map.get("content")%>
			<%}else{%>
			ÔÝÎÞ
			<%}%>
                   
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
