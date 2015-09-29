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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Company Culture" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Company Culture" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Company Culture</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/english/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
          <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2"   ><span class="hover"><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li><span><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/cultureWebEn.do?id=29">集团纲领</a>      
    <a href="/english/cultureByCoreWebEn.do?id=38">核心价值观</a>      
    <a href="/english/cultureByTargetWebEn.do?id=39">企业目标</a>      
    <a href="/english/cultureByEnterpriseWebEn.do?id=33">精神与作风</a> 
    <a href="/english/cultureByCustomerWebEn.do?id=34">客户与员工</a>      
    <a href="/english/cultureByDutyWebEn.do?id=35">社会责任</a>
    <a href="/english/cultureByVisionWebEn.do?id=36">愿景与使命</a>
    <a href="queryAlbumTypeEn.do">电子画册</a>
    <a href="/english/queryEjournalsEn.do?typeId=13">新华昌刊物</a>
    </div>
     <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
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
            暂无栏目图片
			<%
			}%>
  
  </div>
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">企业文化</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist1">          
                         
                        <li><a class="hover" href="/english/cultureWebEn.do?id=29">集团纲领</a></li>
                        <li><a href="/english/cultureByCoreWebEn.do?id=38">核心价值观</a></li>
                        <li><a href="/english/cultureByTargetWebEn.do?id=39">企业目标</a></li>
                        <li><a href="/english/cultureByEnterpriseWebEn.do?id=33">精神与作风</a></li>
                        <li><a href="/english/cultureByCustomerWebEn.do?id=34">客户与员工</a></li>
                        <li ><a href="/english/cultureByDutyWebEn.do?id=35">社会责任</a></li>
                   		<li><a href="/english/cultureByDutyWebEn.do?id=35">愿景与使命</a></li>
                   		<li><a href="queryAlbumTypeEn.do">电子画册</a></li>
                		<li class="hover"><a href="javascript:void(0);" onclick="setTab22('dd1','pp1')" id="pp1">新华昌刊物</a>
                        	<div  id="dd1" style="display:none">
                        		<ul>
                       				<%
                       					if (mptList != null && mptList.size() > 0) {
                       				 		for (int i = 0; i < mptList.size(); i++) {
                       				 		Map mptMap = (Map) mptList.get(i);

                       				 %>
                       				 <li onclick="setTab22('ddd1','ppp1')" id="ppp1">
                       				 	<a href="/english/queryEjournals.do?typeId=<%=mptMap.get("id") %>"><%=mptMap.get("name")%></a>
				                     </li>
                       				<%} %>
                       				<%} %>
                        		</ul>
                              </div>
                        </li>
                </ul>
            
            </div>
            
           <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="cultureWebEn.do">企业文化</a>-<ww:property value="modelCulture.name"/>     
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2><ww:property value="modelCulture.name"/></h2>
                 </div>
                 
                 
                 <div class="mcon1">
                 	<ww:property value="modelCulture.content"/>
                </div>
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/english/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
