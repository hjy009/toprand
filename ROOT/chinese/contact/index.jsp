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
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-��ϵ����</title>
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
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="hover"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/queryModelContact.do">��ϵ����</a>       
  
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
            	<span class="sp_t1">��ϵ����</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
         
            
        </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/queryModelContact.do">��ϵ����</a>-��ϵ����
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>��ϵ����</h2>
                 </div>
                 
                 
                 <div class="mcon3">
                 
                    <%if(list!=null&&list.size()>0){
				Map map = (Map)list.get(0);%>
				<%=(String)map.get("content")%>
			<%}else{%>
			����
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
