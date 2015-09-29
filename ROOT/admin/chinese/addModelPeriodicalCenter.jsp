<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新增电子期刊</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelPeriodical(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入名称');
			return ;
		}
		if(name.length>30){
			alert("标题不能超过30个字");
			return;
		}
		var fileImage = findById("fileImage").value;
		if(fileImage==""){
			alert('图片不能为空');
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
		form.action = "addModelPeriodicalCenter.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增电子期刊</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="perCenter.periodicalId" value="<ww:property value='periodicalId'/>"/>
 <tr>
    <th width="15%"><font color="#FF0000">*</font>名称：</th>
    <td>&nbsp;<input id="name" name="perCenter.name" value="<ww:property value='perCenter.name'/>" size="50">&nbsp;<font color="#FF0000">(标题不能超过30个文字)</font></td>
  </tr>
  <tr>
   <th>图片：</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='perCenter.imagePath'/>" size="50">
	<br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font></td>
  </tr>
  <tr>
  	<th><font color="#FF0000">*</font>顺序：</th>
  	<td>&nbsp;<input id="sequence" name="perCenter.sequence" value="<ww:if test='perCenter.sequence==null'>1</ww:if><ww:elseif test='perCenter.sequence!=null'><ww:property value='perCenter.sequence==null'/></ww:elseif>" size="30"><font color="#FF0000">*注意:此框只能输入数字，顺序应从1开始，发布日期相同时,数字越大排越后</font></td>
  </tr>
  <%--<tr>
  	<th width="15%">备注：</th>
	<td>&nbsp;<textarea id="remark" name="modelProductCategory.remark" rows="8" cols="78"><ww:property value='modelProductCategory.remark'/></textarea></td>
  </tr>--%>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input id="submitButton" type="button" value="新 增"  onclick="addModelPeriodical()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
