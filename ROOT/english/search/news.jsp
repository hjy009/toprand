<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
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
<script language="javascript">
	function gotoPage(pno){
		url = "/english/searchNewsEn.do?pageNumber="+pno+"&name=<ww:property value='name'/>";
		window.location.href=url;
	}
</script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/english/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2" ><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"  ><span class="hover" ><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li  ><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3" ><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <%--
     <a href="/english/cultureWeb.do?id=29">集团纲领</a>   
     <a href="/english/cultureByDutyWeb.do?id=35">社会责任</a>      
    --%>
  <a href="/english/queryQiyeNewsEn.do">Company News</a>      
    <a href="/english/queryHyeNewsEn.do">Industry News</a>  
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
                    	<form id="form1" name="form1" action="">
                    		<input name="name" id="names" type="text" class="txt_search3" /><span>按分类:</span>
                    		<select id="types"  class="slt_tyle">	
				              <option value="0">news</option>
				  	  		<option value="1">products</option>
				  	  		</select>
                       	 	<input name="" type="button" value="" class="btn_search3"  onclick="javascript:SearchNews();"/>
                   		</form>
                    </div>
            </div>
            
            <ul class="searchlist">
            	<%if(list!=null&&list.size()>0){%>
	  				<%for(int i=0;i<list.size();i++){
						Map map = (Map)list.get(i);
					%>
            		<li>
                    		<p>
                    			<a  target="_blank" <%if(map.get("center_id").equals(1)) {%> href="queryQiyeNewsDetailEn.do?newsId=<%=map.get("id")%>#mright"<%} else{%> href="queryHyeNewsDetailEn.do?newsId=<%=map.get("id")%>#mright"<%} %>><%=map.get("title") %></a><label><%=map.get("click") %>次</label>
                    		</p>
                            <span><%=DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),"yyyy-MM-dd")%></span>
                    </li>
                <%} %> 
                  <%} %>  
                   
                    
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
function SearchNews(){		
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