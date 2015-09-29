<script language="javascript">
  try{
	if(init){init();}
  }catch(e){}
</script>
<ww:if test="isSuccess()">
	<script language="javascript">
		if("<ww:property value="responseMessage"/>" == ""){
			alert("操作成功!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}
		window.returnValue = "SUCCESS";
		window.close();
	</script>
</ww:if>
<ww:if test="isFailure()">
	<script language="javascript">		
		if("<ww:property value="responseMessage"/>" == ""){
			alert("操作失败，请稍候再试!");
		}else{
			alert("<ww:property value="responseMessage"/>");
		}		
	</script>
</ww:if>