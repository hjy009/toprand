<script>
function AddFavorite(sURL, sTitle){
	try{
		window.external.addFavorite(sURL, sTitle);
	}
	catch (e){
		try{
			window.sidebar.addPanel(sTitle, sURL, "");
		}
		catch (e){
			alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
		}
	}
}
</script>

<div class="foot">
  		<div class="footnav"><a href="queryAid.do">��������</a> | <a href="queryAid.do?id=9">��Ȩ����</a> | <a href="queryAid.do?id=13">������վ</a> | <a href="queryAid.do?id=10">վ���ͼ</a> | <a href="/admin">�������</a></div>
        <span>Copyright 2014-2016 �»������Ű�Ȩ����  Powered by:<a href="http://www.toprand.com " target="_blank">www.toprand.com</a> </span> 
  
  </div>
