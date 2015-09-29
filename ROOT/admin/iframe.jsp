<%@ page contentType="text/html; charset=gbk" language="java" %>
<script language='Javascript'>
function w(message){ document.write(message);}
//
var args = window.dialogArguments;
var dialogURL = args[0];
var dialogTitle = args[1];
w("<HEAD><TITLE>"+dialogTitle+"</TITLE></HEAD>");
w("<frameset name='parent' rows='0,*' frameborder='NO' border='0'  cols='*'>");
w(" <frame noresize name='top' src='about:blank' border='0' scrolling='No'>");
w(" <frame noresize name='down' src=\""+dialogURL+"\">");
w("</frameset>");
</script>

 
 
 
 

