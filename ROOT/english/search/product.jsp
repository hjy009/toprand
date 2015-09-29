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
<SCRIPT src="../js/tab.js" type="text/javascript"></SCRIPT>
<script language="javascript">
	function gotoPage(pno){
		url = "/english/searchProductEn.do?pageNumber="+pno+"&name=<ww:property value='name'/>";
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
      <li class="nlist3"    ><span class="hover" ><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <%--
     <a href="/english/cultureWeb.do?id=29">集团纲领</a>   
     <a href="/english/cultureByDutyWeb.do?id=35">社会责任</a>      
    --%>
  <a href="/english/queryProductEn.do?categoryId=1">Main Products</a>      
    <a href="/english/queryCategoryByIdEn.do?categoryId=11">Main Products</a>  
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
  <div class="search3">
  			<div class="search_one">
            		<div class="search_con">
                    	<span>您搜索的“<label><ww:property value="name"/></label>”：共<%=pageUtil.getTotalCount() %>条</span>
                    	<form name="form1" id="form1" action="" action="">
                    		<input name="name" id="names" type="text" class="txt_search3" /><span>按分类:</span>
                    		<select  id="types"  class="slt_tyle">
                    		<option value="1">products</option>
                    		  <option value="0">news</option>
				  	  		
                    		</select>
                       		<input name="" type="button" value="" class="btn_search3" onclick="javascript:SearchProduct();"/>
                    	</form>
                    </div>
            </div>
            
            <ul class="prolist prolist2"  style="min-height: 300px; hieght:auto;_height:300px;">
           		 <%if(list!=null&&list.size()>0){%>
	  				<%for(int i=0;i<list.size();i++){
						Map map = (Map)list.get(i);
					%>
                      	<li>
                         <p  class="pimg"><a href="javascript:showDiv(<%=i%>)"  ><img src="/<%=map.get("small_image") %>" width="187" height="121" /></a></p> 
                        
                        <p class="plist"><a href="javascript:showDiv(<%=i%>)" ><%=map.get("name") %></a></p>
                        </li>
                        
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
                  <%}%>
                  

                        	
                      </ul>
            
            <div class="cls"></div>
                   
                   <div class="pages" style="margin-top:15px;">
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">Page Up</a><%}else{%><a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >Page Up</a><%}%>
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
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%>
	 					<a class="fanye fyover" >Page Down</a><%}else{%>
	 					<a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >Page Down</a>
	 					<%}%> 
	 					total<%=pageUtil.getTotalCount()%>strip  current<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>page
                      
                   </div>
                   
  </div>
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/english/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
function SearchProduct(){		
		var name = document.getElementById("names").value;
		var type = document.getElementById("types").value;
				var form = document.getElementById("form1");
				if(name==""||name=="Please enter the keywords"){
					alert('Please enter the keywords');
					return ;
				}
				if(type==0)
					form1.action="/chinese/searchNewsEn.do";
				if(type==1)
					form1.action="/chinese/searchProductEn.do";
 
				form1.submit();				
}

</script>
