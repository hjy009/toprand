<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�޸Ľ�ɫ��Ϣ</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateAdminGroup(){
		var form = findById("form");
		form.action = "updateGroup.do";
		form.submit();	
	}
	
	function init(){
		
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸Ľ�ɫ��Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th><font color="#FF0000">*</font>��ɫ���ƣ�</th>
    <td>&nbsp;<input id="name" name="adminGroup.name" value="<ww:property value='adminGroup.name'/>"></td>
  </tr>
  <tr>
    <th>˵����</th>
    <td>&nbsp;<textarea id="remark" name="adminGroup.remark" cols="30" rows="4"><ww:property value="adminGroup.remark"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input type="button" value="�޸�"  onclick="updateAdminGroup()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
