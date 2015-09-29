<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>查看新闻历史</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function previewImageVideo(type,path){
		if(openDialog("previewImageVideo.do?previewType="+type+"&previewPath="+path,"预览",400,300) =="SUCCESS") refresh();
	}
	
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">查看新闻历史</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
  <tr>
    <th><font color="#FF0000">*</font>标题：</th>
    <td>&nbsp;<ww:property value='mnh.title'/></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>内容：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="mnh.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
    <tr>
    <th>新闻图片：</th>
    <td>&nbsp;<ww:if test="mnh.path==null">图片：暂无</ww:if><ww:elseif test="mnh.path!=null">图片：<ww:property value='mnh.path'/><input type="button" value="预览" onClick="javascript:previewImageVideo(1,'<ww:property value="mnh.path"/>');" /></ww:elseif>
	</td>
  </tr>
  <tr>
    <th>首页动态图片：</th>
    <td>&nbsp;<ww:if test="mnh.syPath==null">图片：暂无</ww:if><ww:elseif test="mnh.syPath!=null">图片：<ww:property value='mnh.syPath'/><input type="button" value="预览" onClick="javascript:previewImageVideo(1,'<ww:property value="mnh.syPath"/>');" /></ww:elseif>
   </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>发布时间：</th>
    <td>&nbsp;<ww:property value='pubTime'/></td>
  </tr>
  <tr>
    <th width="15%">来源：</th>
    <td>&nbsp;<ww:property value='mnh.source'/></td>
  </tr>
   <tr>
    <th width="15%">通讯员：</th>
    <td>&nbsp;<ww:property value='mnh.reporter'/></td>
  </tr>
   <tr>
    <th><font color="#FF0000">*</font>点击数：</th>
    <td>&nbsp;<ww:property value='mnh.click'/></td>
  </tr>
  
<tr>
  	<th><font color="#FF0000">*</font>顺序：</th>
  	<td>&nbsp;<ww:property value='mnh.sequence'/></td>
  	
  </tr>
</table>
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
