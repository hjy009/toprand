<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>����������Ŀ</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelCulture(){
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
		form.action = "addAidPart.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">����������Ŀ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="aidpart.content">
  <tr>
    <th><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="aidpart.name" value="<ww:property value='aidpart.name'/>" size="50">&nbsp;<font color="#FF0000">(���Ʋ��ܳ���30������)</font></td>
  </tr>

  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 300 ;
			oFCKeditor.Value = "<ww:property value="aidpart.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>

  <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="aidpart.sequence" value="<ww:if test='sequence==1'>1</ww:if><ww:elseif test='aidpart.sequence!=1'><ww:property value='aidpart.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="parent.window.close();">
		  <input id="submitButton" type="button" value="����"  onclick="addModelCulture()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
