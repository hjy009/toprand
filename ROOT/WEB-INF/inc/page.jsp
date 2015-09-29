
<%if(pages != null && !pages.isEmpty()){%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>&nbsp;&nbsp;¹²<%=pages.getTotalCount()%>Ìõ/<%=pages.getPageCount()%>Ò³    </td>
    <td align="right">
    	<%
    		PaginationCounter counter = new PaginationCounter(pages.getPageCount(),pages.getPageNumber(),9);
    		if(counter.hasPrevious()){ out.println("<a class='page' href='javascript:go2Page(1);'>1</a> ..."); }
    		for(int i = counter.getStart(); i<=counter.getEnd();i++){
    			if(i == pages.getPageNumber()){
    				out.println("<span class='currentPage'>"+i+"</span>");
    			}else{
    				out.println("<a class='page' href='javascript:go2Page("+i+");'>"+i+"</a>");
    			}
    		}
    		if(counter.hasNext()){ out.println("... <a class='page' href='javascript:go2Page("+pages.getPageCount()+");'>"+pages.getPageCount()+"</a>"); }
    	%>
    &nbsp;Ìøµ½£º<input type="text" size="<%=String.valueOf(pages.getPageCount()).length()%>" maxlength="<%=String.valueOf(pages.getPageCount()).length()%>" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" onKeyDown="if(event.keyCode == 13){ go2Page(this.value); }" value="<%=pages.getPageNumber()%>">Ò³
    </td>
  </tr>
</table>
<%}%>
