<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List roleChList = (List)request.getAttribute("roleChList");
	List roleEnList = (List)request.getAttribute("roleEnList");
	List roleJpList = (List)request.getAttribute("roleJpList");
	List groupRoleList = (List)request.getAttribute("groupRoleList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Ȩ�޷���</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function updateGroupRole(){
		var roleGroup = "";
		var roleSize = 0;
		var groupId = <ww:property value='groupId'/>;
		<%if(roleChList!=null&&roleChList.size()>0){%>
			roleSize = roleSize+<%=roleChList.size()%>;
		<%}%>
		<%if(roleEnList!=null&&roleEnList.size()>0){%>
			roleSize = roleSize+<%=roleEnList.size()%>;
		<%}%>
		<%if(roleJpList!=null&&roleJpList.size()>0){%>
			roleSize = roleSize+<%=roleJpList.size()%>;
		<%}%>
		<%if(roleChList==null&&roleEnList==null&&roleJpList==null){%>
			alert("û�в˵�ѡ��,�뷵��");
			return false;
		<%}%>
		if(roleSize>0){
			for(var i=0;i<roleSize;i++){
				if(document.getElementById("role"+i).checked){
					var roleValue = document.getElementById("role"+i).value;
						roleGroup += roleValue+",";
				}
			}
		}
		if(roleGroup==""){
			alert('������ѡ��һ��Ȩ��');
			return false;
		}
		var form = findById("form");
		form.action = "updateGroupRole.do?roleGroup="+roleGroup;
		form.submit();	
	}
	
	function checkAll(){ 
		var code_Values = document.all['role']; 
		if(code_Values.length){ 
			for(var i=0;i<code_Values.length;i++){ 
				code_Values[i].checked = true; 
			} 
		}else{ 
			code_Values.checked = true; 
		} 
	} 
	
	function uncheckAll(){ 
		var code_Values = document.all['role']; 
		if(code_Values.length){ 
			for(var i=0;i<code_Values.length;i++){ 
				code_Values[i].checked = false; 
			} 
		}else{ 
			code_Values.checked = false; 
		} 
	} 
	
	function refresh(){
		var form = findById("form");
		form.action = "groupRoleList.do"
		form.submit();
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">Ȩ�޷���</div></td></tr></table>
<table width="96%"  cellspacing="1" cellpadding="1" class="optiontable" align="center">
	<form id="form" action="" method="POST">
	  <ww:hidden name="'groupId'"/>
	  <tr>
	  	<input type="button" value="ȫѡ" onClick="javascript:checkAll();">
		<input type="button" value="ȡ��ȫѡ" onClick="javascript:uncheckAll();">
		<input type="button" value="�޸�Ȩ��" onClick="javascript:updateGroupRole();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>ѡ��</th>
  	<th>Ȩ������</th>
	<th>����</th>
	<th>˵��</th>
  </tr>
  <tr>
	<td class="rowodd" colspan="4" align="left">���Ĺ���Ȩ��</td>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
  <%
  	if(roleChList != null && roleChList.size() > 0){
  		int count = 0;
	  	for(int i=0;i<roleChList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="role<%=count-1%>" name="role" value='<%=(Integer)((Map)roleChList.get(i)).get("id")%>' 
				<%if(groupRoleList!=null&&groupRoleList.size()>0){%>
					<%for(int j=0;j<groupRoleList.size();j++){%>
						<%if(((Integer)((Map)groupRoleList.get(j)).get("role_id")).intValue()==((Integer)((Map)roleChList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)roleChList.get(i)).get("name"))?"---":(String)((Map)roleChList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleChList.get(i)).get("code"))?"---":(String)((Map)roleChList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleChList.get(i)).get("description"))?"---":(String)((Map)roleChList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">���������</td>
			  </tr>
  <%	  	
	  }
  %>
  <tr>
	<td class="rowodd" colspan="4" align="left">Ӣ�Ĺ���Ȩ��</td>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
  <%
  	if(roleEnList != null && roleEnList.size() > 0){
  		int count = 0;
		if(roleChList!=null&&roleChList.size()>0){
			count = count+roleChList.size();
		}
	  	for(int i=0;i<roleEnList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="role<%=count-1%>" name="role" value='<%=(Integer)((Map)roleEnList.get(i)).get("id")%>' 
				<%if(groupRoleList!=null&&groupRoleList.size()>0){%>
					<%for(int j=0;j<groupRoleList.size();j++){%>
						<%if(((Integer)((Map)groupRoleList.get(j)).get("role_id")).intValue()==((Integer)((Map)roleEnList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)roleEnList.get(i)).get("name"))?"---":(String)((Map)roleEnList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleEnList.get(i)).get("code"))?"---":(String)((Map)roleEnList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleEnList.get(i)).get("description"))?"---":(String)((Map)roleEnList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">���������</td>
			  </tr>
  <%	  	
	  }
  %>
  <tr>
	<td class="rowodd" colspan="4" align="left">���Ĺ���Ȩ��</td>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
  <%
  	if(roleJpList != null && roleJpList.size() > 0){
  		int count = 0;
		if(roleChList!=null&&roleChList.size()>0){
			count = count+roleChList.size();
		}
		if(roleEnList!=null&&roleEnList.size()>0){
			count = count+roleEnList.size();
		}
	  	for(int i=0;i<roleJpList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="role<%=count-1%>" name="role" value='<%=(Integer)((Map)roleJpList.get(i)).get("id")%>' 
				<%if(groupRoleList!=null&&groupRoleList.size()>0){%>
					<%for(int j=0;j<groupRoleList.size();j++){%>
						<%if(((Integer)((Map)groupRoleList.get(j)).get("role_id")).intValue()==((Integer)((Map)roleJpList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)roleJpList.get(i)).get("name"))?"---":(String)((Map)roleJpList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleJpList.get(i)).get("code"))?"---":(String)((Map)roleJpList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)roleJpList.get(i)).get("description"))?"---":(String)((Map)roleJpList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">���������</td>
			  </tr>
  <%	  	
	  }
  %>
  <!-- ================================================ -->
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input type="button" value="�޸�Ȩ��"  onclick="updateGroupRole()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>