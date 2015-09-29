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
  <script type="text/javascript" src="/chinese/box/shadowbox-2.js"></script>
<script type="text/javascript" src="/chinese/box/shadowbox-en.js"></script>
<script type="text/javascript" src="/chinese/box/skin.js"></script>
<link rel="stylesheet" href="/chinese/box/skin.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="/chinese/box/extras.css" type="text/css" media="screen"/>
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
 



</head>

<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/queryProduct.do?pageNumber="+pno+"&categoryId=1";
		window.location.href=url;
	}
	
	function showDiv(n){
		document.getElementById(n).style.display='block';
		document.getElementById('bg').style.display='block';
	}
	
	
	function closeDiv(n){
		document.getElementById(n).style.display='none';
		document.getElementById('bg').style.display='none';
	}
	
</script>

<body>

<div class="footbg">
<div class="wrap">
 <jsp:include flush="true" page="/chinese/head.jsp" ></jsp:include>
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
            
            <div class="mleftbox"  style="border-collapse:collapse; ">
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
                        
                        <p class="plist"><a href="javascript:showDiv(<%=i%>)" ><%=map.get("name") %></a></p>
                        
                        </li>
                        
                        
                        <div id="<%=i%>" class="mydiv" style="display:none">
						 <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>�ر�</strong></a></div>
						  
						 <div class="popbox">
						   <!-- <iframe id="ShowProduct" src="/chinese/products/box.jsp" style="width:100%;height:100%;" frameborder="0" scrolling="auto"></iframe> -->
						
						 <div class="box">
							 <p style="text-align:center"><img src="/<%=map.get("small_image") %>" width="496" height="321" /></p>
							
							 
							
			                    <%=map.get("content") %>
			                    
						 </div>
						 </div>
						  <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>�ر�</strong></a></div>
						
						</div>
						
						<div id="bg" class="bg" style="display:none;"></div>
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
	 						<%}%><%if((pageUtil.getPageNumber()-1)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a>
	 						<%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%>
							<%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%>
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
  <%if(list!=null&&list.size()>0){%>
			  				<%for(int i=0;i<list.size();i++){
								Map map = (Map)list.get(i);
							%>
      <div id="<%=i%>" class="mydiv" style="display:none">
						 <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>�ر�</strong></a></div>
						  
						 <div class="popbox">
						   <!-- <iframe id="ShowProduct" src="/chinese/products/box.jsp" style="width:100%;height:100%;" frameborder="0" scrolling="auto"></iframe> -->
						
						 <div class="box">
							 <p style="text-align:center"><img src="/<%=map.get("small_image") %>" width="363" height="321" /></p>
							
							 
							
			                    <%=map.get("content") %>
			                    
						 </div>
						 </div>
						  <div align="right"><a href="javascript:closeDiv('<%=i%>')"><strong>�ر�</strong></a></div>
						
						</div>
						
						
                      	<%} %> 
                      <%}else{ %>
                      	����
                      <%} %>  

<div id="bg" class="bg" style="display:none;"></div>
</body>



</html>
