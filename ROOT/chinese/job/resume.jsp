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
<SCRIPT src="../js/iepng.js" type="stext/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript">

window.onload=function()//��window��onload�¼������������ϵ�ʱ��
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
		 document.getElementById("usernamecheck").innerHTML = "<font color='red'>��ϵ�ֻ�����Ϊ��</font>";
	 }else{
		 var patrn = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
		 if(!patrn.exec(document.getElementById("phoneStr").value)){
			 document.getElementById("usernamecheck").innerHTML = "<font color='red'>��ϵ�ֻ���ʽ����ȷ</font>";
		 }else{
			 
	           	 document.getElementById("usernamecheck").innerHTML = "";
	          	 usernameStatus = true;
	             }  
	 }
}

function checkEmail(){
	 if(document.getElementById("emailStr").value==''){
		 document.getElementById("emailcheck").innerHTML = "<font color='red'>�������䲻��Ϊ��</font>";
	 }else{
		 var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		 if(!myreg.test(document.getElementById("emailStr").value)){
			 document.getElementById("emailcheck").innerHTML = "<font color='red'>���������ʽ����ȷ</font>";
		 }else{
	            	 document.getElementById("emailcheck").innerHTML = "";
	 				emailStatus = true;
	           
	}
	 }
		
}
function  checkname(){
	if(document.getElementById("uname").value==''){
		 document.getElementById("namecheck").innerHTML = "<font color='red'>��������Ϊ��</font>";
	 }else{
		 document.getElementById("namecheck").innerHTML = "";
		 nameStatus=true;
	 }
}


function  checkbirth(){
	if(document.getElementById("birth").value==''){
		 document.getElementById("birthcheck").innerHTML = "<font color='red'>�������ڲ���Ϊ��</font>";
	 }else{
		 document.getElementById("birthcheck").innerHTML = "";
		 birthStatus=true;
	 }
}

function  checkcertificate(){
	if(document.getElementById("certificate").value==''){
		 document.getElementById("certificatecheck").innerHTML = "<font color='red'>���֤����Ϊ��</font>";
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
				aform.action = "addModelApplyfor.do?applyfor.sex="+sex;
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
    
    <div class="mban"><%if(imageList!=null&&imageList.size()>0){
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
        <h2> <span class="sp_t1" >Ա������Ƹ</span>  </h2>
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
       <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <!-- mright -->
      <div class="mright">
        <div class="curr"> ����λ��-<a href="/chinese/queryEmployess.do">Ա������Ƹ</a>-��Ƹ��Ϣ </div>
        <div class="mtitle">
          <h2>Ա������Ƹ</h2>
         </div>
          
         
        <div class="resume">
        
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="70">ӦƸְλ��</td>
              <td class="input"><input type="text" name="applyfor.appliedPosition"  value="<ww:property value='name'/>" /></td>
            </tr>
            <tr>
              <td>��Ƹ��ҵ��</td>
              <td class="input"><select id="memberEnterprises" name="applyfor.memberEnterprises">
                 <option value="">��ѡ��ֹ�˾</option>
		                 		<option value="�����»������ʼ�װ�����޹�˾">�����»������ʼ�װ�����޹�˾</option>
		                 		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
		                 		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
		                 		<option value="����»��������豸���޹�˾">����»��������豸���޹�˾</option>
		                 		<option value="������¡���ֻ������޹�˾">������¡���ֻ������޹�˾</option>
		                 		<option value="�����»�����װ�����޹�˾">�����»�����װ�����޹�˾</option>
						<option value="�����»���ľҵ���޹�˾">�����»���ľҵ���޹�˾</option>
		                 		<option value="�ൺ�����»�����װ�����޹�˾">�ൺ�����»�����װ�����޹�˾</option>
		                 		<option value="�»����������޹�˾">�»����������޹�˾</option>
                </select></td>
            </tr>
            <tr>
              <td>��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
              <td class="input"><input type="text" value="" id="uname"  name="applyfor.name"/><div id="namecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="30%">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
              <td class="sex"><input type="radio" name="sex" checked="checked" value="1" /> ��
				<input type="radio" name="sex" value="2" /> Ů
				</td>
            </tr>
            <tr>
              <td>�������ڣ�</td>
              <td class="input"><input type="text" name="applyfor.dateOfBirth" id="birth" value="" /><div id="birthcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>��&nbsp;��&nbsp;֤��</td>
              <td class="input"><input type="text" name="applyfor.certificate" id="certificate" value="" /><div id="certificatecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>��ס��ַ��</td>
              <td class="input"><input type="text" name="applyfor.address" value="" /></td>
            </tr>
            <tr>
              <td>��&nbsp;&nbsp;&nbsp;&nbsp;�᣺</td>
              <td class="input"><input type="text" name="applyfor.nativePlace" value="" /></td>
            </tr>
            <tr>
              <td>��ϵ�绰��</td>
              <td class="input"><input type="text" id="phoneStr" name="applyfor.phone" value="" /><div id="usernamecheck"></div><font color='red'>*</font></td>
            </tr>
            <tr>
              <td>E - mail:</td>
              <td class="input"><input type="text" name="applyfor.email" id="emailStr" value="" /><div id="emailcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>��������:</td>
              <td class="input"><input type="text" name="applyfor.workLife" value="" /></td>
            </tr>
            <tr>
              <td>ѧ&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
              <td class="input">
                <select name="applyfor.degree">
                 <option value="">��ѡ��ѧ�����</option>
                  <option value="����">����</option>
                  <option value="��ר">��ר</option>
                  <option value="����">����</option>
                  <option value="��ר">��ר</option>
                   <option value="����">����</option>
                  <option value="˶ʿ">˶ʿ</option>
                   <option value="��ʿ">��ʿ</option>
                </select></td>
            </tr>
            <tr>
              <td>ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ:</td>
              <td class="input"><input type="text" name="applyfor.professional" value="" /></td>
            </tr>
            <tr>
              <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
              <td class="input"><input type="text" name="applyfor.english" value="" /></td>
            </tr>
            <tr>
              <td height="115">��������:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.educationExperience"></textarea>

</td>
            </tr>
            <tr>
              <td height="115">��������:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.workExperience"></textarea></td>
            </tr>
            <tr>
              <td height="115">��������:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.selfEvaluation"></textarea></td>
            </tr>
            <tr>
              <td>����ϴ���</td>
            <td class="input">
            
            <input type="file" id="fileImage" name="fileImage" size="30"/>
            <a class="down" href="downloadAdvertise.do">�����»���ӦƸ��</a>
            </td>
            </tr>
          </table>
          <div class="tijiao"><input type="button" id="button" onclick="addAdvertiseInfo()" class="btn_tjiao" value="�ύ"/><a href="javascript:goHistory();">����</a></div>
        </div>
     
      </div>
      <!-- mright end --> 
         </form>
    </div>
    <!-- main end --> 
    <!-- foot -->
     <%@ include file="/chinese/foot.jsp"%>
    <ww:if test="isSuccess()">
	<script language="javascript">
		if("<ww:property value="responseMessage"/>" == ""){
			alert("�����ɹ�!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}
		window.returnValue = "SUCCESS";
	</script>
</ww:if>
<ww:if test="isFailure()">
	<script language="javascript">		
		if("<ww:property value="responseMessage"/>" == ""){
			alert("����ʧ�ܣ����Ժ�����!");
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
