<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.AidPartView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List status = (List)request.getAttribute("status");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������Ŀ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "aidPartPage.do";
		form.submit(); 
	}
	function prepareUpdateAidPart(id){
	<auth:if test="/admin/prepareUpdateAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateAidPart.do?id="+id,"�޸ĸ�����Ŀ",850,300) =="SUCCESS") refresh();
	}
	
	function prepareAddAidPart(){
	<auth:if test="/admin/prepareAddAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddAidPart.do","����������Ŀ",850,300)=="SUCCESS") refresh();
	}
	
	function deleteAidPart(id,pageId){
	<auth:if test="/admin/deleteAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteAidPart.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditAidPart(id,pageId){
	<auth:if test="/admin/auditAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditAidPart.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditAidPart(id,pageId){
	<auth:if test="/admin/reAuditAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditAidPart.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		doSelect('sequence',"<ww:property value="sequence"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "aidPartPage.do";
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
	   <auth:if test="/admin/updateAllAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ��������Ŀ�������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateAllAidPart.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function  reshenhe(){
	   <auth:if test="/admin/updateReAllAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ��������Ŀ���������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateReAllAidPart.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   
	   
	   function  deleteAll(){
	    <auth:if test="/admin/deleteAllAidPart.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ��������Ŀ����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllAidPart.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function queryWeb(path,id){
	   	if(openDialog("/chinese/secondary/aidPartWebPage.do?id="+id,"Ԥ��ǰ̨",1250,700)==sucess)refresh();
	   }
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������Ŀ����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���⣺<input id="title" name="name" size="15" value="<ww:property value='title'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(status!=null&&status.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = status.iterator();it.hasNext();){
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
			&nbsp;&nbsp;<input type="button" name="addmp" value="����������Ŀ..." class="mainoption" onClick="javascript:prepareAddAidPart();">
			&nbsp;&nbsp; <input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp; <input type="button" value="���������" class="tjan" onClick="javascript:reshenhe();"/>
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
  	<th>����</th>
	<th>˳��</th>
	<th>״̬</th>
	<th>����ʱ��</th>
	<th>������</th>
	<th>����</th>
  </tr>
  <!-- ================ ��ʾ�������� ================
 
   -->
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
	  		AidPartView apv = (AidPartView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=apv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(apv.getName())?"---":apv.getName()%></td>
				<td><%=apv.getContent() %></td>
				<td><%=apv.getSequence()%></td>
				<td><%if(apv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,apv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditAidPart(<%=apv.getId()%>,<%=count %>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,apv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditAidPart(<%=apv.getId()%>,<%=count %>);"></font><%}%>&nbsp;</td>
				<td><%=apv.getCreateTime()%></td>
				<td><%=apv.getCreator()%></td>
				<td align="left">

				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateAidPart(<%=apv.getId()%>);">
				<input id="answerButton" type="button" value="ɾ��..." onClick="javascript:deleteAidPart(<%=apv.getId()%>,<%=count %>);">
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