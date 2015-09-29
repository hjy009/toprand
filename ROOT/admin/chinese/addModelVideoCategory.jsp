<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新增视频分类</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelVideoCategory(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入名称');
			return ;
		}
		if(name.length>30){
			alert("名称不能超过30个字");
			return;
		}
		var volumnCount = findById("volumnCount").value;
		if(volumnCount==""){
			alert('请输入视频数量');
			return;
		}
		var volumnCount = findById("volumnCount").value;
		if(volumnCount.length>=11){
			alert("视频数量输入的数字不能大于11位");
			return;
		}
		
		var form = findById("form");
		form.action = "addModelVideoCategory.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增视频分类</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <tr>
    <th><font color="#FF0000">*</font>名称：</th>
    <td>&nbsp;<input id="name" name="modelVideoCategory.name" value="<ww:property value='modelVideoCategory.name'/>" size="50">
     &nbsp;<font color="#FF0000">(职位名称不能超过30个文字)</font>
    </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>视频数量：</th>
    <td>&nbsp;<input id="volumnCount" name="modelVideoCategory.volumnCount"  onkeyup="value=value.replace(/[^\d]/g,'')"  value="<ww:if test='modelVideoCategory.volumnCount==null'>1</ww:if><ww:elseif test='modelVideoCategory.volumnCount!=null'><ww:property value='modelVideoCategory.volumnCount'/></ww:elseif>" size="50">
     <br/>&nbsp;<font color="#FF0000">(视频数量只能输入数字，并输入的数字不能大于11位)</font>
    </td>
  </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>备注：</th>
    <td>&nbsp;<textarea rows="5" cols="80" id="remar" name="modelVideoCategory.remark"><ww:property value="modelVideoCategory.remark" /></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input id="submitButton" type="button" value="新 增"  onclick="addModelVideoCategory()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>