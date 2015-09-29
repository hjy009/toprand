<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.entity.ModelNewsHistory"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelNewsHistoryStatus = (List)request.getAttribute("modelNewsHistoryStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������ʷ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelNewsHistoryPage.do";
		form.submit();
	}
	
	function viewModelNewsHistory(id){
		<!--<auth:if test="/admin/viewModelNewsHistory.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>-->
		if(openDialog("viewModelNewsHistory.do?id="+id,"�鿴������ʷ",850,300) =="SUCCESS") refresh();
	}
	
	function deleteModelNewsHistory(id,pageId){
		<!--<auth:if test="/admin/deleteModelNewsHistory.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>-->
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelNewsHistory.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelNewsHistoryPage.do";
		form.submit();
	}
	
	checkit = true;
	function SelectAll(){      
		var  aa = document.getElementsByName("productId");      
	    	if(checkit){      
	     		for(i=0;i<aa.length;i++)      
	        		aa.item(i).checked=true;      
	        	checkit   =   false;      
	     	}else{
				for(i=0;i<aa.length;i++)      
	       			aa.item(i).checked=false;      
	        	checkit   =   true;      
	      }      
	  }
	   
	function  deleteAll(){
		<!--<auth:if test="/admin/deleteAllModelNewsHistory.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>-->
		var objs=document.getElementsByName("productId");
		var ary ="";
		for(i=0;i<objs.length;i++) {
			if(objs[i].checked) {
				ary+=objs[i].value+",";
			}
		}
		if(ary.length<1) {
			alert("����ѡ��һ��������ʷ����ɾ��");
			return;
		}
		if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
		var params = '';
		var url = 'deleteAllModelNewsHistory.do?ShenHeId='+ary;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function recoveryModelNews(newsId,id,pageId){
		<!--<auth:if test="/admin/reModelNewsHistory.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>-->
		if(confirm('�Ƿ�ָ���ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="recoveryModelNews.do?newsId="+newsId+"&id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function parentRefresh(){
		window.returnValue = "SUCCESS";
		window.close();
	}
	
	function windowClose(){
		window.returnValue = "SUCCESS";
	}
</script>
</head>
<body onUnload="windowClose()">
<table width="96%" align="center" border="0"><tr><td><div class="title">������ʷ����-<font color="#FF0000"><ww:property value="newsTitle"/></font></div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'newsId'"/>
	  <ww:hidden name="'newsTitle'"/>
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���ڴӣ�<ww:textfield name="'startTime'" id="'startTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startTime');">
			����<ww:textfield name="'endTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endTime');">
			&nbsp;���⣺<input id="title" name="title" size="15" value="<ww:property value='title'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(modelNewsHistoryStatus!=null&&modelNewsHistoryStatus.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = modelNewsHistoryStatus.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>	
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th><input type="checkbox" onClick="javascript:SelectAll();"></th>
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
	  		ModelNewsHistory sgv = (ModelNewsHistory)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td width="3%"><input type="checkbox" name="productId" value="<%=sgv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(sgv.getTitle())?"---":sgv.getTitle()%></td>
				<td>
				<%if(sgv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<%}else{%><font color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				</font><%}%></td>
				<td><%=sgv.getPubTimeString()%></td>
				<td><%=sgv.getSequence()%></td>
				<td><%=sgv.getCreateTimeString()%></td>
				<td><%=sgv.getCreator()%></td>
				<td align="left">
				<input type="button" value="�鿴..." onClick="javascript:viewModelNewsHistory(<%=sgv.getId()%>);">
				<input type="button" value="�ָ�..." onClick="javascript:recoveryModelNews(<ww:property value='newsId'/>,<%=sgv.getId()%>,<%=count%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelNewsHistory(<%=sgv.getId()%>,<%=count%>);">
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
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="javascript:parentRefresh();">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>