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
		form.action = "addModelAdvertiseEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		doSelect('degree',"<ww:property value='modelAdvertiseEn.degree'/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������Ƹ��Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="description" name="modelAdvertiseEn.description">
  <input type="hidden" id="requires" name="modelAdvertiseEn.requires">
  <tr>
    <th><font color="#FF0000">*</font>ְλ���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelAdvertiseEn.name" value="<ww:property value='modelAdvertiseEn.name'/>" size="50">
     &nbsp;<font color="#FF0000">(ְλ���Ʋ��ܳ���30������)</font>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>��˾���ƣ�</th>
    <td>&nbsp;
     	<select id="adPerson" name="modelAdvertiseEn.company" style="width: 340px"  >					
		                 		<option value="CHANGZHOU XINHUACHANG INT��L CONTAINERS CO.,LTD">CHANGZHOU XINHUACHANG INT��L CONTAINERS CO.,LTD</option>
		                 		<option value="NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD">NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD">HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD</option>
		                 		<option value="TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD">TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC GROUP CONTAINERS COMPANY LIMITED">CXIC GROUP CONTAINERS COMPANY LIMITED</option>
		                 		<option value="JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD">JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC JIASHAN TIMBER PRODUCTS CO.,LTD">CXIC JIASHAN TIMBER PRODUCTS CO.,LTD</option>
		                 		<option value="QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD">QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD</option>
         </select>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>�����ص㣺</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertiseEn.workingPlace" value="<ww:property value='modelAdvertiseEn.workingPlace'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>��Ƹ������</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertiseEn.adPerson" value="<ww:property value='modelAdvertiseEn.adPerson'/>" size="30"></td>
  </tr>
  <tr>
   <th>����Ҫ��</th>
  	 <td>
  	  &nbsp;<input id="adPerson" name="modelAdvertiseEn.degree" value="<ww:property value='modelAdvertiseEn.degree'/>" size="30"></td>
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
    <th><font color="#FF0000"><%--*--%></font>����˵����</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertiseEn.description"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>רҵҪ��</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor2' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertiseEn.requires"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>��ϵ�ˣ�</th>
    <td>&nbsp;<input id="linkman" name="modelAdvertiseEn.linkman" value="<ww:property value='modelAdvertiseEn.linkman'/>" size="30"></td>
  	</tr>
   <tr>
    <th><font color="#FF0000"></font>�绰��</th>
    <td>&nbsp;<input id="telephone" name="modelAdvertiseEn.telephone" value="<ww:property value='modelAdvertiseEn.telephone'/>" size="30"></td>
  </tr>
      <tr>
    <th><font color="#FF0000"></font>���䣺</th>
    <td>&nbsp;<input id="email" name="modelAdvertiseEn.email" value="<ww:property value='modelAdvertiseEn.email'/>" size="30"></td>
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
