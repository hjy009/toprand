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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
function addAdvertiseInfo(){
		var aform = document.getElementById("aform");
		aform.action = "parperApplyforEn.do";
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
  <%@ include file="/english/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
       <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2" ><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li  ><span class="hover" ><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/english/queryEmployessEn.do">Rights and Duties</a>      
    <a href="/english/queryXincEn.do">Compensation and Benefits</a>   
    <a href="/english/queryRenlEn.do">HR Strategy</a>      
    <a href="/english/queryZhaopEn.do">Job Opportunities</a>   
    <!-- <a href="/english/queryRecruitEn.do">Job Opportunity</a> -->     
    
  
    </div>
    
  
 
   <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/english/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1" >Staffs and Recruitment</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/english/queryEmployessEn.do">Rights and Duties</a></li>
                        <li><a href="/english/queryXincEn.do">Compensation and Benefits</a></li>
                        <li  ><a href="/english/queryRenlEn.do">HR Strategy</a></li>
                        <li><a href="/english/queryZhaopEn.do">Job Opportunities</a></li>
                        <!-- <li><a href="/english/queryRecruitEn.do">Job Opportunity</a></li> -->
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright" id="mright">
        		 <div class="curr">
                 	Your location-<a href="#">corporate culture</a>-Group program
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Staffs and Recruitment</h2>
                 </div>
                 
                 
                 <div class="jobdetail">
             
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th height="36" width="30%">Position£º</th>
    <th align="left" class="jobname"><ww:property value="advertise.name"/></th>
  </tr>
  <ww:if test="advertise.degree!=null&&advertise.degree!=\"\"">
  <tr>
    <td height="24" >Based Requirements£º</td>
    <td><ww:property value="advertise.degree"/>  </td>
  </tr>
  </ww:if>
  <tr>
  <ww:if test="advertise.type==1">
    <td height="24">Skills and experience£º</td>
  </ww:if>
    <ww:else>
   <td height="24" >Skills and experience£º</td>
   </ww:else>
    <td><ww:property value="advertise.requires"/> </td>
  </tr>
  <tr>
    <td height="24">Requisition Number£º</td>
    <td> 
      <ww:if test="advertise.adPerson!=null">
		<ww:property value="advertise.adPerson"/>person
		</ww:if>
	    <ww:else>
		Unlimited
		</ww:else>
     </td>
  </tr>
  <tr>
    <td height="24">Release Date£º</td>
    <td><ww:property value="@cn.com.netmovie.helper.DateHelper@toString(advertise.pubTime,'yyyy-MM-dd')"/> </td>
  </tr>
  <tr>
   <ww:if test="advertise.type==1">
    <td valign="top" >Other Requirements£º</td>
     </ww:if>
    <ww:else>
    <td valign="top" >Other Requirements£º</td>
    </ww:else>
    <td>
    	<ww:property value="advertise.description"/>
    </td>
  </tr>
</table>

      <div class="yingpin">
      <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <input type="hidden" name="name" value="<ww:property value='advertise.name'/>"/>
      <input type="hidden" name="company" value="<ww:property value='advertise.company'/>"/>
      <!--<input type="button" id="button" onclick="addAdvertiseInfo()" class="btn_tjiao" value="apply"/>-->
<a href="javascript:addAdvertiseInfo();" class="btn_tjiao">apply</a>  
      </form>
      <a href="javascript:goHistory();" class="btn_tjiao">return</a>        
       </div>
        </div>
    <!-- mright end -->
  </div>
  </div>
  <!-- main end -->
  <!-- foot -->
   <%@ include file="/english/foot.jsp"%>
  <!-- foot end -->
</div>
</div>
</body>
</html>
