<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%

	List columnFlashList = (List) request.getAttribute("columnFlashList");
	Pagination pageUtil = (Pagination)request.getAttribute("pages");
	List list = (List)pageUtil.getList();
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
<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/queryAlbumType.do";
		window.location.href=url;
	}
</script>
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
    <a href="/chinese/cultureByCustomerWeb.do?id=34">���ӻ���</a>      
    <a href="/chinese/queryEjournals.do?typeId=13">�»�������</a>
    </div>
     <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
    </div>
    <!-- nav end -->
    
    <div class="mban">
     <%if(columnFlashList!=null&&columnFlashList.size()>0){
				Map imageMap = (Map)columnFlashList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/chinese/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
            <%}else{%>
            ������ĿͼƬ
			<%
			}%>
  
    </div>
    
    <!-- main -->
    <div class="mmain">
      <div class="mleft">
        <h2> <span class="sp_t1">��ҵ�Ļ�</span>  </h2>
        <div class="mleftbox">
          <ul class="leftlist1">
              		 <%--
                    	<li ><a href="/chinese/cultureWeb.do?id=29">���Ÿ���</a></li>
                    	 <li><a href="/chinese/cultureByDutyWeb.do?id=35">�������</a></li>	 
                        --%>
                        <li><a href="/chinese/cultureByVisionWeb.do?id=36">Ը����ʹ��</a></li>	
                        <li><a href="/chinese/cultureByCoreWeb.do?id=31">���ļ�ֵ��</a></li>
                        <li><a href="/chinese/cultureByTargetWeb.do?id=32">��ҵĿ��</a></li>
                        <li><a href="/chinese/cultureByEnterpriseWeb.do?id=33">����������</a></li>
                        <li><a href="/chinese/cultureByCustomerWeb.do?id=34">�ͻ���Ա��</a></li>
                        <li><a  class="hover" href="queryAlbumType.do">���ӻ���</a></li>
                  		<li class="hover"><a href="javascript:void(0);" onclick="setTab22('dd1','pp1')" id="pp1">�»�������</a>
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
        <div class="curr"> ����λ��-<a href="/chinese/cultureWeb.do?id=29">��ҵ�Ļ�</a>-���ӻ��� </div>
        <div class="mtitle">
          <h2>���ӻ���</h2>
        </div>
        <div class="ejournals">
          <ul>
          	<%if(list!=null&&list.size()>0){ 
          		for(int i = 0 ; i<list.size() ; i++){
          			Map map = (Map)list.get(i);
          	%>
            <li <%if(i==2||i==5){ %> class="li3d" <%}%> ><a href="queryAlbum.do?typeId=<%=map.get("id") %>" target="_blank">
           	 <img class="ebook" src="/<%=map.get("image_path") %>" width="179" height="244" /></a><a class="ebookname" href="queryAlbum.do?typeId=<%=map.get("id") %>" target="_blank"><span>��</span> <%=map.get("name") %></a></li>
            
            	<%}%>
            <%}%>
          
          </ul>
        </div>
        <div class="cls"></div>
                   
           <div class="pages" style="margin-top:15px;">
              
             <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">��һҳ</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >��һҳ</a><%}%>
			<%if((pageUtil.getPageNumber()-2)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a><%}%><%if((pageUtil.getPageNumber()-1)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a><%}%>
			<span><%=pageUtil.getPageNumber()%></span>
			<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%><%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                            
                            <!--��һҳ-->	
			<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%><a class="fanye fyover" >��һҳ</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >��һҳ</a><%}%> ��<%=pageUtil.getTotalCount()%>��  ��ǰ<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>ҳ
                      
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
