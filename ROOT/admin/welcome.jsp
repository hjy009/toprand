<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@page import="com.newhc.admin.online.*"%>
<%@page import="cn.com.netmovie.helper.*"%>
<%@page import="java.util.*"%>
<%
	OnlineManager manager = new OnlineManager(request,response);
	String userName = "";
	String name = "";
	Integer userId = new Integer(0);
	Integer type = new Integer(0);
	Date signInTime = new Date();
	OnlineUser onlineUser = manager.getOnlineUser();
	if(onlineUser!=null){
		userName = onlineUser.getUsername();
		name = onlineUser.getName();
		userId = onlineUser.getId();
		type = onlineUser.getType();
		signInTime = onlineUser.getSignInTime();
	}
%>
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

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

<td background="images/bg_mtop.jpg" height="45" style=" padding:0 18px;">
   <span class="lan"><%=name%></span> Hello, Welcome to the website backend system!     Identity: <%if(type.intValue()==0){%>普通管理员<%}else{%>超级管理员<%}%>     times this login time :<%=DateHelper.toString(signInTime,"yyyy-MM-dd HH:mm:ss")%>
</td>
<tr>
<td height="22">&nbsp;</td>
</tr>

<tr>
<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #f6c003; background:#fff9b6; padding:15px; line-height:21px;">
      	<h2><img src="images/dan1.jpg" width="14" height="14" /> Notice：</h2>
        <div class="notext">Web site has been upgraded, please click the "Help" to operate!</div>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table>

</td>
</tr>

<tr>
<td height="24">&nbsp;</td>
</tr>

<tr>
<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #e7a5a5; background:#ffebeb; padding:15px; line-height:21px;" width="48%" valign="top">
      	<h2><img src="images/dan2.jpg" width="14" height="14" /> Pending Information:</h2>
        <ul class="list1">
<li><a href="#">MARS EDI Application Wins Government Award</a>   2011-11-22</li>
<li><a href="#">First Air-conditioning Compressor in Wuhu Rolls off the Line</a>   2011-09-28</li>
<li><a href="#">Midea Launches New Generation of Intelligent IH Rice Cooker</a>   2011-09-24 
<li><a href="#">Dishwasher Division Awarded in Annual EEP Projects</a>   2011-09-22 </li>
<li><a href="#">Enterprise Top 500 in China Released: Midea Ranked 70th</a>   2011-09-14</li> 
        
        </ul>
      </td>
      <td >&nbsp;</td>
      <td style="border:1px solid #9cc384; background:#f3feea; padding:15px; line-height:21px;" width="47.5%" valign="top">
      	<h2><img src="images/dan3.jpg" width="14" height="14" /> New Message：</h2>
        <ul class="list1">
<li><a href="#">MARS EDI Application Wins Government Award</a>   2011-11-22</li>
<li><a href="#">First Air-conditioning Compressor in Wuhu Rolls off the Line</a>   2011-09-28</li>
<li><a href="#">Midea Launches New Generation of Intelligent IH Rice Cooker</a>   2011-09-24 
<li><a href="#">Dishwasher Division Awarded in Annual EEP Projects</a>   2011-09-22 </li>
<li><a href="#">Enterprise Top 500 in China Released: Midea Ranked 70th</a>   2011-09-14</li> 
        
        </ul>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table>

</td>
</tr>

<tr>
<td height="26">&nbsp;</td>
</tr>


<tr>
<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #b8cadb; background:#f8f8fa; padding:15px; line-height:21px;">
      	<h2 style=" margin-bottom:15px;"><img src="images/can1.jpg" /> Can I use the function：</h2>
       	<ul class="list2">
        	<li>
        	  <div class="l"><img src="images/fun1.jpg" width="67" height="62" /></div><div class="r"><a href="#">Basic Settings</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun2.jpg" width="67" height="62" /></div><div class="r"><a href="#">Add product</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun3.jpg" width="67" height="62" /></div><div class="r"><a href="#">Add News</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun4.jpg" width="67" height="62" /></div><div class="r"><a href="#">Edit content</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun5.jpg" width="67" height="62" /></div><div class="r"><a href="#">Recruitment</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun6.jpg" width="67" height="62" /></div><div class="r"><a href="#">Download</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun7.jpg" width="67" height="62" /></div><div class="r"><a href="#">Message</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun8.jpg" width="67" height="62" /></div><div class="r"><a href="#">Journal</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun9.jpg" width="67" height="62" /></div><div class="r"><a href="#">Survey</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun10.jpg" width="67" height="62" /></div><div class="r"><a href="#">Advertising</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun11.jpg" width="67" height="62" /></div><div class="r"><a href="#">Links</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun12.jpg" width="67" height="62" /></div><div class="r"><a href="#">Permissions</a></div>
            </li>
            
        
        </ul>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table>

</td>
</tr>





<tr>

</table>
	 
	
</body>
</html>
