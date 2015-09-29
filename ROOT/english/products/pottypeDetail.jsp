<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%
	List imageList = (List)request.getAttribute("imageList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<style type="">
.pro_tab{ border-collapse:collapse;}
.pro_tab td{ line-height:30px; color:#030303; border:1px solid #030303; }
.pro_tab td .tab1{ float:left; width:117px; padding:0 5px;}
.pro_tab td .tab2{ float:left; width:516px; padding:0 5px;}
.pro_tab td .tab3{ float:left; width:178px; padding:0 5px;}
.pro_tab td .tab4{ float:left; width:131px; padding:0 5px;}
.pro_tab td .tab5{ float:left; width:187px; padding:0 5px;}
.pro_tab td .tab6{ float:left; width:643px; padding:0 5px;}
</style>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/english/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2" ><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2" ><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li  ><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"  ><span class="hover" ><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/english/queryProduct.do?categoryId=1">Main Products</a>      
    <a href="/english/queryCategoryById.do?categoryId=11">Customers</a>    
  
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
            	<span class="sp_t1">Products and Customers</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/english/queryProduct.do?categoryId=1">Main Products</a>
                        
                        		<ul>
                                	<li ><a href="/english/queryProduct.do?categoryId=1">ISO Standard Containers</a></li> 
									<li ><a href="/english/querySpeciaIndex.do?categoryId=4">Special Containers</a></li>  
									<li class="hover"><a href="/english/queryPottypeIndex.do?categoryId=10">Tank Containers</a></li> 
                                </ul>
                        
                        
                        </li>
                        <li><a href="/english/queryCategoryById.do?categoryId=11">Customers</a></li>
                     
                
                </ul>
            
            </div>
            
             <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
      </div>
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/queryProduct.do?categoryId=1">Main Products</a>->Tank Containers
                 
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
 <jsp:include flush="true" page="/english/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
