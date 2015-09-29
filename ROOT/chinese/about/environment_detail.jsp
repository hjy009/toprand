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
	List list = (List)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-新华昌简介</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
  <script type="text/javascript" src="/chinese/js/jquery-1.6.4.min.js"></script>
  <script type="text/javascript" src="/chinese/js/min_contentslider.js"></script>

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
			<%}%>
  </div>
  
  
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
                    <li><a href="/chinese/queryRemeberBig.do">集团大事记</a></li>
                    <li  class="hover"><a href="/chinese/queryFactoryEnvironment.do">厂区环境</a></li>
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
                 	您的位置-<a href="/chinese/introWeb.do">新华昌简介</a>-厂区环境
                 
                 
   </div>
                 
                 <div class="mtitle">
                 	<h2>厂区环境</h2>
                 </div>
                 
                 
                 <div class="mcon3">
        
              
  <style type="text/css">

#focus{width:660px; height:397px;overflow:hidden;position:relative;}
#focus .focus_view{width:660px;height:334px;overflow: hidden;}
#focus .focus_view ul{position:relative;width:660px;height:334px;}
#focus .focus_view li{position:absolute;border:1px solid #dfdfdf; background:#f6f6f6; width:658px; height:332px; text-align:center;top:0px;left:0px;filter:alpha(opacity:0);opacity:0; overflow:hidden;}
#focus .focus_view img{ margin:0 auto;}
#focus .focus_text{position:absolute;left:0;top:310px;padding: 0 15px;background:rgba(0,0,0,0.5);filter: progid:DXImageTransform.Microsoft.gradient( GradientType = 0,startColorstr = '#50000000',endColorstr = '#50000000')\9;width:595px;z-index:3; display:none;}
#focus .focus_text h3{line-height:40px;height:40px;overflow:hidden;padding-right:40px;}
#focus .focus_text h3 a{font-size:18px;color:#fff;font-family:"微软雅黑", "黑体", Arial, sans-serif;font-weight:normal;text-decoration:none}
#focus .focus_text li{display:none;}
#focus .focus_text li.show{display:block;}
#focus .focus_slider{width:660px;height:53px; margin: 0 auto;}
#focus .focus_slider .mask{width:616px;height:53px;overflow:hidden;float:left;margin-left:12px;display:inline;}

#focus .focus_slider ul{width:1232px;margin-left:0px;}
#focus .focus_slider li{float:left; width:77px; height:43px; display:inline; overflow:hidden;}
#focus .focus_slider li img{WIDTH:60px; HEIGHT:39px; border:1px solid #8b8b8b;padding:1px;}

#focus span.prev,#focus span.next{ float: left; width:14px; height:38px; cursor:pointer; margin:0;}
#focus span.prev{background:url(/chinese/images/scroll_left.jpg) no-repeat;}
#focus span.next{background:url(/chinese/images/scroll_right2.jpg) no-repeat; }
#focus span.prev:hover{background:url(/chinese/images/scroll_left2.jpg) no-repeat;}
#focus span.next:hover{background:url(/chinese/images/scroll_right.jpg) no-repeat; }


#focus li.current img{border:1px solid #db4c4c;}
#focus #num{position:absolute;right:10px;top:10px;color:#fff;font-size:14px;}


</style>    
              
              <div id="focus">
              <div id="focus_slider" class="focus_slider">   <!--缩略图-->
                            <span id="prev" class="prev" bossZone="focuspicleft"></span>
                             <div class="mask">
                                 <ul>
                                 
                                 
						<%if(list!=null&&list.size()>0){%>
						<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
							<li <%if(i==0){ %> class="current" <%} %>><a href="<%if(i==0){ %>javascript:<%} %>"><img src="" /></a></li>
						<%}%>
		  			<%}else{%>
		  			暂无
		  			<%}%>
<%--<li class="current"><a href="javascript:" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
<li ><a href="" ><img src="" /> </a></li>
                                --%></ul>
                            </div>
                            <span id="next" class="next" ></span>
					</div>
					<div id="focus_view" class="focus_view"> <!--大图-->
						<ul>
						
						<%if(list!=null&&list.size()>0){%>
						<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
							<li <%if(i==0){ %> style="filter:alpha(opacity:100);opacity:1;z-index:1;" <%} %>><a href="<%if(i==1){ %>javascript:<%} %>"><img src="" /></a></li>
						<%}%>
		  			<%}else{%>
		  			暂无
		  			<%}%>
<%--<li  style="filter:alpha(opacity:100);opacity:1;z-index:1;"><a href="" ><img  src="" /></a></li>
<li ><a href="javascript:"><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>	
<li ><a href="" ><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>
<li ><a href="" ><img src="" /></a></li>
							
						--%>
						</ul>

					</div>
					<div id="focus_text" class="focus_text" >  <!--标题-->
						<ul>
						<%if(list!=null&&list.size()>0){%>
						<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
							<li <%if(i==0){ %> class="show" <%} %>><h3><a href="" <%if(i!=0){ %> target="_blank" <%} %>></a></h3></li>
						<%}%>
		  			<%}else{%>
		  			暂无
		  			<%}%>
<%--<li  class="show"><h3><a href=""></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>
<li ><h3><a href="" target="_blank"></a></h3></li>

						--%></ul>
                        <div id="num"> <!--计数-->
                    		1/5
                    	</div>
					</div>
					
				</div>
                
              <!--code by wangchuang 2011.11.29-->
              
              
                 <script type="text/javascript">
				 		(function(){
							
							/*-------------------------编辑数据修改-------------------------------*/
							
							var data = [

 <%if(list!=null&&list.size()>0){%>
<%for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
%>
{img1:'/<%=map.get("min_image")  %>',title:'',slink:'javascript:'},
<%}%>
<%}%>


]
								  
						    /*-------------------------编辑数据修改-------------------------------*/
						  			
								var aImg = $('focus_view').getElementsByTagName('li');
								var aTxt = $('focus_text').getElementsByTagName('li');
								var aSmg = $('focus_slider').getElementsByTagName('li');
								var aaImg = $('focus_view').getElementsByTagName('img');
								var aaSmg = $('focus_slider').getElementsByTagName('img');
								var aa0 = $('focus_text').getElementsByTagName('a');
								var aa1 = $('focus_slider').getElementsByTagName('a');
								var aa2 = $('focus_view').getElementsByTagName('a');
								var oUl = $('focus_slider').getElementsByTagName('ul')[0];
								var oNum = $('num');
								var oPrev = $('prev');
								var oNext = $('next');
								for(var i=0;i<aSmg.length;i++){
									aSmg[i].index = i;  //当前添加索引
									aImg[i].index = i;
									aa0[i].href = aa1[i].href = aa2[i].href = data[i].slink;
									aa0[i].innerHTML = data[i].title;
									aaImg[i].src = aaSmg[i].src = data[i].img1;
									
									
									
									aSmg[i].onmouseover  = function(){
										for(var i=0;i<aSmg.length;i++){
											aSmg[i].className = '';
											aTxt[i].className = '';
											startMove(aImg[i],'opacity',0);
											aImg[i].style.zIndex = 1;
										}
										aSmg[this.index].className = 'current';	
										aTxt[this.index].className = 'show';
										oNum.innerHTML = this.index+1 + '/10';
										startMove(aImg[this.index],'opacity',100);
										aImg[this.index].style.zIndex = 2;
									 }
									 
									
									 
									oNext.onclick = oPrev.onclick = function(){
										if(parseInt(oUl.style.marginLeft)<0){
											startMove(oUl,'marginLeft',0);
											for(var i=0;i<aSmg.length;i++){
												aTxt[i].className = '';
												startMove(aImg[i],'opacity',0);
												aSmg[i].className = '';
												aImg[i].style.zIndex = 1;
											}
											startMove(aImg[0],'opacity',100);
											aSmg[0].className = 'current';
											aTxt[0].className = 'show';	
											oNum.innerHTML = 1 + '/10';
											aImg[0].style.zIndex = 2;
										}
										else{
									    	startMove(oUl,'marginLeft',-oUl.offsetWidth/2);
											for(var i=0;i<aSmg.length;i++){
												aTxt[i].className = '';
												startMove(aImg[i],'opacity',0);
												aSmg[i].className = '';
												aImg[i].style.zIndex = 1;
											}
											startMove(aImg[aSmg.length/2],'opacity',100);
											aSmg[aSmg.length/2].className = 'current';
											aTxt[aSmg.length/2].className = 'show';	
											oNum.innerHTML = (aSmg.length*0.5 + 1) + '/10';
											aImg[aSmg.length/2].style.zIndex = 2;
										}
									} 
								}
							})();
						 function $(id){return document.getElementById(id)};
						 function startMove(obj,attr,iTarget){     //轮换动画
							clearInterval(obj.timer);
							obj.timer = setInterval(function(){doMove(obj,attr,iTarget);},15);
						 }
						 function doMove(obj,attr,iTarget){
							 var iCur = 0;
							 if(attr == 'opacity'){
							 	iCur = parseInt(100 * getStyle(obj,attr)) || 0;
							 }
							 else{
							 	iCur = parseInt(getStyle(obj,attr)) || 0;
							 }
							 var iSpeed = (iTarget - iCur)/8;
							 iSpeed = (iSpeed>0) ? Math.ceil(iSpeed) : Math.floor(iSpeed);
							 if(iCur == iTarget){
								 clearInterval(obj.timer);
							 }
							 else if(attr == 'opacity'){
								obj.style.filter = 'alpha(opacity=' + (iCur + iSpeed) + ')';
								obj.style.opacity = (iCur + iSpeed)/100;
							 }
							 else{
							 	obj.style[attr] = iCur + iSpeed + 'px';
							 }
						 }
						 function getStyle(obj,attr){      //取样式
							 if(obj.currentStyle){
								return obj.currentStyle[attr]; 
							 }
							 else{
								return getComputedStyle(obj,false)[attr]; 
							 }
						 }
						
				</script><!--[if !IE]>|xGv00|ef5da8a12482a4263335b2324ba6e6dc<![endif]-->
              

              
              
  
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
