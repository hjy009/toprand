<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�鿴��Ʒ��ʷ</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function init(){

	}
	
	function previewImageVideo(type,path){
		if(openDialog("previewImageVideo.do?previewType="+type+"&previewPath="+path,"Ԥ��",400,300) =="SUCCESS") refresh();
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�鿴��Ʒ��ʷ</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <ww:hidden name="'id'"/>
  <input type="hidden" id="content" name="modelProductHistory.content">
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelProductHistory.name" value="<ww:property value='modelProductHistory.name'/>" size="50">&nbsp;<font color="#FF0000">(���ⲻ�ܳ���30������)</font></td>
  </tr>
  <tr>
    <th>СͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileSmallImage" name="fileSmallImage" value="<ww:property value='modelProductHistory.smallImage'/>" size="30">
	<ww:if test="modelProductHistory.smallImage==null">ͼƬ������</ww:if><ww:elseif test="modelProductHistory.smallImage!=null">ͼƬ��<ww:property value='modelProductHistory.smallImage'/><input type="button" value="Ԥ��" onClick="javascript:previewImageVideo(1,'<ww:property value="modelProductHistory.smallImage"/>');" /></ww:elseif>
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <tr>
    <th>��ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileBigImage" name="fileBigImage" value="<ww:property value='modelProductHistory.bigImage'/>" size="30">
	<ww:if test="modelProductHistory.bigImage==null">ͼƬ������</ww:if><ww:elseif test="modelProductHistory.bigImage!=null">ͼƬ��<ww:property value='modelProductHistory.bigImage'/><input type="button" value="Ԥ��" onClick="javascript:previewImageVideo(1,'<ww:property value="modelProductHistory.bigImage"/>');" /></ww:elseif>
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelProductHistory.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>��ʼ�۸�</th>
    <td>&nbsp;<input id="initPrice" name="modelProductHistory.initPrice" value="<ww:if test='modelProductHistory.initPrice==null'>0.00</ww:if><ww:elseif test='modelProductHistory.initPrice!=null'><ww:property value='modelProductHistory.initPrice'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">Ԫ</font></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���ڼ۸�</th>
    <td>&nbsp;<input id="nowPrice" name="modelProductHistoryHistory.nowPrice" value="<ww:if test='modelProductHistory.nowPrice==null'>0.00</ww:if><ww:elseif test='modelProductHistory.nowPrice!=null'><ww:property value='modelProductHistory.nowPrice'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">Ԫ</font></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>�ۿۣ�</th>
    <td>&nbsp;<input id="discount" name="modelProductHistory.discount" value="<ww:if test='modelProductHistory.discount==null'>0</ww:if><ww:elseif test='modelProductHistory.discount!=null'><ww:property value='modelProductHistory.discount'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">%</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font></td>
  </tr>
  <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelProductHistory.sequence" value="<ww:if test='modelProductHistory.sequence==null'>1</ww:if><ww:elseif test='modelProductHistory.sequence!=null'><ww:property value='modelProductHistory.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
  <tr>
    <th>��ע��</th>
    <td>&nbsp;<textarea id="remark" name="modelProductHistory.remark" cols="50" rows="6"><ww:property value="modelProductHistory.remark"/></textarea>
	</td>
  </tr>
</form>
</table>
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
