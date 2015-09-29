<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>修改新闻发布</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function updateModelNews(){
		var title = findById("title").value;
		if(title==""){
			alert('请输入标题');
			return ;
		}
		if(title.length>60){
			alert("标题不能超过60个字");
			return;
		}
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""){
			alert('请输入内容');
			return ;
		}else{ 
			findById("content").value = content;
		}
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('请选择发布时间');
			return ;
		}
		
		var click=findById("click").value;
		if(click==""){
			alert("请正确输入点击数");
			return;
		}
		if(isNaN(click)){
			alert("请正确输入点击数");
			return ;
		}
		
		var year = findById("year").value;
		if(year==""){
			alert('请输入年份');
			return ;
		}
		if(isNaN(year)){
			alert('年份格式不正确');
			return ;
		}
		
		
		var sequence=findById("sequence").value;
		if(sequence==""){
			alert("请输入顺序");
			return;
		}
		if(isNaN(sequence)){
			alert("请正确输入顺序");
			return ;
		}
		var form = findById("form");
		form.action = "updateModelNews.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		
	}
	function previewImageVideo(type,path){
		if(openDialog("previewImageVideo.do?previewType="+type+"&previewPath="+path,"预览",400,300) =="SUCCESS") refresh();
	}
	
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">修改新闻发布</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <ww:hidden id="id" name="'id'"></ww:hidden>
  <input type="hidden" id="content" name="modelNews.content">
  <tr>
    <th><font color="#FF0000">*</font>标题：</th>
    <td>&nbsp;<input id="title" name="modelNews.title" value="<ww:property value='modelNews.title'/>" size="50">&nbsp;<font color="#FF0000">(标题不能超过60个文字)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>内容：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelNews.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
    <tr>
    <th>新闻图片：</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelNews.path'/>" size="30">
    <ww:if test="modelNews.path==null">图片：暂无</ww:if><ww:elseif test="modelNews.path!=null">图片：<ww:property value='modelNews.path'/><input type="button" value="预览" onClick="javascript:previewImageVideo(1,'<ww:property value="modelNews.path"/>');" /></ww:elseif>
     <br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font>
	</td>
  </tr>
  <tr>
    <th>首页动态图片：</th>
    <td>&nbsp;<input type="file" id="fileSyImage" name="fileSyImage" value="<ww:property value='modelNews.syPath'/>" size="30">
    <ww:if test="modelNews.syPath==null">图片：暂无</ww:if><ww:elseif test="modelNews.syPath!=null">图片：<ww:property value='modelNews.syPath'/><input type="button" value="预览" onClick="javascript:previewImageVideo(1,'<ww:property value="modelNews.syPath"/>');" /></ww:elseif>
     <br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font>
   </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>发布时间：</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'"  size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font></td>
  </tr>
  <tr>
    <th width="15%">来源：</th>
    <td>&nbsp;<input id="source" name="modelNews.source" value="<ww:property value='modelNews.source'/>" size="30"></td>
  </tr>
   <tr>
    <th width="15%">通讯员：</th>
    <td>&nbsp;<input id="reporter" name="modelNews.reporter" value="<ww:property value='modelNews.reporter'/>" size="30"></td>
  </tr>
   <tr>
    <th><font color="#FF0000">*</font>点击数：</th>
    <td>&nbsp;<input id="click" name="modelNews.click" value="<ww:property value='modelNews.click'/>" size="30"></td>
  </tr>
  <tr>
 	 <th width="15%"><font color="#FF0000">*</font>年份：</th>
     <td>&nbsp;<input id="year" name="modelNews.year" value="<ww:property value='modelNews.year'/>" size="10" maxlength="4">&nbsp;<font color="#FF0000"></font></td>
  </tr>
<tr>
  	<th><font color="#FF0000">*</font>顺序：</th>
  	<td>&nbsp;<input id="sequence" name="modelNews.sequence" value="<ww:property value='modelNews.sequence'/>" size="30"><font color="#FF0000">*注意:此框只能输入数字，顺序应从1开始，发布日期相同时,数字越大排越后</font></td>
  	
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		<input id="submitButton" type="button" value="修 改"  onclick="updateModelNews()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
