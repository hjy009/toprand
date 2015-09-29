<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.MenuView"%>
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
<title>�˵�����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "menuPage.do";
		form.submit();
	}
	
	function prepareAddMenu(){
		if(openDialog("prepareAddMenu.do","�����˵�",500,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateMenu(id){
		if(openDialog("prepareUpdateMenu.do?id="+id,"�޸Ĳ˵�",450,300) =="SUCCESS") refresh();
	}
	
	function deleteMenu(id,name){
		if(confirm('�Ƿ�ɾ���˲˵�[�˵�:'+name+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteMenu.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "menuPage.do?pageNumber=<ww:property value='pageNumber'/>"
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
<table width="96%" align="center" border="0"><tr><td><div class="title">�˵�����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;�˵����ƣ�<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;���룺<input id="code" name="code" size="11" value="<ww:property value='code'/>">
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
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="�����˵�..." class="mainoption" onClick="prepareAddMenu();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>���</th>
  	<th>�˵�����</th>
	<th>����</th>
	<th>����</th>
	<th>����</th>
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
	  		MenuView mv = (MenuView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mv.getName())?"---":mv.getName()%></td>
				<td><%=StringHelper.isEmpty(mv.getCode())?"---":mv.getCode()%></td>
				<td><%=DictionaryCache.getValueByCode(Dictionary.MENU_TYPE,mv.getType()+"")%></td>
				<td><%=mv.getSequence()%></td>
				<td><%=mv.getCreateTime()%></td>
				<td><%=mv.getCreator()%></td>
				<td align="left"><input type="button" value="�޸���Ϣ..." onClick="javascript:prepareUpdateMenu(<%=mv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteMenu(<%=mv.getId()%>,'<%=mv.getName()%>');"></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="8" height="50">���������</td>
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