<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�鿴ӦƸ��Ϣ</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�鿴ӦƸ��Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
   <tr>
    <th>������</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.name"/></td>
  <tr>
  <tr>
    <th>ӦƸְλ��</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.appliedPosition"/></td>
  </tr>
    <tr>
    <th>��Ա��ҵ��</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.memberEnterprises"/></td>
    </tr>
  <tr>
    <th>�Ա�</th>
    <td>&nbsp; <ww:if test="modelApplyforEn.sex==1">��</ww:if><ww:else>Ů</ww:else></td>
  </tr>
   <tr>
  	<th>�������ڣ�</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.dateOfBirth"/></a></td>
  </tr>

  <tr>
  	<th>���֤��</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.certificate"/></a></td>
  </tr>
    <tr>
  	<th>��ס��ַ��</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.address"/></td>
  </tr>
  <tr>
  	<th>��   �᣺</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.nativePlace"/></textarea></td>
  </tr>
 
   <tr>
  	<th>��ϵ�绰��</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.phone"/></td>
  </tr>
  <tr>
  	<th>E - mail��</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.email"/></td>
  </tr>
  <tr>
  	<th>�������ޣ�</th>
  	<td>&nbsp;<ww:property value="modelApplyforEn.workLife"/></td>
  </tr>
  <tr>
    <th>ѧ    ����</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.degree" /></td>
  </tr>
  <tr>
    <th>ר    ҵ��</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.professional" /></td>
  </tr>
  <tr>
    <th>��    �</th>
    <td>&nbsp;<ww:property value="modelApplyforEn.english" /></td>
  </tr>
  <tr>
    <th>����������</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyforEn.educationExperience" /></textarea></td>
  </tr>
  <tr>
    <th>����������</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyforEn.workExperience" /></textarea></td>
  </tr>
  <tr>
    <th>�������ۣ�</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyforEn.selfEvaluation" /></textarea></td>
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
