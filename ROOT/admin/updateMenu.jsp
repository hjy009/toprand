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
<title>修改菜单信息</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateMenu(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入菜单名称');
			return false;
		}
		var code = findById("code").value;
		if(code==""){
			alert('请输入代码');
			return false;
		}
		var form = findById("form");
		form.action = "updateMenu.do";
		form.submit();	
	}
	
	function init(){
		doSelect('type',"<ww:property value="menu.type"/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">修改菜单信息</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th><font color="#FF0000">*</font>菜单名称：</th>
    <td>&nbsp;<input id="name" name="menu.name" value="<ww:property value='menu.name'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>代码：</th>
    <td>&nbsp;<input id="code" name="menu.code" value="<ww:property value='menu.code'/>" size="30"></td>
  </tr>
  <tr>
    <th>类型：</th>
    <td>&nbsp;<select id="type" name="menu.type">
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
    <td>&nbsp;<input id="sequence" name="menu.sequence" value="<ww:if test='menu.sequence==null'>1</ww:if><ww:elseif test='menu.sequence!=null'><ww:property value='menu.sequence'/></ww:elseif>">&nbsp;<font color="#FF0000">*注意：顺序只能输入数字,由1开始</font></td>
  </tr>
  <tr>
    <th>说明：</th>
    <td>&nbsp;<textarea id="description" name="menu.description" cols="30" rows="4"><ww:property value="menu.description"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input type="button" value="修改"  onclick="updateMenu()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
