<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������������</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addNewsCenter(){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>30){
			alert('���Ʋ��ܳ���30����');
			return;
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
		form.action = "addModelNewsCenter.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������������</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <tr>
    <th><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelNewsCenter.name" value="<ww:property value='modelNewsCenter.name'/>" size="50">&nbsp;<font color="#FF0000">(���Ʋ��ܳ���30������)</font></td>
  </tr> 
  <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelNewsCenter.sequence" value="<ww:if test='modelNewsCenter.sequence==null'>1</ww:if><ww:elseif test='modelNewsCenter.sequence!=null'><ww:property value='modelNewsCenter.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="parent.window.close();">
		  <input id="submitButton" type="button" value="����"  onclick="addNewsCenter()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
