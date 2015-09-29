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
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-员工与招聘</title>
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
    <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li ><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li class="hover"><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/chinese/queryEmployess.do">权力与义务</a>      
    <a href="/chinese/queryXinc.do">薪酬与福利</a>   
    <a href="/chinese/queryRenl.do">人力资源策略</a>      
    <a href="/chinese/queryZhaop.do">招聘信息</a>   
    <a href="/chinese/queryRecruit.do">招工信息</a>     
    
  
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
            	<span class="sp_t1" >员工与招聘</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/queryEmployess.do">权力与义务</a></li>
                        <li><a href="/chinese/queryXinc.do">薪酬与福利</a></li>
                        <li><a href="/chinese/queryRenl.do">人力资源策略</a></li>
                        <li><a href="/chinese/queryZhaop.do">招聘信息</a></li>
                        <li><a href="/chinese/queryRecruit.do">招工信息</a></li>
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	您的位置-<a href="#">企业文化</a>-集团纲领
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>员工与招聘</h2>
                 </div>
                 
                 
                 <div class="jobdetail">
             
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th height="36" width="75">招聘职位：</th>
    <th align="left" class="jobname"><ww:property value="advertise.name"/></th>
  </tr>
  
  <tr>
  <ww:if test="advertise.type==1">
    <td height="24">基本要求：</td>
  </ww:if>
    <ww:else>
   <td height="24" >基本要求：</td>
   </ww:else>
    <td><ww:property value="advertise.requires"/> </td>
  </tr>

  <tr>
    <td height="24" >学历要求：</td>
    <td>
<ww:if test="advertise.degree!=null">
<ww:property value="advertise.degree"/> 
</ww:if> <ww:else>
		
		</ww:else></td>
  </tr>
  
  <tr>
    <td height="24">招聘人数：</td>
    <td> 
      <ww:if test="advertise.adPerson!=null">
		<ww:property value="advertise.adPerson"/>人
		</ww:if>
	    <ww:else>
		不限
		</ww:else>
     </td>
  </tr>
  
  <tr>
   <ww:if test="advertise.type==1">
    <td valign="top" >其他要求（说明）：</td>
     </ww:if>
    <ww:else>
    <td valign="top" >工作描述：</td>
    </ww:else>
    <td>
    	<ww:property value="advertise.description"/>
    </td>
  </tr>
<tr>
    <td height="24">发布时间：</td>
    <td><ww:property value="@cn.com.netmovie.helper.DateHelper@toString(advertise.pubTime,'yyyy-MM-dd')"/> </td>
  </tr>
<tr>
    <td height="24">联系人：</td>
    <td><ww:property value="advertise.linkman"/></td>
  </tr>
<tr>
    <td height="24">联系电话：</td>
    <td><ww:property value="advertise.telephone"/> </td>
  </tr>
</table>

      <div class="yingpin">
      <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <input type="hidden" name="name" value="<ww:property value='advertise.name'/>"/>
      <input type="hidden" name="company" value="<ww:property value='advertise.company'/>"/>
      <input type="button" id="button" onclick="addAdvertiseInfo()" class="btn_tjiao" value="我要应聘"/>
      </form>
      <a href="javascript:goHistory();">返回</a>        
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
