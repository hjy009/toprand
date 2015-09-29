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
<title>�»����������޹�˾-����</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="../js/tab.js" type="text/javascript"></SCRIPT>
<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/searchProduct.do?pageNumber="+pno+"&name=<ww:property value='name'/>";
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
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li  class="hover"><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
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
  <div class="search3">
  			<div class="search_one">
            		<div class="search_con">
                    	<span>�������ġ�<label><ww:property value="name"/></label>������<%=pageUtil.getTotalCount() %>��</span>
                    	<form name="form1" id="form1" action="" action="">
                    		<input name="name" id="names" type="text" class="txt_search3" /><span>������:</span><select name="" id="type"  class="slt_tyle"><option value="1">��Ʒ</option><option>����</option></select>
                       		<input name="" type="button" value="" class="btn_search3" onclick="javascript:SearchProduct();"/>
                    	</form>
                    </div>
            </div>
            
            <ul class="prolist prolist2"  style="min-height: 300px; hieght:auto;_height:300px;">
           		 <%if(list!=null&&list.size()>0){%>
	  				<%for(int i=0;i<list.size();i++){
						Map map = (Map)list.get(i);
					%>
                      	<li>
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
                  <%}%>
                  

                        	
                      </ul>
            
            <div class="cls"></div>
                   
                   <div class="pages" style="margin-top:15px;">
                      
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
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
function SearchProduct(){		
		var name = document.getElementById("names").value;
				var form = document.getElementById("form1");
				if(name==""||name=="������ؼ���"){
					alert('������ؼ���');
					return ;
				}
				form.action="/chinese/searchProduct.do";
				form.submit();		
}

</script>
