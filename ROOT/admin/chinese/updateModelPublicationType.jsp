<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�޸ĵ����ڿ�</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function updateModelPeriodical(id){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>30){
			alert("���ⲻ�ܳ���30����");
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
		form.action = "updateModelPublicationType.do?id="+id;
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
	}
	function previewImageVideo(type,path){
		if(openDialog("previewImageVideo.do?previewType="+type+"&previewPath="+path,"Ԥ��",400,300) =="SUCCESS") refresh();
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸ĵ����ڿ�</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
<ww:hidden name="id" value="link.id"></ww:hidden>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelPeriodical.name" value="<ww:property value='modelPeriodical.name'/>" size="50">&nbsp;<font color="#FF0000">(���Ʋ��ܳ���30������)</font></td>
  </tr>
	<tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelPeriodical.sequence" value="<ww:if test='modelPeriodical.sequence==null'>1</ww:if><ww:elseif test='modelPeriodical.sequence!=null'><ww:property value='modelPeriodical.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input id="submitButton" type="button" value="�� ��"  onclick="updateModelPeriodical(<ww:property value='modelPeriodical.id' />)">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>