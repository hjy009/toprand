<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�鿴��Ƹ��Ϣ</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�鿴��Ƹ��Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
   <tr>
    <th>��ϵ�ˣ�</th>
    <td>&nbsp;<ww:property value="modelAdvertise.linkman"/></td>
  <tr>
  <tr>
    <th>ְλ���ƣ�</th>
    <td>&nbsp;<ww:property value="modelAdvertise.name"/></td>
  </tr>
    <tr>
    <th>��Ƹ������</th>
    <td>&nbsp;<ww:property value="modelAdvertise.adPerson"/></td>
    </tr>
  <tr>
    <th>ѧ��Ҫ��</th>
    <td>&nbsp;<ww:property value="modelAdvertise.degree"/>
    </td>
  </tr>
   <tr>
  	<th>����ʱ�䣺</th>
  	<td>&nbsp;<ww:property value="pubTime"/></a></td>
  </tr>
  <%--
  <tr>
  	<th>��ʼʱ�䣺</th>
  	<td>&nbsp;<ww:property value="startTime"/></a></td>
  </tr>
    <tr>
  	<th>����ʱ�䣺</th>
  	<td>&nbsp;<ww:property value="endTime"/></td>
  </tr>
    --%><tr>
  	<th>����Ҫ��(˵��)��</th>
  	<td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelAdvertise.description"/></textarea></td>
  </tr>
    <tr>
  	<th>����Ҫ��</th>
  	<td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelAdvertise.requires"/></textarea></td>
  </tr>
    <tr>
  	<th>�绰��</th>
  	<td>&nbsp;<ww:property value="modelAdvertise.telephone"/></td>
  </tr>
  <tr>
  	<th>�����ߣ�</th>
  	<td>&nbsp;<ww:property value="modelAdvertise.creator"/></td>
  </tr>
  <tr>
    <th>����ʱ�䣺</th>
    <td>&nbsp;<ww:property value="timeFormat" /></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
