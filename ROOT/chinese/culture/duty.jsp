<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%

	List columnFlashList = (List) request.getAttribute("columnFlashList");
	List mptList = (List) request.getAttribute("mptList");
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-��ҵ�Ļ�</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
     <li class="hover"><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
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
    <a href="queryAlbumType.do">���ӻ���</a>   
    <a href="/chinese/queryEjournals.do?typeId=13">�»�������</a>
    </div>
  
    <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="996" height="246">
              <%if(columnFlashList!=null&&columnFlashList.size()>0){
					Map imageMap = (Map)columnFlashList.get(0);
			%> 
                <param name="movie" value="/<%=imageMap.get("flash")%>" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <embed src="/<%=imageMap.get("flash")%>" width="991" height="246" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent" ></embed>
              </object>
            <%}else{%>
            ������ĿͼƬ
			<%
			}%>
  
  </div>
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">��ҵ�Ļ�</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist1">
               
                    	<%--
                    	<li ><a href="/chinese/cultureWeb.do?id=29">���Ÿ���</a></li>
                    	 <li  class="hover"><a href="/chinese/cultureByDutyWeb.do?id=35">�������</a></li>	 
                        --%>
                        <li><a href="/chinese/cultureByVisionWeb.do?id=36">Ը����ʹ��</a></li>	
                        <li><a href="/chinese/cultureByCoreWeb.do?id=31">���ļ�ֵ��</a></li>
                        <li><a href="/chinese/cultureByTargetWeb.do?id=32">��ҵĿ��</a></li>
                        <li><a href="/chinese/cultureByEnterpriseWeb.do?id=33">����������</a></li>
                        <li><a href="/chinese/cultureByCustomerWeb.do?id=34">�ͻ���Ա��</a></li>
                        <li><a href="queryAlbumType.do">���ӻ���</a></li>
                  		<li><a class="hover" href="javascript:void(0);" onclick="setTab22('dd1','pp1')" id="pp1">�»�������</a>
                        	<div  id="dd1" style="display:none">
                        		<ul>
                       				<%
                       					if (mptList != null && mptList.size() > 0) {
                       				 		for (int i = 0; i < mptList.size(); i++) {
                       				 		Map mptMap = (Map) mptList.get(i);

                       				 %>
                       				 <li onclick="setTab22('ddd1','ppp1')" id="ppp1">
                       				 	<a href="/chinese/queryEjournals.do?typeId=<%=mptMap.get("id") %>"><%=mptMap.get("name")%></a>
				                     </li>
                       				<%} %>
                       				<%} %>
                        		</ul>
                              </div>
                        </li>
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 		����λ��-<a href="cultureWeb.do">��ҵ�Ļ�</a>-<ww:property value="modelCulture.name"/>     
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2><ww:property value="modelCulture.name"/></h2>
                 </div>
                 
                 
                 <div class="mcon1">
                 <div class="enterprise_con">
                   		<div class="enter_left">
                                <ww:property value="modelCulture.content"/>
                   </div>
                 
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
