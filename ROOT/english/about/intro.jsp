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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-ABOUT CXIC</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/english/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2"  ><span class="hover"><a href="/english/introWebEn.do">About CXIC</a></span></li>
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
			<%}%>


</div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">About us </span>

            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	 <li  class="hover"><a href="/english/introWebEn.do">Group Profile</a></li>
                        <li><a href="/english/queryRemeberTheBigEn.do">Honor</a></li>
                        <li><a href="/english/queryRemeberBigEn.do">Highlights</a></li>
                        <li><a href="/english/queryFactoryEnvironmentEn.do">Workshop</a></li>
                        <li><a href="/english/enterprisesWebEn.do">Member  Enterprises</a></li>
                        <li><a href="/english/queryContactEn.do">Contact Us</a></li>
                    	<li><a href="/english/videoWebEn.do">Company Sight</a></li>
                
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="#">About us</a>-Group Profile
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Group Profile</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             
                   <ww:property value="me.content" />
                  
                   
                   <p><strong class="hei3">CXIC Group Limited under the main member enterprises</strong>：</p>
              
                   <%
                    %>
                   <div class="abouttab">
                   		<h3>Holding enterprises:</h3>
                   	<ul class="aboutlist">
                   	<%
                    		if(t1List!=null&&t1List.size()>0){
                   				for(int i=0;i<t1List.size();i++){
                   					Map map = (Map)t1List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWebEn.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
				                       <%=NewStringHelper.truncate((String)map.get("remarks"),42,"....") %>
				                        </li>
                   						
                   						<%	
                   					}
                   					
                   				}
                   		
                   		 %>
                    
                    </ul>
                   
                   </div>
                   
                   <div class="abouttab">
                   		<h3>The non holding enterprises:</h3>
                   	<ul class="aboutlist">
                    	<%
                    		if(t2List!=null&&t2List.size()>0){
                   				for(int i=0;i<t2List.size();i++){
                   					Map map = (Map)t2List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWebEn.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
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
  <jsp:include flush="true" page="/english/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
