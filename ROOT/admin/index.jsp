<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="xiaohe" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />


</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function adminLogin(){
		var username = document.getElementById("username").value;
		if(username==""){
			alert("请输入用户名");
			return false;
		}
		var password = document.getElementById("password").value;
		if(password==""){
			alert("请输入密码");
			return false;
		}
		var rand = document.getElementById("rand").value;
		if(rand==""){
			alert("请输入验证码");
			return false;
		}
		//form.action ="adminLogin.do";
		//form.submit();
		document.forms.form.action="adminLogin.do";
		document.forms.form.submit();
		
	}

	function changeRand(){
		document.getElementById("randImage").src="/validate/image.jsp?time="+new Date().getTime();
	}

	function init(){
	
	}
</script>
<body style="background:url(images/login.jpg) center 0 no-repeat;">

<div style="width:532px; margin:0 auto;">
				<div class="logint1">
				<form id="form" action="" method="post">
                <input id="username" name="username" class="txt1" value="<ww:property value="username"/>" tabindex="1"/>
                </div>
                
                <div class="logint2">
                <input id="password" name="password" type="password" class="txt1" value="<ww:property value="password"/>" tabindex="2"/>
                </div>
                
                <div class="cls"></div>
                
                <div class="yanzhengma">
                
                <input id="rand" name="rand" type="text" value="" class="txt2" tabindex="3"/>
                <div class="yanzhengma2"><img id="randImage" src="/validate/image.jsp" onclick="javascript:changeRand();"/></div>
                </div>
                <input value="" type="button" onClick="javascript:adminLogin();" tabindex="4" class="btnlogin" />
                </form>                


</div>



	
</body>
<%@ include file="/WEB-INF/inc/response.jsp"%>
</html>
