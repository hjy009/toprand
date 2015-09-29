<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List typeList = (List)request.getAttribute("typeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�����û�</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function addAdminUser(){
		var userName = findById("userName").value;
		if(name==""){
			alert('�������û���');
			return ;
		}
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		var form = findById("form");
		form.action = "addAdminUser.do";
		form.submit();	
	}
	
	function init(){
		doSelect("type","<ww:property value='adminUser.type'/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�����û�</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="addAdminUser.do" method="POST">
  <tr>
    <th><font color="#FF0000">*</font>�û�����</th>
    <td>&nbsp;<input id="userName" name="userName" value="<ww:property value='adminUser.userName'/>"></td>
  </tr>
  <tr>
    <th>���룺</th>
    <td>&nbsp;<font color="#666666">��ʼ����Ĭ��Ϊ888888</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>������</th>
    <td>&nbsp;<input id="name" name="name" value="<ww:property value='adminUser.name'/>"></td>
  </tr>
  <tr>
  	<th><font color="#FF0000">*</font>���ͣ�</th>
	<td>&nbsp;<select id="type" name="type">
							<%if(typeList!=null&&typeList.size()>0){%>
								<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select></td>
  </tr>
  <tr>
    <th>������</th>
    <td>&nbsp;<textarea id="description" name="description" cols="30" rows="4"><ww:property value="adminUser.description"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input type="button" value="����"  onclick="addAdminUser()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
