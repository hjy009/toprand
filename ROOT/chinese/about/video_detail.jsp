<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%
	List imageList = (List)request.getAttribute("imageList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-�»������</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script src="/chinese/js/swfobject.js" type="text/javascript"></script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <div class="head">
   <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li class="hover"><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/introWeb.do">���Ÿſ�</a>      
    <a href="/chinese/queryRemeberTheBig.do">��ҵ����</a>      
    <a href="/chinese/queryRemeberBig.do">���Ŵ��¼�</a>      
    <a href="/chinese/queryFactoryEnvironment.do">��������</a>      
    <a href="/chinese/enterprisesWeb.do">��Ա��ҵ</a>      
    <a href="/chinese/queryContact.do">��ϵ��ʽ</a>
    <a href="/chinese/videoWeb.do">������Ӱ</a>
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
            	<span class="sp_t1">�»������</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/introWeb.do">���Ÿſ�</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">��ҵ����</a></li>
                        <li><a href="/chinese/queryRemeberBig.do">���Ŵ��¼�</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">��������</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">��Ա��ҵ</a></li>
                        <li><a href="/chinese/queryContact.do">��ϵ��ʽ</a></li>
                        <li class="hover"><a href="/chinese/videoWeb.do">������Ӱ</a></li>
                    
                
                
                </ul>
            
            </div>
            
             <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/introWeb.do">�»������</a>-������Ӱ
                 
</div>
                 
                 <div class="mtitle">
                 	<h2>������Ӱ</h2>
                 </div>
                 
                 
                 <div class="mcon3">

                 <div class="video_big">
	                 <center>
			 			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
	            	</center>
	            	
	                 <script type="text/javascript">
	              		var s1 = new SWFObject("/chinese/js/flvplayer.swf","single","603","410","7");
	                	var path ="/<ww:property value='modelVideo.path'/>";       
	                	var imagePath ="/<ww:property value='modelVideo.imagePath'/>";
		                s1.addParam("allowfullscreen","true");
		                s1.addVariable("autostart","false");	//��ʱ�Զ�����
		                s1.addVariable("file",path);
		                s1.addVariable("image",imagePath);	//����ͼƬ�ĵ���
		                s1.addVariable("width","603");
		                s1.addVariable("height","410");
		                s1.write("player1");
		            </script>
		            
                 	</div>
                 <p class="cls"></p>
                 <p align="center" class="b hei f14"><ww:property value="modelVideo.name"/></p>
                   
                  
                   
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
