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
<title>�޸�Ȩ����Ϣ</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateRole(){
		var form = findById("form");
		form.action = "updateRole.do";
		form.submit();	
	}
	
	function init(){
		doSelect('type',"<ww:property value="role.type"/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�޸�Ȩ����Ϣ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th><font color="#FF0000">*</font>Ȩ�����ƣ�</th>
    <td>&nbsp;<input id="name" name="role.name" value="<ww:property value='role.name'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>���룺</th>
    <td>&nbsp;<input id="code" name="role.code" value="<ww:property value='role.code'/>" size="30"></td>
  </tr>
  <tr>
    <th>���ͣ�</th>
    <td>&nbsp;<select id="type" name="role.type">
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
    <th>˳��</th>
    <td>&nbsp;<input id="sequence" name="role.sequence" value="<ww:if test='role.sequence==null'>1</ww:if><ww:elseif test='role.sequence!=null'><ww:property value='role.sequence'/></ww:elseif>">&nbsp;<font color="#FF0000">*ע�⣺˳��ֻ����������,��1��ʼ</font></td>
  </tr>
  <tr>
    <th>˵����</th>
    <td>&nbsp;<textarea id="description" name="role.description" cols="30" rows="4"><ww:property value="role.description"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input type="button" value="�޸�"  onclick="updateRole()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
