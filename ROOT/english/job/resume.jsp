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
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="stext/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript">

window.onload=function()//用window的onload事件，窗体加载完毕的时候
{
	  var m = document.getElementById("memberEnterprises");
	 for(i=0;i<m.options.length;i++){
	  if(m.options[i].value=="<ww:property value='company'/>")
	  {     
	  	 m.options[i].selected=true;  
	   		break;
	  }	
	 }
	
}
</script>
<script language="javascript">

	var emailStatus = false;
	var usernameStatus = false;
	var nameStatus=false;
	var birthStatus=false;
	var certificateStatus=false;
	function checkUsername(){
	 if(document.getElementById("phoneStr").value==''){
		 document.getElementById("usernamecheck").innerHTML = "<font color='red'>Contact mobile phone cannot be empty</font>";
	 }else{
		 var patrn = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
		 if(!patrn.exec(document.getElementById("phoneStr").value)){
			 document.getElementById("usernamecheck").innerHTML = "<font color='red'>Contact mobile phone is not in the correct format</font>";
		 }else{
			 
	           	 document.getElementById("usernamecheck").innerHTML = "";
	          	 usernameStatus = true;
	             }  
	 }
}

function checkEmail(){
	 if(document.getElementById("emailStr").value==''){
		 document.getElementById("emailcheck").innerHTML = "<font color='red'>Electronic mailbox cannot be empty</font>";
	 }else{
		 var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		 if(!myreg.test(document.getElementById("emailStr").value)){
			 document.getElementById("emailcheck").innerHTML = "<font color='red'>Electronic mail is not in the correct format</font>";
		 }else{
	            	 document.getElementById("emailcheck").innerHTML = "";
	 				emailStatus = true;
	           
	}
	 }
		
}
function  checkname(){
	if(document.getElementById("uname").value==''){
		 document.getElementById("namecheck").innerHTML = "<font color='red'>The name cannot be empty</font>";
	 }else{
		 document.getElementById("namecheck").innerHTML = "";
		 nameStatus=true;
	 }
}


function  checkbirth(){
	if(document.getElementById("birth").value==''){
		 document.getElementById("birthcheck").innerHTML = "<font color='red'>Birth date cannot be empty</font>";
	 }else{
		 document.getElementById("birthcheck").innerHTML = "";
		 birthStatus=true;
	 }
}

function  checkcertificate(){
	if(document.getElementById("certificate").value==''){
		 document.getElementById("certificatecheck").innerHTML = "<font color='red'>ID cannot be empty</font>";
	 }else{
		 document.getElementById("certificatecheck").innerHTML = "";
		 certificateStatus=true;
	 }
}
	function addAdvertiseInfo(){
	checkUsername();
	 checkEmail();
	 checkname();
	 checkbirth();
	 checkcertificate();
	   var sex = document.getElementsByName('sex');
        for(var i = 0; i< sex.length; i++)
           if(sex[i].checked) { 
            sex=sex[i].value; 
        } 
		 if(emailStatus&&usernameStatus&&nameStatus&&birthStatus&&certificateStatus){
				var aform = findById("aform");
				aform.action = "addModelApplyforEn.do?applyforEn.sex="+sex;
				aform.submit();
				findById("button").disabled = true;
		}
	}
</script>

<script type="text/javascript">
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
    <!-- <a href="/english/queryRecruitEn.do">Job Opportunity</a>  -->
 	</div>
       <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
    </div>
    <!-- nav end -->
    
    <div class="mban"><%if(imageList!=null&&imageList.size()>0){
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
        <h2> <span class="sp_t1" >Staffs and Recruitment</span>  </h2>
        <div class="mleftbox">
          <ul class="leftlist">
           				<li  ><a href="/english/queryEmployessEn.do">Rights and Duties</a></li>
                        <li><a href="/english/queryXincEn.do">Compensation and Benefits</a></li>
                        <li ><a href="/english/queryRenlEn.do">HR Strategy</a></li>
                        <li><a href="/english/queryZhaopEn.do">Job Opportunities</a></li>
                        <!-- <li  ><a href="/english/queryRecruitEn.do">Job Opportunity</a></li> -->
          </ul>
        </div>
        <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
      </div>
       <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <!-- mright -->
      <div class="mright">
        <div class="curr"> Your location-<a href="/english/queryEmployessEn.do">Staffs and Recruitment</a>-Job Opportunities</div>
        <div class="mtitle">
          <h2>Staffs and Recruitment</h2>
         </div>
          
         
        <div class="resume">
        
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="70">Position：</td>
              <td class="input"><input type="text" name="applyforEn.appliedPosition"  value="<ww:property value='name'/>" /></td>
            </tr>
            <tr>
              <td width="70">Company：</td>
              <td class="input"><select id="memberEnterprises" name="applyforEn.memberEnterprises">
                 				<option value="">Please select branch</option>
		                 		<option value="CHANGZHOU XINHUACHANG INT’L CONTAINERS CO.,LTD">CHANGZHOU XINHUACHANG INT’L CONTAINERS CO.,LTD</option>
		                 		<option value="NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD">NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD">HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD</option>
		                 		<option value="TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD">TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC GROUP CONTAINERS COMPANY LIMITED">CXIC GROUP CONTAINERS COMPANY LIMITED</option>
		                 		<option value="JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD">JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC JIASHAN TIMBER PRODUCTS CO.,LTD">CXIC JIASHAN TIMBER PRODUCTS CO.,LTD</option>
		                 		<option value="QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD">QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD</option>
                </select></td>
            </tr>
            <tr>
              <td>Name：</td>
              <td class="input"><input type="text" value="" id="uname"  name="applyforEn.name"/><div id="namecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="30%">Gender：</td>
              <td class="sex"><input type="radio" name="sex" checked="checked" value="1" /> man
				<input type="radio" name="sex" value="2" /> woman
				</td>
            </tr>
            <tr>
              <td>Date of Birth ：</td>
              <td class="input"><input type="text" name="applyforEn.dateOfBirth" id="birth" value="" /><div id="birthcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>Identity Card No.：</td>
              <td class="input"><input type="text" name="applyforEn.certificate" id="certificate" value="" /><div id="certificatecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>Current Address：</td>
              <td class="input"><input type="text" name="applyforEn.address" value="" /></td>
            </tr>
            <tr>
              <td>Citizenship：</td>
              <td class="input"><input type="text" name="applyforEn.nativePlace" value="" /></td>
            </tr>
            <tr>
              <td>Tel.(with country code)：</td>
              <td class="input"><input type="text" id="phoneStr" name="applyforEn.phone" value="" /><div id="usernamecheck"></div></td>
            </tr>
            <tr>
              <td>E - mail:</td>
              <td class="input"><input type="text" name="applyforEn.email" id="emailStr" value="" /><div id="emailcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>Years of Experience:</td>
              <td class="input"><input type="text" name="applyforEn.workLife" value="" /></td>
            </tr>
            <tr>
              <td>Educational background:</td>
              <td class="input">
                <select name="applyforEn.degree">
                 <option value="">Please choose the degree category</option>
                  <option value="High school diploma/GED">High school diploma/GED</option>
                  <option value="Associates">Associates</option>
                  <option value="Bachelors">Bachelors</option>
                  <option value="Masters">Masters</option>
                   <option value="Doctorate">Doctorate</option>
                  <option value="MBA">MBA</option>
                   <option value="Other">Other</option>
                </select></td>
            </tr>
            <tr>
              <td>Skills and experience:</td>
              <td class="input"><input type="text" name="applyforEn.professional" value="" /></td>
            </tr>
            <tr>
              <td>Foreign language:</td>
              <td class="input"><input type="text" name="applyforEn.english" value="" /></td>
            </tr>
            <tr>
              <td height="115">Education:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyforEn.educationExperience"></textarea>

</td>
            </tr>
            <tr>
              <td height="115">Work Experience:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyforEn.workExperience"></textarea></td>
            </tr>
            <tr>
              <td height="115">Self-Assessment:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyforEn.selfEvaluation"></textarea></td>
            </tr>
            <tr>
              <td>Upload profile：</td>
            <td class="input">
            
            <input type="file" id="fileImage" name="fileImage" size="30"/>
            <a class="down" href="downloadAdvertise.do">Download draft</a>
            </td>
            </tr>
          </table>
          <div class="tijiao"><a href="javascript:addAdvertiseInfo();" class="btn_tjiao">Apply</a><a href="javascript:goHistory();" class="btn_tjiao">Return</a></div>
        </div>
     
      </div>
      <!-- mright end --> 
         </form>
    </div>
    <!-- main end --> 
    <!-- foot -->
     <%@ include file="/english/foot.jsp"%>
    <ww:if test="isSuccess()">
	<script language="javascript">
		if("<ww:property value="responseMessage"/>" == ""){
			alert("操作成功!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}
		window.returnValue = "SUCCESS";
	</script>
</ww:if>
<ww:if test="isFailure()">
	<script language="javascript">		
		if("<ww:property value="responseMessage"/>" == ""){
			alert("操作失败，请稍候再试!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}		
	</script>
</ww:if>
    <!-- foot end --> 
    
  </div>
</div>
</body>
</html>
