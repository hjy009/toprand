<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelAdvertiseEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.entity.ModelAdvertise"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List typeList = (List)request.getAttribute("typeList");
	List statusList = (List)request.getAttribute("statusList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�й���Ϣ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelRecruitPageEn.do";
		form.submit();
	}
	function queryModelRecruit(id){
		if(openDialog("queryModelRecruitEn.do?id="+id,"�鿴�й���Ϣ",550,300) =="SUCCESS") refresh();
	}
	function prepareAddModelRecruit(){
	<auth:if test="/admin/prepareAddModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelRecruitEn.do","�����й���Ϣ",850,300) =="SUCCESS") refresh();
	}
	function prepareUpdateModelRecruit(id){
	<auth:if test="/admin/prepareUpdateModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelRecruitEn.do?id="+id,"�޸��й���Ϣ",850,300) =="SUCCESS") refresh();
	}
	function auditModelRecruit(id,pageId){
	<auth:if test="/admin/auditModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelRecruitEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelRecruit(id,pageId){
	<auth:if test="/admin/reAuditModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelRecruitEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function deleteModelRecruit(id,pageId){
	<auth:if test="/admin/deleteModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�ɾ���˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'deleteModelRecruitEn.do';
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
	  
	   function  shenhe(){
	   <auth:if test="/admin/updateAllModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ���й���Ϣ�������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateAllModelRecruitEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function  reShenhe(){
	   <auth:if test="/admin/reUpdateAllModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ���й���Ϣ���������");
				return;
			}
			
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'reUpdateAllModelRecruitEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelRecruitEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ���й���Ϣ����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelRecruitEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	function init(){
		doSelect('status',"<ww:property value='status'/>");
		doSelect('type',"<ww:property value='type'/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelRecruitPageEn.do";
		form.submit();
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�й���Ϣ����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			ְλ��<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(statusList!=null&&statusList.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = statusList.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="add" value="�����й���Ϣ..." class="mainoption" onClick="javascript:prepareAddModelRecruit();">
			&nbsp;&nbsp; <input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp; <input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
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
  	<th>ְλ</th>
  	<th>��˾����</th>
  	<th>�����ص�</th>
	<th>��ϵ��</th>
	<th>״̬</th>
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
	  		ModelAdvertiseEnView uv = (ModelAdvertiseEnView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=uv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(uv.getName() )?"---":uv.getName() %></td>
				<td><%=StringHelper.isEmpty(uv.getCompany() )?"---":uv.getCompany() %></td>
				<td><%=StringHelper.isEmpty(uv.getWorkingPlace() )?"---":uv.getWorkingPlace() %></td>
               	<td><%=StringHelper.isEmpty(uv.getLinkman() )?"---":uv.getLinkman() %></td>
               	<%-- <td><%=DictionaryCache.getValueByCode(Dictionary.ADVERTISE_INFO_TYPE,uv.getType()+"")%></td> --%>
				<td><%if(uv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,uv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditModelRecruit(<%=uv.getId()%>,<%=count %>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,uv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditModelRecruit(<%=uv.getId()%>,<%=count %>);"></font><%}%>&nbsp;</td>
				<td><%=uv.getCreateTime()%></td>
				<td><%=StringHelper.isEmpty(uv.getCreator() )?"---":uv.getCreator() %></td>
				<td align="left">
				<input type="button" value="�鿴�й���Ϣ..." onClick="javascript:queryModelRecruit(<%=uv.getId()%>);">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateModelRecruit(<%=uv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelRecruit(<%=uv.getId()%>,<%=count %>);">
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