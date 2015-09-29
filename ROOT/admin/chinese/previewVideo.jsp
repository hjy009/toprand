<%@ include file="/WEB-INF/inc/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>图片浏览</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<body>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="350" height="250">  <param name="movie" value="/<ww:property value='previewPath'/>" />  <param name="quality" value="high" />  <embed src="/<ww:property value='previewPath'/>" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="95" height="360"></embed></object>
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