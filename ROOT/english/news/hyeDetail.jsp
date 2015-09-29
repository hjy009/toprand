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
	List processList = (List)request.getAttribute("processList");
	Integer years = (Integer)request.getAttribute("years");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-News Center" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-News Center" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-News Center</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
	function goHistory(){
		window.history.go(-1);
	}
	function queryByYear(obj){
		if(obj.value==''&&obj.value==null){
			alert('Please select');
			return;
		}
		window.location.href= "/english/queryHyeNewsEn.do?years="+obj.value;	
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
      <li class="nlist2" ><span class="hover" ><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li  ><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/queryQiyeNewsEn.do">Company News</a>      
    <a href="/english/queryHyeNewsEn.do">Industry News</a>      
  
    </div>
 
    <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban"><%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/english/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">News Center</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    		<li ><a href="/english/queryQiyeNewsEn.do">Company News</a></li>
                        <li class="hover"><a href="/english/queryHyeNewsEn.do">Industry News</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
            <div class="news_sel">
             <form action="" id="forms" name="forms">
            When browsing:<select id="years" name="years" style="width:132px;" onchange="queryByYear(this)">
            <option value="">Please select</option>
            <%
            if(processList!=null&processList.size()>0){
         	   for(int i=0;i<processList.size();i++){
					Map map = (Map)processList.get(i);
			%>
				 <option value="<%=map.get("year") %>" ><%=map.get("year") %></option>
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
         
            <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/queryQiyeNewsEn.do">News Center</a>-Industry News
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Industry News</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             	<div  class="news_title" >
                		<h2 ><ww:property value="news.title"/></h2>
                </div>
                <p class="em hei9 Arial"><ww:property value="@cn.com.netmovie.helper.DateHelper@toString(news.pubTime,'yyyy-MM-dd')"/></p>
                <div class="news_con">
                
               <ww:property value="news.content"/>
                
                <div class="news_con2">
           		  <span>
                  <p>
                  	<c:choose>
                  		<c:when  test="${lastnew!=null}">
                  			<a href="queryQiyeNewsDetailEn.do?newsId=${lastnew.id }"><label class="hei6">Page Up：</label>${lastnew.title}</a>
                  		</c:when>
                  		<c:otherwise>
                  		</c:otherwise>
                  	</c:choose>
                  </p>
                  <p>
                 
                  <c:choose>
                  		<c:when test="${nextnew!=null}">
                  			 <a href="queryQiyeNewsDetailEn.do?newsId=${nextnew.id }"><label class="hei6">Page Down：</label>${nextnew.title}</a>
                  		</c:when>
                  		<c:otherwise>
                  		</c:otherwise>
                  	</c:choose>
                  
                  </p>
                  </span>
                        
                        <a href="javascript:goHistory(-1);" style=" float:right"><img src="/english/images/return.jpg" width="51" height="23" /></a>
                </div>
                 	
              
              
                   
                   
                </div>
        
        </div>
       
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
  <%@ include file="/english/foot.jsp"%>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
