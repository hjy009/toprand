<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.helper.*"%>
<%
	List t1List = (List)request.getAttribute("t1List");
	List t2List = (List)request.getAttribute("t2List");
	List imageList = (List)request.getAttribute("imageList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-�»������</title>
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
               
                    	<li class="hover"><a href="/chinese/introWeb.do">���Ÿſ�</a></li>
                        <li><a href="/chinese/queryRemeberTheBig.do">��ҵ����</a></li>
                        <li><a href="/chinese/queryRemeberBig.do">���Ŵ��¼�</a></li>
                        <li><a href="/chinese/queryFactoryEnvironment.do">��������</a></li>
                        <li><a href="/chinese/enterprisesWeb.do">��Ա��ҵ</a></li>
                        <li><a href="/chinese/queryContact.do">��ϵ��ʽ</a></li>
                    	<li><a href="/chinese/videoWeb.do">������Ӱ</a></li>
                
                
                </ul>
            
            </div>
            
            <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="#">�»������</a>-���Ÿ���
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>���Ÿſ�</h2>
                 </div>
                 
                 
                 <div class="mcon3">
             
                   <ww:property value="me.content" />
                  
                   
                   <p><strong class="hei3">�»����������޹�˾��������Ҫ��Ա��ҵ��</strong>��</p>
              
                   <%
                    %>
                   <div class="abouttab">
                   		<h3>�ع���ҵ:</h3>
                   	<ul class="aboutlist">
                   	<%
                    		if(t1List!=null&&t1List.size()>0){
                   				for(int i=0;i<t1List.size();i++){
                   					Map map = (Map)t1List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWeb.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
				                       <%=NewStringHelper.truncate((String)map.get("remarks"),42,"....") %>
				                        </li>
                   						
                   						<%	
                   					}
                   					
                   				}
                   		
                   		 %>
                    
                    </ul>
                   
                   </div>
                   
                   <div class="abouttab">
                   		<h3>�ǿع���ҵ:</h3>
                   	<ul class="aboutlist">
                    	<%
                    		if(t2List!=null&&t2List.size()>0){
                   				for(int i=0;i<t2List.size();i++){
                   					Map map = (Map)t2List.get(i);
                   						%>
                   						<li <%if(i % 2 == 0){ %><%}else{ %>class="noright"<%} %>>
				                        <p class="ptitle"><a href="enterprisesDetailWeb.do?enterId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
				                       <%=NewStringHelper.truncate((String)map.get("remarks"),42,"....") %>
				                        </li>
                   						
                   						<%	
                   					}
                   					
                   				}
                   		
                   		 %>
                        
                        <%--<li class="noright">
                        <p class="ptitle"><a href="#">��ͨ��˿</a></p>
                        <p>�����»������ʼ�װ�����޹�˾�������»��������»�������������һ��רҵ��װ��������ҵ����</p>
                        </li>
                 
                    
                    --%></ul>
                   
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