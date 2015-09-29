<%@ page import="java.util.*"%>
<body>

<div class="time"><span id="aaa" ></span> </div>

<script type="text/javascript">
function showLocale(objD)
{
var str,colorhead,colorfoot;
var yy = objD.getYear();
if(yy<1900) yy = yy+1900;
var MM = objD.getMonth()+1;
if(MM<10) MM = '0' + MM;
var dd = objD.getDate();
if(dd<10) dd = '0' + dd;
var hh = objD.getHours();
if(hh<10) hh = '0' + hh;
var mm = objD.getMinutes();
if(mm<10) mm = '0' + mm;
var ss = objD.getSeconds();
if(ss<10) ss = '0' + ss;

var nm;
if(hh<=12){
	nm="AM";
}else{
	nm="PM";
}
 
 
var ww = objD.getDay();
if  ( ww==0 )  colorhead="<font color=\"#FF0000\">";
if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"#373737\">";
if  ( ww==6 )  colorhead="<font color=\"#008000\">";
if  (ww==0)  ww="Sunday";
if  (ww==1)  ww="Monday";
if  (ww==2)  ww="Tuesday";
if  (ww==3)  ww="Wednesday";
if  (ww==4)  ww="Thursday";
if  (ww==5)  ww="Friday";
if  (ww==6)  ww="Saturday";
colorfoot="</font>"

if  (MM==01)  MM="January";
if  (MM==02)  MM="February";
if  (MM==03)  MM="March";
if  (MM==04)  MM="April";
if  (MM==05)  MM="May";
if  (MM==06)  MM="June";
if  (MM==07)  MM="July";
if  (MM==08)  MM="August";
if  (MM==09)  MM="September";
if  (MM==10)  MM="October";
if  (MM==11)  MM="November";
if  (MM==12)  MM="December";
//str = "Today is &nbsp;" + MM  +"&nbsp;"+ dd+"th,  " + yy+","+hh + ":" + mm+" ,"+ww
str = "Today is &nbsp;" + MM  +"&nbsp;"+ dd+"th,  " + yy+","+hh + ":" + mm+"  "+ww
return(str);
}
function tick()
{
var today;
today = new Date();
document.getElementById("aaa").innerHTML = showLocale(today);
window.setTimeout("tick()", 1000);
}
tick();
</script>
</body>
