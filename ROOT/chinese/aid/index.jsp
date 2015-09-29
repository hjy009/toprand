<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.entity.AidPart"%>
<%
	List imageList = (List)request.getAttribute("imageList");
	List aidPartList = (List)request.getAttribute("aidPartList");
	AidPart aidpart= (AidPart)request.getAttribute("aidpart");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-������Ŀ</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="../js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
   <%@ include file="/chinese/head.jsp"%>
  <!-- nav --> 
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li><a href="/chinese/introWeb.do">�»������</a></li>
      <li class="hover"><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <%--
     <a href="/chinese/cultureWeb.do?id=29">���Ÿ���</a>   
     <a href="/chinese/cultureByDutyWeb.do?id=35">�������</a>      
    --%>
    <a href="/chinese/cultureByVisionWeb.do?id=36">Ը����ʹ��</a>
    <a href="/chinese/cultureByCoreWeb.do?id=31">���ļ�ֵ��</a>      
    <a href="/chinese/cultureByTargetWeb.do?id=32">��ҵĿ��</a>      
    <a href="/chinese/cultureByEnterpriseWeb.do?id=33">����������</a> 
    <a href="/chinese/cultureByCustomerWeb.do?id=34">�ͻ���Ա��</a>      
    <a href="/chinese/queryEjournals.do?typeId=13">�»�������</a>
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
            	<span class="sp_t1">������Ŀ</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<%
                			if(aidPartList.size()>0&&aidPartList!=null){
                				for(int i=0;i<aidPartList.size();i++){
                					Map mapAidPart = (Map)aidPartList.get(i);
                		 %>
                        		<li <%if(mapAidPart.get("id").equals(aidpart.getId())) {%> class="hover"<%} %>><span><a href="queryAid.do?id=<%=mapAidPart.get("id") %>"><%=mapAidPart.get("name") %> </a></span></li>
                        <%}} %>
                </ul>
            
            </div>
            
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="#">������Ŀ</a>-<%=aidpart.getName() %>
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2><%=aidpart.getName() %></h2>
                 </div>
                 
                 
                 
                 
                 
                 <div class="mcon3">
             			<p class="em"><%=aidpart.getContent() %></p>
                </div>
        
        </div>
    <!-- mright end -->
    
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
