<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�鿴��Ŀ������ʷ</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�鿴��Ŀ������ʷ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���⣺</th>
    <td>&nbsp;<ww:property value="modelContentHistory.name"/></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelContentHistoryEn.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
    <td>&nbsp;<ww:property value="pubTime"/></td>
  </tr>
<tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<ww:property value="modelContentHistoryEn.sequence"/></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		</td>
	</tr>
</table>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
