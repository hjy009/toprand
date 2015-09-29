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
<SCRIPT src="../js/iepng.js" type="stext/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
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
		 document.getElementById("usernamecheck").innerHTML = "<font color='red'>联系手机不能为空</font>";
	 }else{
		 var patrn = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
		 if(!patrn.exec(document.getElementById("phoneStr").value)){
			 document.getElementById("usernamecheck").innerHTML = "<font color='red'>联系手机格式不正确</font>";
		 }else{
			 
	           	 document.getElementById("usernamecheck").innerHTML = "";
	          	 usernameStatus = true;
	             }  
	 }
}

function checkEmail(){
	 if(document.getElementById("emailStr").value==''){
		 document.getElementById("emailcheck").innerHTML = "<font color='red'>电子邮箱不能为空</font>";
	 }else{
		 var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		 if(!myreg.test(document.getElementById("emailStr").value)){
			 document.getElementById("emailcheck").innerHTML = "<font color='red'>电子邮箱格式不正确</font>";
		 }else{
	            	 document.getElementById("emailcheck").innerHTML = "";
	 				emailStatus = true;
	           
	}
	 }
		
}
function  checkname(){
	if(document.getElementById("uname").value==''){
		 document.getElementById("namecheck").innerHTML = "<font color='red'>姓名不能为空</font>";
	 }else{
		 document.getElementById("namecheck").innerHTML = "";
		 nameStatus=true;
	 }
}


function  checkbirth(){
	if(document.getElementById("birth").value==''){
		 document.getElementById("birthcheck").innerHTML = "<font color='red'>出生日期不能为空</font>";
	 }else{
		 document.getElementById("birthcheck").innerHTML = "";
		 birthStatus=true;
	 }
}

function  checkcertificate(){
	if(document.getElementById("certificate").value==''){
		 document.getElementById("certificatecheck").innerHTML = "<font color='red'>身份证不能为空</font>";
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
        <h2> <span class="sp_t1" >员工与招聘</span>  </h2>
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
       <form name="aform" id="aform"  method="post" enctype="multipart/form-data">
      <!-- mright -->
      <div class="mright">
        <div class="curr"> 您的位置-<a href="/chinese/queryEmployess.do">员工与招聘</a>-招聘信息 </div>
        <div class="mtitle">
          <h2>员工与招聘</h2>
         </div>
          
         
        <div class="resume">
        
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="70">应聘职位：</td>
              <td class="input"><input type="text" name="applyfor.appliedPosition"  value="<ww:property value='name'/>" /></td>
            </tr>
            <tr>
              <td>招聘企业：</td>
              <td class="input"><select id="memberEnterprises" name="applyfor.memberEnterprises">
                 <option value="">请选择分公司</option>
		                 		<option value="常州新华昌国际集装箱有限公司">常州新华昌国际集装箱有限公司</option>
		                 		<option value="宁波新华昌运输设备有限公司">宁波新华昌运输设备有限公司</option>
		                 		<option value="惠州新华昌运输设备有限公司">惠州新华昌运输设备有限公司</option>
		                 		<option value="天津新华昌运输设备有限公司">天津新华昌运输设备有限公司</option>
		                 		<option value="江苏万隆特种货柜有限公司">江苏万隆特种货柜有限公司</option>
		                 		<option value="嘉善新华昌集装箱有限公司">嘉善新华昌集装箱有限公司</option>
						<option value="嘉善新华昌木业有限公司">嘉善新华昌木业有限公司</option>
		                 		<option value="青岛交运新华昌集装箱有限公司">青岛交运新华昌集装箱有限公司</option>
		                 		<option value="新华昌集团有限公司">新华昌集团有限公司</option>
                </select></td>
            </tr>
            <tr>
              <td>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
              <td class="input"><input type="text" value="" id="uname"  name="applyfor.name"/><div id="namecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td width="30%">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
              <td class="sex"><input type="radio" name="sex" checked="checked" value="1" /> 男
				<input type="radio" name="sex" value="2" /> 女
				</td>
            </tr>
            <tr>
              <td>出生日期：</td>
              <td class="input"><input type="text" name="applyfor.dateOfBirth" id="birth" value="" /><div id="birthcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>身&nbsp;份&nbsp;证：</td>
              <td class="input"><input type="text" name="applyfor.certificate" id="certificate" value="" /><div id="certificatecheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>现住地址：</td>
              <td class="input"><input type="text" name="applyfor.address" value="" /></td>
            </tr>
            <tr>
              <td>籍&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
              <td class="input"><input type="text" name="applyfor.nativePlace" value="" /></td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td class="input"><input type="text" id="phoneStr" name="applyfor.phone" value="" /><div id="usernamecheck"></div><font color='red'>*</font></td>
            </tr>
            <tr>
              <td>E - mail:</td>
              <td class="input"><input type="text" name="applyfor.email" id="emailStr" value="" /><div id="emailcheck"><font color='red'>*</font></div></td>
            </tr>
            <tr>
              <td>工作年限:</td>
              <td class="input"><input type="text" name="applyfor.workLife" value="" /></td>
            </tr>
            <tr>
              <td>学&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
              <td class="input">
                <select name="applyfor.degree">
                 <option value="">请选择学历类别</option>
                  <option value="初中">初中</option>
                  <option value="中专">中专</option>
                  <option value="高中">高中</option>
                  <option value="大专">大专</option>
                   <option value="本科">本科</option>
                  <option value="硕士">硕士</option>
                   <option value="博士">博士</option>
                </select></td>
            </tr>
            <tr>
              <td>专&nbsp;&nbsp;&nbsp;&nbsp;业:</td>
              <td class="input"><input type="text" name="applyfor.professional" value="" /></td>
            </tr>
            <tr>
              <td>外&nbsp;&nbsp;&nbsp;&nbsp;语:</td>
              <td class="input"><input type="text" name="applyfor.english" value="" /></td>
            </tr>
            <tr>
              <td height="115">教育经历:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.educationExperience"></textarea>

</td>
            </tr>
            <tr>
              <td height="115">工作经历:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.workExperience"></textarea></td>
            </tr>
            <tr>
              <td height="115">自我评价:</td>
              <td class="textarea"><textarea cols="30" rows="5" name="applyfor.selfEvaluation"></textarea></td>
            </tr>
            <tr>
              <td>表格上传：</td>
            <td class="input">
            
            <input type="file" id="fileImage" name="fileImage" size="30"/>
            <a class="down" href="downloadAdvertise.do">下载新华昌应聘表</a>
            </td>
            </tr>
          </table>
          <div class="tijiao"><input type="button" id="button" onclick="addAdvertiseInfo()" class="btn_tjiao" value="提交"/><a href="javascript:goHistory();">返回</a></div>
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
