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
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-搜索</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/searchNews.do?pageNumber="+pno+"&name=<ww:property value='name'/>";
		
		
		window.location.href=url;
	}
</script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li class="hover"><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <%--
     <a href="/chinese/cultureWeb.do?id=29">集团纲领</a>   
     <a href="/chinese/cultureByDutyWeb.do?id=35">社会责任</a>      
    --%>
    <a href="/chinese/cultureByVisionWeb.do?id=36">愿景与使命</a>
    <a href="/chinese/cultureByCoreWeb.do?id=31">核心价值观</a>      
    <a href="/chinese/cultureByTargetWeb.do?id=32">企业目标</a>      
    <a href="/chinese/cultureByEnterpriseWeb.do?id=33">精神与作风</a> 
    <a href="/chinese/cultureByCustomerWeb.do?id=34">客户与员工</a>      
    <a href="/chinese/queryEjournals.do?typeId=13">新华昌刊物</a>
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
  <div class="search3">
  			<div class="search_one">
            		<div class="search_con">
                    	<span>您搜索的“<label><ww:property value="name"/></label>”：共<%=pageUtil.getTotalCount()%>条</span>
                    	<form id="form1" name="form1" action="">
                    		<input name="name" id="names" type="text" class="txt_search3" /><span>按分类:</span><select name="" class="slt_tyle"><option>新闻</option><option>产品</option></select>
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
                    			<a  target="_blank" <%if(map.get("center_id").equals(1)) {%> href="queryQiyeNewsDetail.do?newsId=<%=map.get("id")%>#mright"<%} else{%> href="queryHyeNewsDetail.do?newsId=<%=map.get("id")%>#mright"<%} %>><%=map.get("title") %></a><label><%=map.get("click") %>次</label>
                    		</p>
                            <span><%=DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),"yyyy-MM-dd")%></span>
                    </li>
                <%} %> 
                  <%} %>  
                   
                    
            </ul>
            
            <div class="cls"></div>
                   
                    <div class="pages" style="margin-top:15px;">
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">上一页</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >上一页</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a><%}%><%if((pageUtil.getPageNumber()-1)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a><%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%><%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%><a class="fanye fyover" >下一页</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >下一页</a><%}%> 总<%=pageUtil.getTotalCount()%>条  当前<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>页
                      
                      
                      </div>
                   
  </div>
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
function SearchNews(){		
		var name = document.getElementById("names").value;
				var form = document.getElementById("form1");
				if(name==""||name=="请输入关键字"){
					alert('请输入关键字');
					return ;
				}
				form.action="/chinese/searchNews.do";
				form.submit();		
}

</script>