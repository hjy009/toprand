<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="java.util.*"%>
<%
	List typeList = (List)request.getAttribute("typeList");
	List degreeTypeList = (List)request.getAttribute("degreeTypeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������Ƹ��Ϣ</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelAdvertise(){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>30){
			alert("���Ʋ��ܳ���30����");
			return;
		}
		var description = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(description==""){
			alert('����������');
			return ;
		}else{
			findById("description").value = description;
		}
		var requires = FCKeditorAPI.GetInstance('FCKeditor2').GetXHTML(true);
		if(requires==""){
			alert('����������');
			return ;
		}else{
			findById("requires").value = requires;
		}
		
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('��ѡ�񷢲�ʱ��');
			return ;
		}
		<%--
		var startTime = findById("startTime").value;
		if(startTime==""){
			alert('��ѡ��ʼʱ��');
			return ;
		}
		var endTime = findById("endTime").value;
		if(endTime==""){
			alert('��ѡ�����ʱ��');
			return ;
		}
		--%>
		var form = findById("form");
		form.action = "addModelAdvertise.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		doSelect('degree',"<ww:property value='modelAdvertise.degree'/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������Ƹ��Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="description" name="modelAdvertise.description">
  <input type="hidden" id="requires" name="modelAdvertise.requires">
  <tr>
    <th><font color="#FF0000">*</font>ְλ���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelAdvertise.name" value="<ww:property value='modelAdvertise.name'/>" size="50">
     &nbsp;<font color="#FF0000">(ְλ���Ʋ��ܳ���30������)</font>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>��˾���ƣ�</th>
    <td>&nbsp;
     	<select id="adPerson" name="modelAdvertise.company" style="width: 173px"  >					
       		<option value="�����»������ʼ�װ�����޹�˾">�����»������ʼ�װ�����޹�˾</option>
       		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
       		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
       		<option value="����»��������豸���޹�˾">����»��������豸���޹�˾</option>
       		<option value="������¡���ֻ������޹�˾">������¡���ֻ������޹�˾</option>
       		<option value="�����»�����װ�����޹�˾">�����»�����װ�����޹�˾</option>
       		<option value="�����»���ľҵ���޹�˾">�����»���ľҵ���޹�˾</option>
       		<option value="�ൺ�����»�����װ�����޹�˾">�ൺ�����»�����װ�����޹�˾</option>
       		<option value="�»����������޹�˾">�»����������޹�˾</option>
         </select>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>�����ص㣺</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertise.workingPlace" value="<ww:property value='modelAdvertise.workingPlace'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>��Ƹ������</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertise.adPerson" value="<ww:property value='modelAdvertise.adPerson'/>" size="30"></td>
  </tr>
  <tr>
   <th>ѧ��Ҫ��</th>
  	 <td>
  	  &nbsp;<input id="adPerson" name="modelAdvertise.degree" value="<ww:property value='modelAdvertise.degree'/>" size="30"></td>
	</td>
	</tr>
	<%-- <tr>
    <th><font color="#FF0000">*</font>��ʼʱ�䣺</th>
    <td>&nbsp;<ww:textfield name="'startTime'" id="'startTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startTime');">
     &nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font>
    </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
    <td>&nbsp;<ww:textfield name="'endTime'" id="'endTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endTime');">
     &nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font>
    </td>
  </tr>
    --%>
    <tr>
	    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
	    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">
	     &nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font>
	    </td>
 	 </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>����Ҫ��˵������</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertise.description"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>����Ҫ��</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor2' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertise.requires"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>��ϵ�ˣ�</th>
    <td>&nbsp;<input id="linkman" name="modelAdvertise.linkman" value="<ww:property value='modelAdvertise.linkman'/>" size="30"></td>
  	</tr>
   <tr>
    <th><font color="#FF0000"></font>�绰��</th>
    <td>&nbsp;<input id="telephone" name="modelAdvertise.telephone" value="<ww:property value='modelAdvertise.telephone'/>" size="30"></td>
  </tr>
      <tr>
    <th><font color="#FF0000"></font>���䣺</th>
    <td>&nbsp;<input id="email" name="modelAdvertise.email" value="<ww:property value='modelAdvertise.email'/>" size="30"></td>
  </tr>


</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input id="submitButton" type="button" value="�� ��"  onclick="addModelAdvertise()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
