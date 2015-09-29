<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>修改<ww:property value='typeName' /></title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="/js/WebCalendar.js"></script>
<script>
	function updateModelRemeberTheBig(){
	<auth:if test="/admin/updateModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		var year = findById("year").value;
		if(year==""){
			alert('请选择年数');
			return ;
		}
	
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""||content.replace (/\s+/g,"")=="<html><head><title></title></head><body><p></p></body></html>"){
			alert('请输入内容');
			return ;
		}else{
			findById("content").value = content;
		}
		var form = findById("form");
		form.action = "updateModelRemeberTheBigEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function previewImageVideo(type,path){
		if(openDialog("previewImageVideo.do?previewType="+type+"&previewPath="+path,"预览",560,392) =="SUCCESS") refresh();
	}
	
	function init(){
		doSelect('type',"<ww:property value="modelRemeberTheBigEn.type"/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">修改<ww:property value='typeName' /></div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="modelRemeberTheBigEn.content">
<ww:hidden name="'id'"></ww:hidden>
 <tr>
     <th><font color="#FF0000">*</font>年数：</th>
    <td><input type="text"  name="modelRemeberTheBigEn.year" maxlength="100" id="year" value="<ww:property value='modelRemeberTheBigEn.year'/>"   />年</font></td>
  </tr>
	<%--<tr>
  	<th><font color="#FF0000">*</font>类型：</th>
	<td>&nbsp;<select id="type" name="modelRemeberTheBig.type">
							<%if(typeList!=null&&typeList.size()>0){%>
								<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select></td>
  </tr>
  
  <tr>
    <th>图片：</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelRemeberTheBig.path'/>" size="30">
    <br><ww:if test="modelRemeberTheBig.path==null">图片：暂无</ww:if><ww:elseif test="modelRemeberTheBig.path!=null">图片：<ww:property value='modelRemeberTheBig.path'/><input type="button" value="预览" onClick="javascript:previewImageVideo(1,'<ww:property value="modelRemeberTheBig.path"/>');" /></ww:elseif>
     <br><font color="#FF0000">(上传的图片只支持jpg,gif,bmp格式,大小不能超过500k)</font>
	</td>
  </tr>
  
  --%><tr>
    <th><font color="#FF0000">*</font>内容：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 300 ;
			oFCKeditor.Value = "<ww:property value="modelRemeberTheBigEn.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="parent.window.close();">
		  <input id="submitButton" type="button" value="修 改"  onclick="updateModelRemeberTheBig()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
