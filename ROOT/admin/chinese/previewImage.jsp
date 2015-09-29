<%@ include file="/WEB-INF/inc/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>图片浏览</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<body>
<img src="/<ww:property value='previewPath'/>">
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		</td>
	</tr>
</table>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>