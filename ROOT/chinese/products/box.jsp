<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%
List imageList = (List)request.getAttribute("imageList");
List list =(List)request.getAttribute("list");
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
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
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
               
                    	<li><a href="/chinese/queryProduct.do?categoryId=1">��Ҫ��Ʒ</a>
                        
                        		<ul>
                                	<li class="hover"><a href="#">���ʱ�׼��װ��</a></li> 
									<li><a href="#">���ָɻ���װ��</a></li>  
									<li><a href="#">��ʽ��װ��</a></li> 
                                
                                </ul>
                        
                        
                        </li>
                        <li  class="hover"><a href="/chinese/queryCategoryById.do?categoryId=11">��Ҫ�ͻ�</a>
                        <ul>
                                	<li  ><a href="/chinese/queryCategoryById.do?categoryId=11">���˹�˾</a></li> 
									<li ><a href="/chinese/queryRentalBox.do?categoryId=12">���乫˾ </a></li>  
									<li class="hover"><a href="/chinese/queryBox.do?categoryId=14">����ͻ�</a></li>
									<li ><a href="/chinese/queryOther.do?categoryId=13">����</a></li> 
                                
                                </ul>
                        
                        </li>
                     
                
                </ul>
            
            </div>
            
          	<jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/queryCategoryById.do?categoryId=11">��Ҫ�ͻ� </a>-����ͻ�
                 
   </div>
                 
                 <div class="mtitle">
                 	<h2>����ͻ�</h2>
                 </div>
                 
                 
                 <div class="mcon2">
                   		<ul class="shippinglist">
                   			 <%if(list!=null&&list.size()>0){%>
				  				<%for(int i=0;i<list.size();i++){
									Map map = (Map)list.get(i);
								%>
                        		<li <%if(i!=0&&i%2==0) {%> style=" margin-right:0;" <%=i%><%} %>>
                                	<a href="#"><span><img src="/<%=map.get("small_image") %>" width="121" height="53" /></span>
                                		<label><%=map.get("name") %></label> 
                                		</a>
                                </li>
                            	<%} %>
                            <%}else{ %>
                            	����
                            <%} %>   
                               
                                
                                
                        </ul>
                      
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
