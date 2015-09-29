<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新增视频信息</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelVideo(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入名称');
			return ;
		}
		if(name.length>30){
			alert("名称不能超过30个字");
			return;
		}
		
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('请选择发布时间');
			return ;
		}
		var form = findById("form");
		form.action = "addModelVideo.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增视频信息</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <ww:hidden name="'categoryId'"></ww:hidden>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>名称：</th>
    <td>&nbsp;<input id="name" name="modelVideo.name" value="<ww:property value='modelVideo.name'/>" size="50">&nbsp;<font color="#FF0000">(名称不能超过30个文字)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>发布时间：</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font></td>
  </tr>
  <tr>
    <th>显示图片：</th>
    <td>&nbsp;<input type="file" id="fileSyImage" name="fileSyImage" value="<ww:property value='modelVideo.imagePath'/>" size="30">
	<br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font></td>
  </tr>
  <tr>
    <th>视频：</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelVideo.path'/>" size="30">
	<br><font color="#FF0000">(上传的视频只支持rm,rmvb,avi,wmv,flv,3gp,mp4,swf,mpg格式,大小不能超过20M)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000"><%--*--%></font>说明：</th>
    <td>&nbsp;<textarea rows="5" cols="80" id="remar" name="modelVideo.remark"><ww:property value="modelVideo.remark" /></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input id="submitButton" type="button" value="新 增"  onclick="addModelVideo()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
