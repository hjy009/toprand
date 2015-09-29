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
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-联系我们</title>
<link rel="stylesheet" type="text/css" href="/chinese//css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
 <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li ><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="hover"><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/queryModelContact.do">联系我们</a>       
  
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
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="../images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%>
  
  
  

  
  </div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">联系我们</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/chinese/queryModelContact.do">联系我们</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
         
            
        </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/queryModelContact.do">联系我们</a>-联系我们
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>联系我们</h2>
                 </div>
                 
                 
                 <div class="mcon3">
                 
                    <%if(list!=null&&list.size()>0){
				Map map = (Map)list.get(0);%>
				<%=(String)map.get("content")%>
			<%}else{%>
			暂无
			<%}%>
                   
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
