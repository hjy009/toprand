<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.AdminGroupView"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��ɫ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "adminGroupPage.do";
		form.submit();
	}
	
	function prepareAddAdminGroup(){
		if(openDialog("prepareAddAdminGroup.do","������ɫ",450,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateAdminGroup(id){
		if(openDialog("prepareUpdateAdminGroup.do?id="+id,"�޸Ľ�ɫ��Ϣ",450,300) =="SUCCESS") refresh();
	}
	
	function deleteAdminGroup(id,name){
		if(confirm('�Ƿ�ɾ���˽�ɫ[��ɫ����:'+name+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteAdminGroup.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function groupRoleList(groupId){
		if(openDialog("groupRoleList.do?groupId="+groupId,"����Ȩ��",650,300) =="SUCCESS") refresh();
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "adminGroupPage.do"
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
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;��ɫ���ƣ�<input id="name" name="name" size="15" value="<ww:property value='name'/>">
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="������ɫ..." class="mainoption" onClick="prepareAddAdminGroup();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>���</th>
  	<th>��ɫ����</th>
	<th>˵��</th>
	<th>����ʱ��</th>
	<th>������</th>
	<th>����</th>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
  <%
  	if(pages != null && pages.getTotalCount() > 0){
  		int pageNumber = pages.getPageNumber();int pageMaxSize = pages.getPageMaxSize();
  		int count = 0;
  		int showCount = 0;
  		if(pageNumber>1){
			if(pages.getPageCount()>1&&pages.getPageCount()>=pageNumber){
				count = (pageNumber-1)*pageMaxSize;
			}else{
				count = (pageNumber-2)*pageMaxSize;
			}
		}
	  	for(Iterator it = pages.iterator();it.hasNext();){
	  		count++;
			showCount++;
	  		AdminGroupView agv = (AdminGroupView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(agv.getName())?"---":agv.getName()%></td>
				<td><%=StringHelper.isEmpty(agv.getRemark())?"---":agv.getRemark()%></td>
				<td><%=agv.getCreateTime()%></td>
				<td><%=agv.getCreator()%></td>
				<td align="left"><input type="button" value="Ȩ�޷���..." onClick="javascript:groupRoleList(<%=agv.getId()%>);">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateAdminGroup(<%=agv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteAdminGroup(<%=agv.getId()%>,'<%=agv.getName()%>');"></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="6" height="50">���������</td>
			  </tr>
  <%	  	
	  }
  %>
  <!-- ================================================ -->
</table>
<table width="96%" border="0" align="center"><tr><td><%@include file="/WEB-INF/inc/page.jsp"%></td></tr></table>
<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>