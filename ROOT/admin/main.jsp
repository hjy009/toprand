<%@ include file="/WEB-INF/inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="xiaohe" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />


</head>

<!--<frameset rows="100,*,22" frameborder="no" border="0" framespacing="0">
  <frame src="Title.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="180,10,*" frameborder="no" border="0" framespacing="0"  id="showframeset">
    <frame src="left1.asp?parentNo=00" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="btn.html" name="CloseleftFrame" scrolling="No" noresize="noresize" id="CloseleftFrame" title="CloseleftFrame" />
    <frame src="Main.asp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
  <frame src="buttom.html" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>-->


<frameset rows="99,*,39" frameborder="no" border="0" framespacing="0">
 <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frameset cols="255,8,*" frameborder="no" border="0" framespacing="0"  id="showframeset">
    <frame src="/admin/menuList.do" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="btn.jsp" name="CloseleftFrame" scrolling="No" noresize="noresize" id="CloseleftFrame" title="CloseleftFrame" />
    <frame src="/admin/menuIntorList.do" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>

<!--<frame src="center.html" name="centerFrame" id="centerFrame" />-->
  <frame src="foot.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>




<noframes><body>
</body>
</noframes>
</html>
