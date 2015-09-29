<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List groupList = (List)request.getAttribute("groupList");
	List userGroupList = (List)request.getAttribute("userGroupList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��ɫ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function updateAdminGroup(){
		var groupValue = "";
		var group = document.all.group;
		for(var i=0;i<group.length;i++){
			if(group[i].checked){
				groupValue = group[i].value;
			}
		}
		if(groupValue==""){
			alert("��ѡ��һ����ɫ!");
			return;
		}
		var form = findById("form");
		form.action = "updateAdminGroup.do?groupId="+groupValue;
		form.submit();	
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "adminGroupList.do"
		form.submit();
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��ɫ����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	<ww:hidden name="'uId'"/>
	<tr>
		<input type="button" value="�޸Ľ�ɫ" onClick="javascript:updateAdminGroup();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>ѡ��</th>
  	<th>��ɫ����</th>
	<th>˵��</th>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
  <%
  	if( groupList!= null && groupList.size() > 0){
  		int count = 0;
	  	for(int i=0;i<groupList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			    <td><input type="radio" id="group" name="group" value="<%=((Map)groupList.get(i)).get("id")%>" <%if(userGroupList!=null&&userGroupList.size()>0){%><%if(((Integer)((Map)groupList.get(i)).get("id")).intValue()==((Integer)((Map)userGroupList.get(0)).get("group_id")).intValue()){%> checked="checked"<%}%><%}%>></td>
				<td><%=(String)((Map)groupList.get(i)).get("name")%></td>
				<td><%=(String)((Map)groupList.get(i)).get("remark")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="3" height="50">���������</td>
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
		  <input type="button" value="�޸Ľ�ɫ"  onclick="updateAdminGroup()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>