<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.newhc.admin.helper.NewStringHelper"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
	List imageList = (List)request.getAttribute("imageList");
	Pagination pageUtil = (Pagination)request.getAttribute("pages");
	List list = (List)pageUtil.getList();
	List processList = (List)request.getAttribute("processList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-新闻中心</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script language="javascript">
	function gotoPage(pno){
	var t = document.getElementById("years");
	var val=t.options[t.selectedIndex].value;
		url = "/chinese/queryHyeNews.do?pageNumber="+pno+"&years="+val;
		window.location.href=url;
	}
	function queryByYear(obj){
	if(obj.value==''&&obj.value==null){
			alert('请选择');
			return;
		}
		window.location.href= "/chinese/queryHyeNews.do?years="+obj.value;		
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
      <li ><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li class="hover"><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li ><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/queryQiyeNews.do">企业新闻</a>      
    <a href="/chinese/queryHyeNews.do">行业新闻</a>    
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
            	<span class="sp_t1">新闻中心</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/queryQiyeNews.do">企业新闻</a></li>
                        <li class="hover"><a href="/chinese/queryHyeNews.do">行业新闻</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
            <div class="news_sel">
           <form action="" id="forms" name="forms">
            年份浏览:<select id="years" name="years" style="width:132px;" onchange="queryByYear(this)" >
            <option value="">请选择</option>
            <%
            if(processList!=null&processList.size()>0){
         	   for(int i=0;i<processList.size();i++){
					Map map = (Map)processList.get(i);
			%>
				 <option  value="<%=map.get("year") %>" ><%=map.get("year") %></option>
			<%}} %>
            </select>
            <script type="text/javascript">
			   var the_id = '${years}';      // option_id 是后台传回的option标签的ID值。
			  window.onload=function(){display(the_id)}
			  function display(optionID)
				{
				   var all_options = document.getElementById("years").options;
				   for (i=0; i<all_options.length; i++)
				   {
				      if (all_options[i].value == optionID)  // 根据option标签的ID来进行判断  测试的代码这里是两个等号
				      {
				     	
				         all_options[i].selected = true;
				         all_options.value== optionID;
				         
				      }
				   }
				}


			   
			</script>

            
            </form>
            </div>
            
            
            </div>
         
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/queryQiyeNews.do">新闻中心</a>-行业新闻
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>行业新闻</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             
                 <ul class="newslist">
                 <%if(list!=null&&list.size()>0){%>
		  				<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
                    	<li>
		                    <p class="pli"><span><%=map.get("click")%>次</span><a href="queryHyeNewsDetail.do?newsId=<%=map.get("id")%>#mright" ><%=NewStringHelper.truncate((String)map.get("title"),60,"...")%></a></p>
		                    <p class="ptext"><%=DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),"yyyy-MM-dd")%></p>	
		                    </li>
						<%}%>
		  			<%}else{%>
		  			暂无
		  			<%}%>
                 
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
