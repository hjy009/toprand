<%@ page contentType="text/html;charset=gbk"%>
<%@ page session="false"%>
<%@ taglib prefix="ww" uri="webwork" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<script type="text/javascript" src="js/swfobject.js"></script>
	<title>Minimal Flowplayer setup</title>
</head>

<body><%--
            <center><p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
            <input type="button" value="关闭" onclick="parent.window.close();" />
            </center>
			--%><ww:hidden name="'path'" id="path"></ww:hidden>
			<ww:hidden name="'imagePath'" id="imagePath"></ww:hidden>
			<ww:property value='path'/>
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="600" height="200">
      <param name="movie" value="/<ww:property value='path'/>" />
      <param name="quality" value="high" />
      <param name="wmode" value="transparent" />
      <embed src="/<ww:property value='path'/>" width="600" height="200" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent" ></embed>
    </object>
			
			<%--
            <script type="text/javascript">
                var s1 = new SWFObject("js/flvplayer.swf","single","510","320","7");
                var path = "/"+document.getElementById("path").value;
                var imagePath = document.getElementById("imagePath").value;
                var image = "";
                if(imagePath!=null&&imagePath!=""){
                	image = "/"+document.getElementById("imagePath").value;
                }else{
                	image = "/admin/uploadImage/Flvplayer/flvplayer.jpg";
                }
                s1.addParam("allowfullscreen","true");
                s1.addVariable("autostart","false");	//打开时自动播放
                s1.addVariable("file",path);
                s1.addVariable("image",image);	//封面图片的调用
                s1.addVariable("width","510");
                s1.addVariable("height","320");
                s1.write("player1");
            </script>
--%></body>

</html>