<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�޸��û�����</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateAdminUserPassword(){
		var password = findById("password").value;
		if(password==""){
			alert("������������");
			return false;
		}
		var form = findById("form");
		form.action = "updateAdminUserPassword.do";
		form.submit();	
	}
	
	function init(){
		
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸��û�����</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="updateAdminUserPassword.do" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th>�û�����</th>
    <td>&nbsp;<ww:property value='adminUser.userName'/></td>
  </tr>
  <tr>
    <th>������</th>
    <td>&nbsp;<ww:property value='adminUser.name'/></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>�����룺</th>
    <td>&nbsp;<input type="password" id="password" name="password" value="<ww:property value='password'/>"></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input type="button" value="�޸�"  onclick="updateAdminUserPassword()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
