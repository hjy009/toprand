<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.entity.ModelProduct"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelProductStatus = (List)request.getAttribute("modelProductHistoryStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��Ʒ��ʷ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelProductHistoryPage.do";
		form.submit();
	}
	function queryModelProductHistory(id){
		if(openDialog("queryModelProductHistory.do?id="+id,"�鿴��Ʒ��ʷ",850,300) =="SUCCESS") refresh();
	}

	
	function deleteModelProductHistory(id,pageId){
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelProductHistory.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelProductHistoryPage.do";
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
	   function  deleteAll(){
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ʒ��ʷ����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelProductHistory.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	  function recoveryModelProductHistory(productId,id,pageId){
		if(confirm('�Ƿ�ָ���ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="recoveryModelProductHistory.do?productId="+productId+"&id="+id;
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
<table width="96%" align="center" border="0"><tr><td><div class="title">��Ʒ��ʷ����-<font color="#FF0000"><ww:property value="categoryName"/></font></div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'productId'"/>
	  <ww:hidden name="'categoryName'"/>
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���⣺<input id="name" name="name" size="30" value="<ww:property value='name'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(modelProductStatus!=null&&modelProductStatus.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = modelProductStatus.iterator();it.hasNext();){
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
  <th><input type="checkbox"      onclick="javascript:SelectAll();"></th>
  	<th>���</th>
  	<th>����</th>
	<th>״̬</th>
	<th>����</th>
	<th>����ʱ��</th>
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
	  		ModelProduct sgv = (ModelProduct)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=sgv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(sgv.getName())?"---":sgv.getName()%></td>
				<td><%if(sgv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				</font><%}%>&nbsp;</td>
				<td><%=sgv.getSequence()%></td>
				<td><%=sgv.getPubTimeString()%></td>
				<td><%=sgv.getCreateTimeString()%></td>
				<td><%=sgv.getCreator()%></td>
				<td align="left">
				<input type="button" value="�鿴..." onClick="javascript:queryModelProductHistory(<%=sgv.getId()%>);">
				<input type="button" value="�ָ�..." onClick="javascript:recoveryModelProductHistory(<ww:property value='productId' />,<%=sgv.getId()%>,<%=count%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelProductHistory(<%=sgv.getId()%>,<%=count%>);">
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
		  <input type="button" value="�رմ���"  onclick="window.close();">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>