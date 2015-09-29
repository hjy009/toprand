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
<title>新增权限</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function addRole(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入权限名称');
			return ;
		}
		var code = findById("code").value;
		if(code==""){
			alert('请输入代码');
			return ;
		}
		var form = findById("form");
		form.action = "addRole.do";
		form.submit();	
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增权限</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <tr>
    <th><font color="#FF0000">*</font>权限名称：</th>
    <td>&nbsp;<input id="name" name="name" value="<ww:property value='role.name'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>代码：</th>
    <td>&nbsp;<input id="code" name="code" value="<ww:property value='role.code'/>" size="30"></td>
  </tr>
  <tr>
    <th>类型：</th>
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
    <th>顺序：</th>
    <td>&nbsp;<input id="sequence" name="sequence" value="<ww:if test='role.sequence==null'>1</ww:if><ww:elseif test='role.sequence!=null'><ww:property value='role.sequence'/></ww:elseif>">&nbsp;<font color="#FF0000">*注意：顺序只能输入数字,由1开始</font></td>
  </tr>
  <tr>
    <th>说明：</th>
    <td>&nbsp;<textarea id="description" name="description" cols="30" rows="4"><ww:property value="role.description"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input type="button" value="新增"  onclick="addRole()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
