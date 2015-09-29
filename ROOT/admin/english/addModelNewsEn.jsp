<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新增新闻发布</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelNews(){
		var title = findById("title").value;
		if(title==""){
			alert('请输入标题');
			return ;
		}
		 
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""||content.replace (/\s+/g,"")=="<html><head><title></title></head><body><p></p></body></html>"){
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
		var sequence=findById("sequence").value;
		if(sequence==""){
			alert("请输入顺序");
			return;
		}
		if(isNaN(sequence)){
			alert("请正确输入顺序");
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
		
		var form = findById("form");
		form.action = "addModelNewsEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增新闻发布</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="modelNewsEn.content">
  <input type="hidden" id="content" name="centerId" value='<ww:property value="centerId" />' >
  <tr>
    <th width="15%"><font color="#FF0000">*</font>标题：</th>
    <td>&nbsp;<input id="title" name="modelNewsEn.title" value="<ww:property value='modelNewsEn.title'/>" size="50">&nbsp; </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>内容：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelNewsEn.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th>新闻图片：</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelNewsEn.path'/>" size="30">
	<br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font></td>
  </tr>
  <tr>
    <th>首页动态图片：</th>
    <td>&nbsp;<input type="file" id="fileSyImage" name="fileSyImage" value="<ww:property value='modelNewsEn.syPath'/>" size="30">
	<br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>发布时间：</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font></td>
  </tr>
  <tr>
    <th width="15%">来源：</th>
    <td>&nbsp;<input id="source" name="modelNewsEn.source" value="<ww:property value='modelNewsEn.source'/>" size="30"></td>
  </tr>
  <tr>
    <th width="15%">通讯员：</th>
    <td>&nbsp;<input id="reporter" name="modelNewsEn.reporter" value="<ww:property value='modelNewsEn.reporter'/>" size="30"></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>点击数：</th>
    <td>&nbsp;<input id="click" name="modelNewsEn.click" value="<ww:property value='modelNewsEn.click'/>" size="30"></td>
  </tr>
   <tr>
 	 <th width="15%"><font color="#FF0000">*</font>年份：</th>
     <td>&nbsp;<input id="year" name="modelNewsEn.year" value="<ww:if test='modelNewsEn.year==null'><ww:property value='dateFormat'/></ww:if><ww:elseif test='modelNewsEn.year!=null'><ww:property value='modelNewsEn.year'/></ww:elseif>" size="10" maxlength="4">&nbsp;<font color="#FF0000"></font></td>
  </tr>
<tr>
  	<th><font color="#FF0000">*</font>顺序：</th>
  	<td>&nbsp;<input id="sequence" name="modelNewsEn.sequence" value="<ww:if test='modelNewsEn.sequence==null'>1</ww:if><ww:elseif test='modelNewsEn.sequence!=null'><ww:property value='modelNewsEn.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*注意:此框只能输入数字，顺序应从1开始，发布日期相同时,数字越大排越后</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input id="submitButton" type="button" value="新 增"  onclick="addModelNews()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
