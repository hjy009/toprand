<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%
	List imageList = (List)request.getAttribute("imageList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-新华昌简介</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script src="/chinese/js/swfobject.js" type="text/javascript"></script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <div class="head">
   <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li class="hover"><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/introWeb.do">集团概况</a>      
    <a href="/chinese/queryRemeberTheBig.do">企业荣誉</a>      
    <a href="/chinese/queryRemeberBig.do">集团大事记</a>      
    <a href="/chinese/queryFactoryEnvironment.do">厂区环境</a>      
    <a href="/chinese/enterprisesWeb.do">成员企业</a>      
    <a href="/chinese/queryContact.do">联系方式</a>
    <a href="/chinese/videoWeb.do">集团掠影</a>
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
			<%}%>
  </div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">新华昌简介</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/introWeb.do">集团概况</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">企业荣誉</a></li>
                        <li><a href="/chinese/queryRemeberBig.do">集团大事记</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">厂区环境</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">成员企业</a></li>
                        <li><a href="/chinese/queryContact.do">联系方式</a></li>
                        <li class="hover"><a href="/chinese/videoWeb.do">集团掠影</a></li>
                    
                
                
                </ul>
            
            </div>
            
             <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/introWeb.do">新华昌简介</a>-集团掠影
                 
</div>
                 
                 <div class="mtitle">
                 	<h2>集团掠影</h2>
                 </div>
                 
                 
                 <div class="mcon3">

                 <div class="video_big">
	                 <center>
			 			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
	            	</center>
	            	
	                 <script type="text/javascript">
	              		var s1 = new SWFObject("/chinese/js/flvplayer.swf","single","603","410","7");
	                	var path ="/<ww:property value='modelVideo.path'/>";       
	                	var imagePath ="/<ww:property value='modelVideo.imagePath'/>";
		                s1.addParam("allowfullscreen","true");
		                s1.addVariable("autostart","false");	//打开时自动播放
		                s1.addVariable("file",path);
		                s1.addVariable("image",imagePath);	//封面图片的调用
		                s1.addVariable("width","603");
		                s1.addVariable("height","410");
		                s1.write("player1");
		            </script>
		            
                 	</div>
                 <p class="cls"></p>
                 <p align="center" class="b hei f14"><ww:property value="modelVideo.name"/></p>
                   
                  
                   
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
