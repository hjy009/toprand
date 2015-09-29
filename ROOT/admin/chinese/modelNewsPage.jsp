<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelNewsView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelNewsStatus = (List)request.getAttribute("modelNewsStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>���ŷ�������</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelNewsPage.do?centerId=<ww:property value='centerId' />";
		form.submit();
	}
	function prepareUpdateModelNews(id){
	<auth:if test="/admin/prepareUpdateModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelNews.do?id="+id,"�޸����ŷ���",850,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelNews(){
	<auth:if test="/admin/prepareAddModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelNews.do?centerId=<ww:property value='centerId' />","�������ŷ���",850,300)=="SUCCESS")refresh();
	}
	
	function deleteModelNews(id,pageId){
	<auth:if test="/admin/deleteModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']��ɾ�����Ҳ��ش����Ź�������ʷ��¼')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelNews.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditModelNews(id,pageId){
	<auth:if test="/admin/auditModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelNews.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelNews(id,pageId){
	<auth:if test="/admin/reAuditModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelNews.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		doSelect('sequence',"<ww:property value="sequence"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelNewsPage.do?centerId=<ww:property value='centerId' />";
		form.submit();
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
	  
	   function  shenhe(){
	   <auth:if test="/admin/auditAllModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����Ž������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�") == false) return ;
			var params = '';
			var url = 'auditAllModelNews.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����Ž��������");
				return;
			}
			
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = '';
			var url = 'reAuditAllModelNews.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelNews.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����Ž���ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�ɾ�����Ҳ������Ź�������ʷ��¼") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelNews.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	function modelNewsHistoryPage(newsId,newsTitle){
		<auth:if test="/admin/modelNewsHistoryPage.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("modelNewsHistoryPage.do?newsId="+newsId+"&newsTitle="+newsTitle,"������ʷ����",950,300)=="SUCCESS")refresh();
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">���ŷ�������</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���ڴӣ�<ww:textfield name="'startTime'" id="'startTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startTime');">
			����<ww:textfield name="'endTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endTime');">
			&nbsp;���⣺<input id="title" name="title" size="15" value="<ww:property value='title'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(modelNewsStatus!=null&&modelNewsStatus.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = modelNewsStatus.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>	
			<!-- &nbsp;����<select id="sequence" name="sequence">
							<option value="">������</option>
							<option value="0">˳������</option>
							<option value="1">��������</option>
						</select>-->
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="�������ŷ���..." class="mainoption" onClick="javascript:prepareAddModelNews();">
			<input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			<input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
			<input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
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
	<th>״̬</th>
	<th>����ʱ��</th>
	<th>˳��</th>
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
	  		ModelNewsView sgv = (ModelNewsView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=sgv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(sgv.getTitle())?"---":sgv.getTitle()%></td>
				<td><%if(sgv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditModelNews(<%=sgv.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditModelNews(<%=sgv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=sgv.getPubTime()%></td>
				<td><%=sgv.getSequence()%></td>
				<td><%=sgv.getCreateTime()%></td>
				<td><%=sgv.getCreator()%></td>
				<td align="left">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateModelNews(<%=sgv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelNews(<%=sgv.getId()%>,<%=count%>);">
			<!-- 	<input type="button" value="��ʷ..." onClick="javascript:modelNewsHistoryPage(<%=sgv.getId()%>,'<%=sgv.getTitle()%>');"> -->
				</td>
				
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