<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="/WEB-INF/inc/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�޸ĸ�����Ŀ</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function updateAidPart(){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>30){
			alert('���Ʋ��ܳ���30����');
			return;
		}

		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""){
			alert('����������');
			return ;
		}else{
			findById("content").value = content;
		}
		
		var sequence=findById("sequence").value;
		if(sequence==""){
			alert("������˳��");
			return;
		}
		if(isNaN(sequence)){
			alert("����ȷ����˳��");
			return ;
		}
		var form = findById("form");
		form.action = "updateAidPartEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸ĸ�����Ŀ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="aidpartEn.content">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="aidpartEn.name" value="<ww:property value='aidpartEn.name'/>" size="50">&nbsp;<font color="#FF0000">(���Ʋ��ܳ���30������)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 300 ;
			oFCKeditor.Value = "<ww:property value="aidpartEn.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>

  <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="aidpartEn.sequence" value="<ww:if test='aidpartEn.sequence==null'>1</ww:if><ww:elseif test='aidpartEn.sequence!=null'><ww:property value='aidpartEn.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="parent.window.close();">
		  <input id="submitButton" type="button" value="�޸�"  onclick="updateAidPart()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
