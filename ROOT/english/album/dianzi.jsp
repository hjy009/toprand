<%@ page import="java.util.*"%>
<%
	String img1 = (String)request.getAttribute("img1");
	String img2 = (String)request.getAttribute("img2");
	String str1 = (String)request.getAttribute("str1");
	String str2 = (String)request.getAttribute("str2");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>Book appreciation</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<META content=IE=EmulateIE7 http-equiv=X-UA-Compatible><LINK rel=stylesheet type=text/css href="css/mian.css"><LINK rel=stylesheet type=text/css href="css/white.css">
<SCRIPT type=text/javascript src="/english/album/js/swfobject.js"></SCRIPT>

<SCRIPT type=text/javascript src="/english/album/js/flippingbook.js"></SCRIPT>

<SCRIPT type=text/javascript src="/english/album/js/jquery-1.4.2.min.js"></SCRIPT>

<SCRIPT type=text/javascript src="/english/album/js/scripts.js"></SCRIPT>

<SCRIPT type=text/javascript src="/english/album/js/light-box.js"></SCRIPT>

<SCRIPT id=__onDOMContentLoaded defer src="//:"></SCRIPT>

<SCRIPT>
    function OnWindowsReSize()
    { 
        document.getElementById('mainbody').style.height = document.body.clientHeight;
    }
</SCRIPT>

<STYLE type=text/css media=screen>#fbContainer_911414844 {
	VISIBILITY: hidden
}
html{overflow:hidden}
</STYLE>
</HEAD>
<BODY style="WIDTH: 100%; HEIGHT: 100%; overflow:hidden" onload=OnWindowsReSize() onresize=OnWindowsReSize()>
<OBJECT style="VISIBILITY: visible" id=fbContainer_911414844 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width="100%" height="100%"><PARAM NAME="_cx" VALUE="37650"><PARAM NAME="_cy" VALUE="18150"><PARAM NAME="FlashVars" VALUE="allowPagesUnload=false&amp;alwaysOpened=false&amp;autoFlipSize=50&amp;backgroundColor=333A42&amp;backgroundImage=/english/album/images/bg.jpg&amp;backgroundImagePlacement=fit&amp;bookHeight=559&amp;bookWidth=824&amp;centerBook=true&amp;centerContent=true&amp;closeSpeed=3&amp;darkPages=false&amp;downloadComplete=Complete&amp;downloadSize=0 Kb&amp;downloadTitle=Download Book&amp;downloadURL=&amp;dropShadowEnabled=true&amp;dropShadowHideWhenFlipping=true&amp;dynamicShadowsDarkColor=0&amp;dynamicShadowsDepth=1&amp;dynamicShadowsLightColor=16777215&amp;enlargedImagesSet=<%=img2 %>&amp;extXML=&amp;firstLastButtons=true&amp;firstPageNumber=1&amp;flipCornerAmount=70&amp;flipCornerAngle=45&amp;flipCornerPlaySound=false&amp;flipCornerPosition=top-right&amp;flipCornerRelease=true&amp;flipCornerStyle=first page only&amp;flipCornerVibrate=true&amp;flipOnClick=true&amp;flipSound=mp3/newspaper.mp3&amp;frameAlpha=100&amp;frameColor=16777215&amp;frameWidth=0&amp;freezeOnFlip=false&amp;fullscreenEnabled=false&amp;fullscreenHint=&amp;goToPageField=true&amp;gotoSpeed=3&amp;handOverCorner=true&amp;handOverPage=true&amp;hardcover=false&amp;hardcoverEdgeColor=16777215&amp;hardcoverSound=mp3/photo_album.mp3&amp;hardcoverThickness=3&amp;highlightHardcover=true&amp;loadOnDemand=true&amp;moveSpeed=2&amp;navigationBarPlacement=bottom&amp;navigationFlipOffset=30&amp;pageBackgroundColor=16777215&amp;pageLinksSet=<%=str2 %>&amp;pagesSet=<%=img2 %>&amp;playOnDemand=true&amp;preloaderType=Progress Bar&amp;preserveProportions=false&amp;printEnabled=true&amp;printTitle=Print pages&amp;rigidPages=false&amp;rigidPageSpeed=5&amp;scaleContent=true&amp;showUnderlyingPages=false&amp;slideshowAutoPlay=false&amp;slideshowButton=true&amp;slideshowDisplayDuration=3000&amp;smoothPages=true&amp;staticShadowsDarkColor=0&amp;staticShadowsDepth=1&amp;staticShadowsLightColor=16777215&amp;staticShadowsType=Asymmetric&amp;useCustomCursors=false&amp;zoomEnabled=true&amp;zoomHint=Double click to zoom in&amp;zoomHintEnabled=true&amp;zoomImageHeight=1347&amp;zoomImageWidth=992&amp;zoomingMethod=flash&amp;zoomOnClick=true&amp;zoomUIColor=9412262&amp;uniqueSuffix=911414844&amp;direction=LTR&amp;navigationBar=/english/album/swf/navigation-transparent.swf&amp;soundControlButton=true&amp;Ioader=true"><PARAM NAME="Movie" VALUE="/english/album/swf/flippingbook.swf"><PARAM NAME="Src" VALUE="/english/album/swf/flippingbook.swf"><PARAM NAME="WMode" VALUE="Opaque"><PARAM NAME="Play" VALUE="0"><PARAM NAME="Loop" VALUE="-1"><PARAM NAME="Quality" VALUE="High"><PARAM NAME="SAlign" VALUE="LT"><PARAM NAME="Menu" VALUE="-1"><PARAM NAME="Base" VALUE=""><PARAM NAME="AllowScriptAccess" VALUE="always"><PARAM NAME="Scale" VALUE="NoScale"><PARAM NAME="DeviceFont" VALUE="0"><PARAM NAME="EmbedMovie" VALUE="0"><PARAM NAME="BGColor" VALUE="333A42"><PARAM NAME="SWRemote" VALUE=""><PARAM NAME="MovieData" VALUE=""><PARAM NAME="SeamlessTabbing" VALUE="1"><PARAM NAME="Profile" VALUE="0"><PARAM NAME="ProfileAddress" VALUE=""><PARAM NAME="ProfilePort" VALUE="0"><PARAM NAME="AllowNetworking" VALUE="all"><PARAM NAME="AllowFullScreen" VALUE="true"></OBJECT>
<SCRIPT language=JavaScript type=text/javascript>
flippingBook911414844 = new FlippingBook();
flippingBook911414844.pages = [
<%=img1 %>
];

flippingBook911414844.enlargedImages = [
<%=img1 %>
];

flippingBook911414844.pageLinks = [
<%=str1 %>
];
flippingBook911414844.settings.uniqueSuffix = "911414844";
flippingBook911414844.stageWidth = "100%";
flippingBook911414844.stageHeight = "100%";
flippingBook911414844.settings.direction = "LTR";
flippingBook911414844.settings.bookWidth = "800";
flippingBook911414844.settings.bookHeight = "552";
flippingBook911414844.settings.firstPageNumber = "1";
flippingBook911414844.settings.navigationBar = "/english/album/swf/navigation-transparent.swf";
flippingBook911414844.settings.navigationBarPlacement = "bottom";
flippingBook911414844.settings.pageBackgroundColor = 0xFFFFFF;
flippingBook911414844.settings.backgroundColor = "333A42";
flippingBook911414844.settings.backgroundImage = "/english/album/images/bg.jpg";
flippingBook911414844.settings.backgroundImagePlacement = "fit";
flippingBook911414844.settings.staticShadowsType = "Asymmetric";
flippingBook911414844.settings.staticShadowsDepth = "1";
flippingBook911414844.settings.autoFlipSize = "50";
flippingBook911414844.settings.centerBook = true;
flippingBook911414844.settings.scaleContent = true;
flippingBook911414844.settings.alwaysOpened = false;
flippingBook911414844.settings.flipCornerStyle = "first page only";
flippingBook911414844.settings.hardcover = false;
flippingBook911414844.settings.downloadURL = "";
flippingBook911414844.settings.downloadTitle = "Download Book";
flippingBook911414844.settings.downloadSize = "0 Kb";
flippingBook911414844.settings.allowPagesUnload = false;
flippingBook911414844.settings.fullscreenEnabled = false;
flippingBook911414844.settings.zoomEnabled = true;
flippingBook911414844.settings.zoomImageWidth = "882";
flippingBook911414844.settings.zoomImageHeight = "1218";
flippingBook911414844.settings.zoomUIColor = 0x8f9ea6;


flippingBook911414844.settings.slideshowButton = true;
flippingBook911414844.settings.slideshowAutoPlay = false;
flippingBook911414844.settings.slideshowDisplayDuration = "3000";
flippingBook911414844.settings.goToPageField = true;
flippingBook911414844.settings.firstLastButtons = true;
flippingBook911414844.settings.printEnabled = true;
flippingBook911414844.settings.zoomingMethod = "flash";
flippingBook911414844.settings.soundControlButton = false;
flippingBook911414844.settings.showUnderlyingPages = false;
flippingBook911414844.settings.fullscreenHint = "";
flippingBook911414844.settings.zoomHintEnabled = "true";
flippingBook911414844.settings.zoomOnClick = true;
flippingBook911414844.settings.moveSpeed = "2";
flippingBook911414844.settings.closeSpeed = "3";
flippingBook911414844.settings.gotoSpeed = "3";
flippingBook911414844.settings.rigidPageSpeed = "5";
flippingBook911414844.settings.zoomHint = " Please double click\r browse Large";
flippingBook911414844.settings.printTitle = "Print pages";
flippingBook911414844.settings.downloadComplete = "Complete";
flippingBook911414844.settings.dropShadowEnabled = true;
flippingBook911414844.settings.flipSound = "mp3/newspaper.mp3";
flippingBook911414844.settings.hardcoverSound = "mp3/photo_album.mp3";
flippingBook911414844.settings.preloaderType = "Progress Bar";
flippingBook911414844.settings.Ioader = true;
flippingBook911414844.settings.frameColor = 0xFFFFFF;
flippingBook911414844.settings.frameWidth = "0";
flippingBook911414844.containerId = "fbContainer_911414844";
flippingBook911414844.create("/english/album/swf/flippingbook.swf");
jQuery.noConflict();
</SCRIPT>
</BODY>
</html>