<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%
List imageList = (List)request.getAttribute("imageList");
Pagination pageUtil = (Pagination)request.getAttribute("pages");
List list = (List)pageUtil.getList();
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


<script language="javascript">
	function gotoPage(pno){
		url = "/english/queryPottypeIndexEn.do?categoryId=10&pageNumber="+pno;
		window.location.href=url;
	}
	
	function showDiv(n){
		document.getElementById(n).style.display='block';
		document.getElementById('bg').style.display='block';
	}
	
	
	function closeDiv(n){
		document.getElementById(n).style.display='none';
		document.getElementById('bg').style.display='none';
	}
</script>
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
      <li class="nlist3" ><span class="hover" ><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/queryProductEn.do?categoryId=1">Main Products</a>      
    <a href="/english/queryCategoryByIdEn.do?categoryId=11">Customers</a>      
  
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
               
                    	<li class="hover"><a href="/english/queryProductEn.do?categoryId=1">Main Products</a>
                        
                        		<ul>
                                	<li ><a href="/english/queryProductEn.do?categoryId=1">ISO Standard Containers</a></li> 
									<li ><a href="/english/querySpeciaIndexEn.do?categoryId=4">Special Containers</a></li>  
									<li class="hover"><a href="/english/queryPottypeIndexEn.do?categoryId=10">Tank Containers</a></li> 
                                </ul>
                        
                        
                        </li>
                        <li><a href="/english/queryCategoryByIdEn.do?categoryId=11">Customers</a></li>
                     			
                				
                </ul>
            
            </div>
           <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/queryProductEn.do?categoryId=1">Main Products</a>-Tank Containers
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2> Tank Containers</h2>
                 </div>
                 
                 
                 <div class="mcon2">
                      <ul class="prolist">
                       <%if(list!=null&&list.size()>0){%>
			  				<%for(int i=0;i<list.size();i++){
								Map map = (Map)list.get(i);
							%>
                      	<li <%if(i%3==2) {%> class="noright" <%=i%><%} %>>
                        <p  class="pimg"><a href="javascript:showDiv(<%=i%>)"  ><img src="/<%=map.get("small_image") %>" width="187" height="121" /></a></p> 
                        
                        <p class="plist"><a href="javascript:showDiv(<%=i%>)"  ><%=map.get("name") %></a></p>
                        
                        
                       <div id="<%=i%>" class="mydiv" style="display:none">
						 <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>关闭</strong></a></div>
						  
						 <div class="popbox">
						   <!-- <iframe id="ShowProduct" src="/english/products/box.jsp" style="width:100%;height:100%;" frameborder="0" scrolling="auto"></iframe> -->
						
						 <div class="box">
							 <p style="text-align:center"><img src="/<%=map.get("small_image") %>" width="496" height="321" /></p>
							
							 
							
			                    <%=map.get("content") %>
			                    
						 </div>
						 </div>
						  <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>关闭</strong></a></div>
						
						</div>
						
						<div id="bg" class="bg" style="display:none;"></div>
                      	<%} %> 
                      <%}else{ %>
                      	暂无
                      <%} %>  
                        
                      
                      </ul>
                      <div class="cls"></div>
                       <div id="bg" class="bgdiv" style=" display:none"></div>
                      
                      <div class="pages">
                      
                     <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">Page Up</a><%}else{%><a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >Page Up</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a>
	 						<%}%><%if((pageUtil.getPageNumber()-1)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a>
	 						<%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%>
							<%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%>
	 					<a class="fanye fyover" >Page Down</a><%}else{%>
	 					<a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >Page Down</a>
	 					<%}%> 
	 					total<%=pageUtil.getTotalCount()%>strip  current<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>page
                      
                  
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
