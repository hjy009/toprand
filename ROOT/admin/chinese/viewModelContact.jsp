<%@ include file="/WEB-INF/inc/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��ϵ���ǹ���</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function updateModelContact(){
	<auth:if test="/admin/updateModelContact.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		
		if(content==""||content.replace (/\s+/g,"")=="<html><head><title></title></head><body><p></p></body></html>"){
			alert('����������');
			return ;
		}else{
			findById("content").value = content;
		}
		var form = findById("form");
		form.action = "updateModelContact.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��ϵ���ǹ���</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="modelContact.content">
	<input type="hidden" id="id" name="modelContact.id" value='<ww:property value="modelContact.id"/>'>   
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 400 ;
			oFCKeditor.Value = "<ww:property value="modelContact.content"/>";
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
		  <input id="submitButton" type="button" value="�� ��"  onclick="updateModelContact()">
		</td>
	</tr>
</table>
<ww:if test="isSuccess()">
	<script language="javascript">
		if("<ww:property value="responseMessage"/>" == ""){
			alert("�����ɹ�!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}
		parent.window.returnValue = "SUCCESS";
	</script>
</ww:if>
<ww:if test="isFailure()">
	<script language="javascript">		
		if("<ww:property value="responseMessage"/>" == ""){
			alert("����ʧ�ܣ����Ժ�����!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}		
	</script>
</ww:if>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
