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
	List remberList = (List)request.getAttribute("remberList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-新华昌简介</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/chinese/js/jquery.js"></script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li class="hover"><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
   <div class="subnav">
    <a href="/chinese/introWeb.do">集团概况</a>      
    <a href="/chinese/queryRemeberTheBig.do">企业荣誉</a>      
    <a href="/chinese/queryRemeberBig.do">集团大事记</a>      
    <a href="/chinese/queryFactoryEnvironment.do">厂区环境</a>      
    <a href="/chinese/enterprisesWeb.do">成员企业</a>      
    <a href="/chinese/queryContact.do">联系方式</a>
    <a href="/chinese/videoWeb.do">集团掠影</a>
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
			<%}%></div>
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">新华昌简介</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	 <li><a href="/chinese/introWeb.do">集团概况</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">企业荣誉</a></li>
                        <li class="hover"><a href="/chinese/queryRemeberBig.do">集团大事记</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">厂区环境</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">成员企业</a></li>
                        <li><a href="/chinese/queryContact.do">联系方式</a></li>
                    	<li><a href="/chinese/videoWeb.do">集团掠影</a></li>
                    
                    
                
                
                </ul>
            
            </div>
            
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/introWeb.do">新华昌简介</a>-集团大事记
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>集团大事记</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             		<div class="big_con">
                    
                    
          
                    
                    
                       <div class=slide-pic id=slidePic>
				<A class=gray id=prev hideFocus href="javascript:;"></A> 
               
				<div class=pic-container>
					<UL>
					<%if(remberList!=null&&remberList.size()>0){%>
				  				<%for(int i=0;i<remberList.size();i++){
									Map map = (Map)remberList.get(i);
								%>
										<li <%if(i+1==remberList.size()){ %> style=" margin-right:0;" <%} %><%if(i==0){ %>class="hover"  <%}%> onclick="setTab('tt',<%=i+1%>,<%=remberList.size() %>)" id="tt<%=i+1%>" ><a href="javascript:"><%=map.get("year")%></a></li>
		                                 
								<%}%>
				  			<%}else{%>
				  			暂无
				  			<%}%>
					</UL>
				</div>
                 <A id=next hideFocus href="javascript:;"></A>
				 
			  </div>　　
              
              <SCRIPT type=text/javascript>
			
			
			jQuery(function(){
			if (!$('#slidePic')[0]) 
			return;
			var i = 0, p = $('#slidePic ul'), pList = $('#slidePic ul li'), len = pList.length;
			var elePrev = $('#prev'), eleNext = $('#next');
			//var firstClick = false;
			var w = 44, num = 14;
			p.css('width',w*len);
			if (len <= num) 
			eleNext.addClass('gray');
			function prev(){
			if (elePrev.hasClass('gray')) {
			//alert('已经是第一张了');
			return;
			}
			p.animate({
			marginLeft:-(--i) * w
			},500);
			if (i < len - num) {
			eleNext.removeClass('gray');
			}
			if (i == 0) {
			elePrev.addClass('gray');
			}
			}
			function next(){
			if (eleNext.hasClass('gray')) {
			//alert('已经是最后一张了');
			return;
			}
			//p.css('margin-left',-(++i) * w);
			p.animate({
			marginLeft:-(++i) * w
			},500);
			if (i != 0) {
			elePrev.removeClass('gray');
			}
			if (i == len - num) {
			eleNext.addClass('gray');
			}
			}
			elePrev.bind('click',prev);
			eleNext.bind('click',next);
			pList.each(function(n,v){
			$(this).click(function(){
			if(n-i == 2){
			next();
			}
			if(n-i == 0){
			prev()
			}
			$('#slidePic ul li.cur').removeClass('cur');
			$(this).addClass('cur');
			
			}).mouseover(function(){
			
			}).mouseout(function(){
			
			})
			});
		
			
			});
			</SCRIPT>

               		 
                    </div>
                    
                    <div class="big_con2">
                    		 <%if(remberList!=null&&remberList.size()>0){%>
						  				<%for(int i=0;i<remberList.size();i++){
											Map map = (Map)remberList.get(i);
										%>
                    		<div id="con_tt_<%=i+1%>" <%if(i+1==1){ %> style=" display:block;" <%}else{ %>style=" display:none;"<%} %> >
				                                 <%=(String)map.get("content")%>
                            </div>
                            	<%}%>
						  			<%}else{%>
						  			暂无
						  			<%}%>
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
