<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelPeriodicalCenterEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelProductCategoryStatus = (List)request.getAttribute("modelProductCategoryStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title><ww:property value="typeName" />����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelPeriodicalCenterEnPage.do?periodicalId=<ww:property value='periodicalId'/>";
		form.submit();
	}
	function prepareUpdateModelPeriodical(id){
		<auth:if test="/admin/prepareUpdateModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelPeriodicalCenterEn.do?id="+id+"&typeName=<ww:property value='typeName' />","�޸�<ww:property value='typeName' />����",650,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelPeriodica(){
		<auth:if test="/admin/prepareAddModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelPeriodicalCenterEn.do?periodicalId=<ww:property value='periodicalId'/>","���������ڿ�",650,200)=="SUCCESS")refresh();
	}
	
	function deleteModelPeriodical(id,pageId){
		<auth:if test="/admin/deleteAllModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteAllModelPeriodicalCenterEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditModelPeriodical(id,pageId){
		<auth:if test="/admin/auditModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelPeriodicalCenterEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelPeriodical(id,pageId){
		<auth:if test="/admin/reAuditModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelPeriodicalCenterEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelPeriodicalCenterEnPage.do?periodicalId=<ww:property value='periodicalId'/>";
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
	   <auth:if test="/admin/auditAllModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ʒ����������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = '';
			var url = 'auditAllModelPeriodicalCenterEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ʒ������������");
				return;
			}
			
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = '';
			var url = 'reAuditAllModelPeriodicalCenterEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	    function  deleteAll(){
	   <auth:if test="/admin/deleteModelPeriodicalCenterEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ���������Ľ���ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteModelPeriodicalCenterEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }

</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title"><ww:property value="typeName" />����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  
	  <tr>
		<td style="border:0;" >
			&nbsp;���ƣ�<input id="name" name="name" size="30" value="<ww:property value='name'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(modelProductCategoryStatus!=null&&modelProductCategoryStatus.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = modelProductCategoryStatus.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>	
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="���������ڿ�" class="mainoption" onClick='javascript:prepareAddModelPeriodica()'>
			&nbsp;&nbsp;<input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp;<input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
			&nbsp;&nbsp; <input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  <th><input type="checkbox"      onclick="javascript:SelectAll();"></th>
  	<th>���</th>
  	<th>����</th>
	<th>ͼƬ·��</th>
	<th>״̬</th>
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
	  		ModelPeriodicalCenterEnView mpv = (ModelPeriodicalCenterEnView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=mpv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mpv.getName())?"---":mpv.getName()%></td>
				<td><%=StringHelper.isEmpty(mpv.getImagePath())?"---":mpv.getImagePath()%></td>
				<td><%if(mpv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mpv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditModelPeriodical(<%=mpv.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mpv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditModelPeriodical(<%=mpv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=mpv.getSequence() %></td>
				<td><%=mpv.getCreateTime()%></td>
				<td><%=mpv.getCreator()%></td>
				<td align="left">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateModelPeriodical(<%=mpv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelPeriodical(<%=mpv.getId()%>,<%=count%>);">
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