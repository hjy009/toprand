<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.newhc.admin.helper.NewStringHelper"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
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
<title>�»����������޹�˾-Ա������Ƹ</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
function addAdvertiseInfo(){
		var aform = document.getElementById("aform");
		aform.action = "parperApplyfor.do";
		aform.submit();
		findById("button").disabled = true;
	}
	function goHistory(){
		window.history.go(-1);
	}
</script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
    <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li class="hover"><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/chinese/queryEmployess.do">Ȩ��������</a>      
    <a href="/chinese/queryXinc.do">н���븣��</a>   
    <a href="/chinese/queryRenl.do">������Դ����</a>      
    <a href="/chinese/queryZhaop.do">��Ƹ��Ϣ</a>   
    <a href="/chinese/queryRecruit.do">�й���Ϣ</a>     
    
  
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
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1" >Ա������Ƹ</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/queryEmployess.do">Ȩ��������</a></li>
                        <li><a href="/chinese/queryXinc.do">н���븣��</a></li>
                        <li><a href="/chinese/queryRenl.do">������Դ����</a></li>
                        <li><a href="/chinese/queryZhaop.do">��Ƹ��Ϣ</a></li>
                        <li><a href="/chinese/queryRecruit.do">�й���Ϣ</a></li>
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	����λ��-<a href="#">��ҵ�Ļ�</a>-���Ÿ���
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Ա������Ƹ</h2>
                 </div>
                 
                 
                 <div class="jobdetail">
             
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th height="36" width="75">��Ƹְλ��</th>
    <th align="left" class="jobname"><ww:property value="advertise.name"/></th>
  </tr>
  
  <tr>
  <ww:if test="advertise.type==1">
    <td height="24">����Ҫ��</td>
  </ww:if>
    <ww:else>
   <td height="24" >����Ҫ��</td>
   </ww:else>
    <td><ww:property value="advertise.requires"/> </td>
  </tr>

  <tr>
    <td height="24" >ѧ��Ҫ��</td>
    <td>
<ww:if test="advertise.degree!=null">
<ww:property value="advertise.degree"/> 
</ww:if> <ww:else>
		
		</ww:else></td>
  </tr>
  
  <tr>
    <td height="24">��Ƹ������</td>
    <td> 
      <ww:if test="advertise.adPerson!=null">
		<ww:property value="advertise.adPerson"/>��
		</ww:if>
	    <ww:else>
		����
		</ww:else>
     </td>
  </tr>
  
  <tr>
   <ww:if test="advertise.type==1">
    <td valign="top" >����Ҫ��˵������</td>
     </ww:if>
    <ww:else>
    <td valign="top" >����������</td>
    </ww:else>
    <td>
    	<ww:property value="advertise.description"/>
    </td>
  </tr>
<tr>
    <td height="24">����ʱ�䣺</td>
    <td><ww:property value="@cn.com.netmovie.helper.DateHelper@toString(advertise.pubTime,'yyyy-MM-dd')"/> </td>
  </tr>
<tr>
    <td height="24">��ϵ�ˣ�</td>
    <td><ww:property value="advertise.linkman"/></td>
  </tr>
<tr>
    <td height="24">��ϵ�绰��</td>
    <td><ww:property value="advertise.telephone"/> </td>
  </tr>
</table>

      <div class="yingpin">
      <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <input type="hidden" name="name" value="<ww:property value='advertise.name'/>"/>
      <input type="hidden" name="company" value="<ww:property value='advertise.company'/>"/>
      <input type="button" id="button" onclick="addAdvertiseInfo()" class="btn_tjiao" value="��ҪӦƸ"/>
      </form>
      <a href="javascript:goHistory();">����</a>        
       </div>
        </div>
    <!-- mright end -->
  </div>
  </div>
  <!-- main end -->
  <!-- foot -->
   <%@ include file="/chinese/foot.jsp"%>
  <!-- foot end -->
</div>
</div>
</body>
</html>
