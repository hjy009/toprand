<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.RoleView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List typeList = (List)request.getAttribute("typeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Ȩ�޹���</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "rolePage.do";
		form.submit();
	}
	
	function prepareAddRole(){
		if(openDialog("prepareAddRole.do","����Ȩ��",450,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateRole(id){
		if(openDialog("prepareUpdateRole.do?id="+id,"�޸�Ȩ����Ϣ",450,300) =="SUCCESS") refresh();
	}
	
	function deleteRole(id,name){
		if(confirm('�Ƿ�ɾ����Ȩ��[Ȩ������:'+name+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteRole.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "rolePage.do"
		form.submit();
	}
	
	function init(){
		doSelect('type',"<ww:property value="type"/>");
		doSelect('order',"<ww:property value="order"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">Ȩ�޹���</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;Ȩ�����ƣ�<input id="name" name="name" size="15" value="<ww:property value='name'/>">
			&nbsp;���룺<input id="code" name="code" size="15" value="<ww:property value='code'/>">
			&nbsp;���ͣ�<select id="type" name="type">
							<%if(typeList!=null&&typeList.size()>0){%>
							<option value="">ȫ��</option>
						<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;����<select id="order" name="order">
							<option value="">������</option>
							<option value="1">˳������</option>
							<option value="2">��������</option>
						</select>
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="����Ȩ��..." class="mainoption" onClick="prepareAddRole();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>���</th>
  	<th>Ȩ������</th>
	<th>����</th>
	<th>����</th>
	<th>����</th>
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
	  		RoleView rv = (RoleView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(rv.getName())?"---":rv.getName()%></td>
				<td><%=StringHelper.isEmpty(rv.getCode())?"---":rv.getCode()%></td>
				<td><%=DictionaryCache.getValueByCode(Dictionary.ROLE_TYPE,rv.getType()+"")%></td>
				<td><%=rv.getSequence()%></td>
				<td><%=StringHelper.isEmpty(rv.getDescription())?"---":rv.getDescription()%></td>
				<td><%=rv.getCreateTime()%></td>
				<td><%=rv.getCreator()%></td>
				<td align="left"><input type="button" value="�޸�..." onClick="javascript:prepareUpdateRole(<%=rv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteRole(<%=rv.getId()%>,'<%=rv.getName()%>');"></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="9" height="50">���������</td>
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