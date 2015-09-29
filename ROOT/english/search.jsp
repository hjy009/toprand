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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Search</title>
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
      <li ><span ><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2"><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2"><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span class="hover"><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2"><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/queryProductEn.do?categoryId=1">��Ҫ��Ʒ</a>      
    <a href="/english/queryCategoryByIdEn.do?categoryId=11">��Ҫ�ͻ�</a>      
  
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
            	<span class="sp_t1">��Ʒ��ͻ�</span>
                <span class="sp_t2">PRODUCTS AND CUSTOMER</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="#">��Ҫ��Ʒ</a>
                        
                        		<ul>
                                	<li class="hover"><a href="/english/queryProductEn.do?categoryId=1">���ʱ�׼��װ��</a></li> 
									<li ><a href="/english/querySpeciaIndexEn.do?categoryId=4">���ָɻ���װ��</a></li>  
									<li ><a href="/english/queryPottypeIndexEn.do?categoryId=10">��ʽ��װ��</a></li> 
                                
                                </ul>
                        
                        
                        </li>
                        <li><a href="/english/queryCategoryByIdEn.do?categoryId=11&productName=���˹�˾">��Ҫ�ͻ�</a></li>
                     			
                				
                </ul>
            
            </div>
            
           <div class="leftad"><a href="#"><img src="/english/images/mleft1.png" width="291" height="90" /></a></div>
            
            <div class="leftad"><a href="#"><img src="/english/images/mleft2.png" width="291" height="90" /></a></div>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="#">��Ҫ��Ʒ</a>-���ʱ�׼��װ��
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2> ���ʱ�׼��װ��</h2><span>INTERNATIONAL STANDARD CONTAINER</span>
                 </div>
                 
                 
                 <div class="mcon2">
                      <ul class="prolist">
                       <%if(list!=null&&list.size()>0){%>
			  				<%for(int i=0;i<list.size();i++){
								Map map = (Map)list.get(i);
							%>
                      	<li <%if(i!=0&&i%2==0) {%> class="noright" <%=i%><%} %>>
                        <p class="pimg"><a href="/english/queryProductByIdEn.do?productId=<%=map.get("id") %>"><img src="/<%=map.get("small_image") %>" width="187" height="121" /></a></p> 
                        
                        <p class="plist"><a href="/english/queryProductByIdEn.do?productId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
                        </li>
                      	<%} %> 
                      <%} %>  
                        
                      
                      </ul>
                      <div class="cls"></div>
                      
                      
                      <div class="pages">
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">��һҳ</a><%}else{%><a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >��һҳ</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a>
	 						<%}%>&nbsp;<%if((pageUtil.getPageNumber()-1)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a>
	 						<%}%>
							<%=pageUtil.getPageNumber()%>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%>
							&nbsp;<%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--��һҳ-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%>
	 					<a class="fanye fyover" >��һҳ</a><%}else{%>
	 					<a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >��һҳ</a>
	 					<%}%> 
	 					��<%=pageUtil.getTotalCount()%>��  ��ǰ<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>ҳ
                      
                  
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
