<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelApplyforView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.entity.ModelAdvertise"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List statusList = (List)request.getAttribute("statusList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>ӦƸ��Ϣ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelApplyforPage.do";
		form.submit();
	}
	function queryModelAdvertise(id){
	<auth:if test="/admin/queryModelApplyfor.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("queryModelApplyfor.do?id="+id,"�鿴ӦƸ��Ϣ",550,300) =="SUCCESS") refresh();
	}
	

	function deleteModelAdvertise(id,pageId){
	<auth:if test="/admin/deleteModelApplyfor.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�ɾ���˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'deleteModelApplyfor.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	
	}
	
	checkit = true;
	function   SelectAll(){      
	 var  aa = document.getElementsByName("productId");      
	    if(checkit){      
	     for(i=0;i<aa.length;i++)      
	        aa.item(i).checked=true;      
	        checkit   =   false;      
	     }      
	     else{for   (i=0;i<aa.length;i++)      
	       aa.item(i).checked=false;      
	        checkit   =   true;      
	      }      
	  }
	  
	function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelApplyfor.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ��ӦƸ��Ϣ����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelApplyfor.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	function init(){

	}
	function refresh(){
		var form = findById("form");
		form.action = "modelApplyforPage.do";
		form.submit();
	}
	function downLoad(id){
	<auth:if test="/admin/downloadFilesApplyfor.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		var params = '';
		window.location.href="downloadFilesApplyfor.do?id="+id;
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">ӦƸ��Ϣ����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			ְλ��<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp; <input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
   <th> 
  	 	<input type="checkbox"      onclick="javascript:SelectAll();">
  	 </th>
  	<th>���</th>
	<th>����</th>
  	<th>ְλ</th>
  	<th>��˾����</th>
	<th>��������</th>
	<th>���·��</th>
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
	  		ModelApplyforView mac = (ModelApplyforView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=mac.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mac.getName() )?"---":mac.getName() %></td>
				<td><%=StringHelper.isEmpty(mac.getAppliedPosition() )?"---":mac.getAppliedPosition()%></td>
				<td><%=StringHelper.isEmpty(mac.getMemberEnterprises() )?"---":mac.getMemberEnterprises() %></td>
               	<td><%=StringHelper.isEmpty(mac.getWorkExperience() )?"---":mac.getWorkExperience() %></td>
               	<%-- <td><%=DictionaryCache.getValueByCode(Dictionary.ADVERTISE_INFO_TYPE,uv.getType()+"")%></td> --%>
               	<td>
               		<%=StringHelper.isEmpty(mac.getTablePath() )?"---":mac.getTablePath() %>
               		<input  type="button" value="����..." onClick="downLoad(<%=mac.getId()%>)">
               	</td>
				<td align="left">
				<input type="button" value="�鿴ӦƸ��Ϣ..." onClick="javascript:queryModelAdvertise(<%=mac.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelAdvertise(<%=mac.getId()%>,<%=count %>);">
				</td>
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
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>