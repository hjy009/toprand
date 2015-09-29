<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.helper.*"%>
<%
	List t1List = (List)request.getAttribute("t1List");
	List t2List = (List)request.getAttribute("t2List");
	List imageList = (List)request.getAttribute("imageList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-新华昌简介</title>
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
               
                    	<li class="hover"><a href="/chinese/introWeb.do">集团概况</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">企业荣誉</a></li>
                        <li><a href="/chinese/queryRemeberBig.do">集团大事记</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">厂区环境</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">成员企业</a></li>
                        <li><a href="/chinese/queryContact.do">联系方式</a></li>
                    	<li><a href="/chinese/videoWeb.do">集团掠影</a></li>
                
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="#">新华昌简介</a>-集团纲领
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>集团概况</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             
                   <ww:property value="me.content" />
                  
                   
                   <p><strong class="hei3">新华昌集团有限公司下属的主要成员企业有</strong>：</p>
              
                   <%
                    %>
                   <div class="abouttab">
                   		<h3>控股企业:</h3>
                   	<ul class="aboutlist">
                   	<%
                    		if(t1List!=null&&t1List.size()>0){
                   				for(int i=0;i<t1List.size();i++){
                   					Map map = (Map)t1List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWeb.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
				                       <%=NewStringHelper.truncate((String)map.get("remarks"),42,"....") %>
				                        </li>
                   						
                   						<%	
                   					}
                   					
                   				}
                   		
                   		 %>
                    
                    </ul>
                   
                   </div>
                   
                   <div class="abouttab">
                   		<h3>非控股企业:</h3>
                   	<ul class="aboutlist">
                    	<%
                    		if(t2List!=null&&t2List.size()>0){
                   				for(int i=0;i<t2List.size();i++){
                   					Map map = (Map)t2List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWeb.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
				                       <%=NewStringHelper.truncate((String)map.get("remarks"),42,"....") %>
				                        </li>
                   						
                   						<%	
                   					}
                   					
                   				}
                   		
                   		 %>
                        
                        <%--<li class="noright">
                        <p class="ptitle"><a href="#">华通焊丝</a></p>
                        <p>常州新华昌国际集装箱有限公司（常州新华昌）是新华昌集团下属第一家专业集装箱生产企业……</p>
                        </li>
                 
                    
                    --%></ul>
                   
                   </div>

                   
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
