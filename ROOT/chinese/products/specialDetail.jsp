<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
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
<title>新华昌集团有限公司-产品与客户</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;"><a href="../index.html" class="ahome">首页</a></li>
      <li><a href="../about/index.html">新华昌简介</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="../news/index.html">新闻中心</a></li>
      <li><a href="../job/index.html">员工与招聘</a></li>
      <li class="hover"><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg"><a href="../contact/index.html">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/chinese/queryProduct.do?categoryId=1">主要产品</a>      
    <a href="/chinese/queryCategoryById.do?categoryId=11">主要客户</a>    
  
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
            	<span class="sp_t1">产品与客户</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/chinese/queryProduct.do?categoryId=1">主要产品</a>
                        
                        		<ul>
                                	<li ><a href="/chinese/queryProduct.do?categoryId=1">国际标准集装箱</a></li> 
									<li class="hover"><a href="/chinese/querySpeciaIndex.do?categoryId=4">特种干货集装箱</a></li>  
									<li ><a href="/chinese/queryPottypeIndex.do?categoryId=10">罐式集装箱</a></li> 
                                </ul>
                        
                        
                        </li>
                        <li><a href="/chinese/queryCategoryById.do?categoryId=11">主要客户</a></li>
                     
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/queryProduct.do?categoryId=1">主要产品</a>-特种干货集装箱
                 
   </div>
                 
                 <div class="mtitle">
                 	<h2><ww:property value="modelProduct.name"/></h2>
                 </div>
                 
                 
                 <div class="mcon2">
                   	<p align="center"><img src="/<ww:property value="modelProduct.smallImage"/>" width="363" height="321" /></p>  
                    <p align="center" style=" margin-top:18px;">
                   	 <ww:property value="modelProduct.content"/>
                    
                    </p>   
                   
                      
                 </div>
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
 <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
