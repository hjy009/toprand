<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�޸���Ƶ����</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function updateModelVideoCategory(){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>30){
			alert("���Ʋ��ܳ���30����");
			return;
		}
		var volumnCount = findById("volumnCount").value;
		if(volumnCount==""){
			alert('��������Ƶ����');
			return;
		}
		var volumnCount = findById("volumnCount").value;
		if(volumnCount.length>=11){
			alert("��Ƶ������������ֲ��ܴ���11λ");
			return;
		}
		var form = findById("form");
		form.action = "updateModelVideoCategoryEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸���Ƶ����</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <ww:hidden name="'id'"></ww:hidden>
  <tr>
    <th><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelVideoCategoryEn.name" value="<ww:property value='modelVideoCategoryEn.name'/>" size="50">
     &nbsp;<font color="#FF0000">(ְλ���Ʋ��ܳ���30������)</font>
    </td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>��Ƶ������</th>
    <td>&nbsp;<input id="volumnCount" name="modelVideoCategoryEn.volumnCount"  onkeyup="value=value.replace(/[^\d]/g,'')"  value="<ww:property value='modelVideoCategoryEn.volumnCount'/>" size="50">
     <br/>&nbsp;<font color="#FF0000">(��Ƶ����ֻ���������֣�����������ֲ��ܴ���11λ)</font>
    </td>
  </tr>
     <tr>
    <th><font color="#FF0000"><%--*--%></font>��ע��</th>
    <td>&nbsp;<textarea rows="3" cols="80" id="remar" name="modelVideoCategoryEn.remark"><ww:property value="modelVideoCategoryEn.remark" /></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input id="submitButton" type="button" value="�� ��"  onclick="updateModelVideoCategory()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>