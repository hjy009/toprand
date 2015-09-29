<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%
List imageList = (List)request.getAttribute("imageList");
Pagination pageUtil = (Pagination)request.getAttribute("pages");
List list = (List)pageUtil.getList();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-��Ʒ��ͻ�</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>



</head>

<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/queryProduct.do?categoryId=1&pageNumber="+pno;
		window.location.href=url;
	}
</script>

<body>
<div class="footbg">
<div class="wrap">
 <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li ><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li  class="hover"><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/chinese/queryProduct.do?categoryId=1">��Ҫ��Ʒ</a>      
    <a href="/chinese/queryCategoryById.do?categoryId=11">��Ҫ�ͻ�</a>      
  
  
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
            	<span class="sp_t1">��Ʒ��ͻ�</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="/chinese/queryProduct.do?categoryId=1">��Ҫ��Ʒ</a>
                        
                        		<ul>
                                	<li class="hover"><a href="/chinese/queryProduct.do?categoryId=1">���ʱ�׼��װ��</a></li> 
									<li ><a href="/chinese/querySpeciaIndex.do?categoryId=4">���ָɻ���װ��</a></li>  
									<li ><a href="/chinese/queryPottypeIndex.do?categoryId=10">��ʽ��װ��</a></li> 
                                
                                </ul>
                        
                        
                        </li>
                        <li><a href="/chinese/queryCategoryById.do?categoryId=11&productName=���˹�˾">��Ҫ�ͻ�</a></li>
                     			
                     
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/queryProduct.do?categoryId=1">��Ҫ��Ʒ</a>-���ʱ�׼��װ��
                 
                 </div>
                 
                 <div class="mtitle">
                 <h2> ���ʱ�׼��װ��</h2>
                 </div>
                 
                 
                 <div class="mcon2">
                      <ul class="prolist">
                       <%if(list!=null&&list.size()>0){%>
			  				<%for(int i=0;i<list.size();i++){
								Map map = (Map)list.get(i);
							%>
                      	<li <%if(i%3==2) {%> class="noright" <%=i%><%} %>>
                        <p  class="pimg"><a href="javascript:showDiv(<%=i%>)"  ><img src="/<%=map.get("small_image") %>" width="187" height="121" /></a></p> 
                        
                        <p class="plist"><a href="javascript:showDiv(<%=i%>)" rel=shadowbox;height=480;width=710 ><%=map.get("name") %></a></p>
                       <div id="pop<%=i%>" class="mydiv" style="display:none">
                       <div class="mydiv_c">
							<div class="boxlose"><a href="javascript:closeDiv(<%=i%>);"><img src="/chinese/images/closex2.jpg" /></a></div>
							<div class="cls"></div>
							<div class="conbox">
								<p align="center"><img src="/<%=map.get("small_image") %>" width="363" height="321" /></p>  
			                    <p align="center" style=" margin-top:18px;">
			                    <%=map.get("content") %>
			                    </p>   
							</div>
							    
						</div>
						</div>
                        </li>
                      	<%} %> 
                      <%}else{ %>
                      	����
                      <%} %>  
                        
                      
                      </ul>
                       <div id="bg" class="bgdiv" style=" display:none"></div>
                      <div class="cls"></div>
                      <div class="pages">
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">��һҳ</a><%}else{%><a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >��һҳ</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a>
	 						<%}%>&nbsp;<%if((pageUtil.getPageNumber()-1)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a>
	 						<%}%>
							<%=pageUtil.getPageNumber()%>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%>
							&nbsp;<%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--��һҳ-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%>
	 					<a class="fanye fyover" >��һҳ</a><%}else{%>
	 					<a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >��һҳ</a>
	 					<%}%> 
	 					��<%=pageUtil.getTotalCount()%>��  ��ǰ<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>ҳ
                      
                  
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
