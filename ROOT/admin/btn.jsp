<%@ include file="/WEB-INF/inc/common.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<SCRIPT language=javascript> 
	var getScreen=true;i=0;width=0;
	function  shiftwindow()
	{
		if(getScreen==false)
		{
			parent.document.getElementById("showframeset").setAttribute("cols","0,8,*");
			getScreen=true;		
		}
		else if(getScreen==true)
		{
			parent.document.getElementById("showframeset").setAttribute("cols","255,8,*");
			getScreen=false;	
		}
	}	
	
	
</SCRIPT>
</head>
 
<body onLoad="shiftwindow()" id="btnPage">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td onClick=shiftwindow() title=全屏/半屏 bgcolor="#390832"><div align="center"><a href="#"><img src="images/main_41.gif" alt="点击收起侧边栏" name="Image1" border="0"></a></div></td>
  </tr>
</table>
</body>
</html>
 
</body>
</html>
