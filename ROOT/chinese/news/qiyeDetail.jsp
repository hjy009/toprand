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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-��������</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
	function goHistory(){
		window.history.go(-1);
	}
	function queryByYear(obj){
		if(obj.value==''&&obj.value==null){
			alert('��ѡ��');
			return;
		}
		window.location.href= "/chinese/queryQiyeNews.do?years="+obj.value;
		
	
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
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li class="hover"><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li ><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/chinese/queryQiyeNews.do">��ҵ����</a>      
    <a href="/chinese/queryHyeNews.do">��ҵ����</a>    
  
    </div>
 
    <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban"><%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/chinese/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">��������</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    <li class="hover"><a href="/chinese/queryQiyeNews.do">��ҵ����</a></li>
                        <li><a href="/chinese/queryHyeNews.do">��ҵ����</a></li>
                        
                
                
                </ul>
            <div class="cls"></div>
            
            <div class="news_sel">
            <form action="" id="forms" name="forms">
            ��������<select id="years" name="years" style="width:132px;" onchange="queryByYear(this)">
            <option value="">��ѡ��</option>
            <%
            if(processList!=null&processList.size()>0){
         	   for(int i=0;i<processList.size();i++){
					Map map = (Map)processList.get(i);
			%>
				 <option value="<%=map.get("year") %>"><%=map.get("year") %></option>
			<%}} %>
            </select>
            
            <script type="text/javascript">
			   var the_id = '${years}';      // option_id �Ǻ�̨���ص�option��ǩ��IDֵ��
			  window.onload=function(){display(the_id)}
			  function display(optionID)
				{
				   var all_options = document.getElementById("years").options;
				   for (i=0; i<all_options.length; i++)
				   {
				      if (all_options[i].value == optionID)  // ����option��ǩ��ID�������ж�  ���ԵĴ��������������Ⱥ�
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
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/queryQiyeNews.do">��������</a>-��ҵ����
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>��ҵ����</h2>
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
                  			<a href="queryQiyeNewsDetail.do?newsId=${lastnew.id }"><label class="hei6">��һƪ��</label>${lastnew.title}</a>
                  		</c:when>
                  		<c:otherwise>
                  		</c:otherwise>
                  	</c:choose>
                  </p>
                  <p>
                 
                  <c:choose>
                  		<c:when test="${nextnew!=null}">
                  			 <a href="queryQiyeNewsDetail.do?newsId=${nextnew.id }"><label class="hei6">��һƪ��</label>${nextnew.title}</a>
                  		</c:when>
                  		<c:otherwise>
                  		</c:otherwise>
                  	</c:choose>
                  
                  </p>
                  </span>
                        
                        <a href="javascript:goHistory(-1);" style=" float:right"><img src="/chinese/images/return.jpg" width="51" height="23" /></a>
                </div>
                 	
              
            
                   
                   
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
