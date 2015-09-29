// JavaScript Document


//<!CDATA[
function g(o){return document.getElementById(o);}
function HoverLi(n){
//如果有N个标签,就将i<=N;
//本功能非常OK,兼容IE7,FF,IE6;
	for(var i=1;i<=6;i++)
	{
		g('tb_'+i).className='normaltab';
		g('tbc_0'+i).className='undis';
		g('navImg_'+i).src='images/nav'+i+'.jpg';
	}
	g('tbc_0'+n).className='dis';
	g('tb_'+n).className='hovertab';
	g('navImg_'+n).src='images/navh'+n+'.jpg';
}
//如果要做成点击后再转到请将<li>中的onmouseover 改成 onclick;
//]]>

function HoverLiOut(n){
//如果有N个标签,就将i<=N;
//本功能非常OK,兼容IE7,FF,IE6;
	for(var i=1;i<=6;i++)
	{
		
		
		g('navImg_'+i).src='images/nav'+i+'.jpg';
	}

	g('navImg_'+n).src='images/navh'+n+'.jpg';
}



  function setTab(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);
    var con=document.getElementById("con_"+name+"_"+i);
    menu.className=i==cursel?"hover":"";
    con.style.display=i==cursel?"block":"none";
   }
  }

  function setTabContactUs(name,cursel,n){
	   for(i=1;i<=n;i++){
	    var menu=document.getElementById(name+i);
	    var con=document.getElementById("con_"+name+"_"+i);
	    menu.className=i==cursel?"hover":"";
	    con.className=(i==cursel?"":"hidden");
	   }
	  }
  
    function setTabout(name,cursel){

  var menu=document.getElementById(name+cursel);
    menu.className="";
    var con=document.getElementById("con_"+name+"_"+cursel);

    con.style.display="none"; 
  }
  
   function setser(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);
    var con=document.getElementById("con_"+name+"_"+i);
    menu.className=i==cursel?"searchlist2":"searchlist";
    con.style.display=i==cursel?"block":"none";
   }
  }
  
   function setout(name,cursel){
	var menu=document.getElementById(name+cursel);
    var con=document.getElementById("con_"+name+"_"+cursel);
	  menu.className="searchlist";
    con.style.display="none"; 
  }
  
   function setbal(name,cursel,n){
   for(i=1;i<=n;i++){

    var con=document.getElementById("con_"+name+"_"+i);
    con.style.display=i==cursel?"block":"none";
   }
  }
   function setbalout(name,cursel){

    var con=document.getElementById("con_"+name+"_"+cursel);

    con.style.display="none"; 
  }
  
  
  function setms(name,n){
 

    var con=document.getElementById("con_"+name+"_"+n);
    con.style.display="block";

  }
  
  function setmsout(name,n){
 

    var con=document.getElementById("con_"+name+"_"+n);
    con.style.display="none";

  }
  
    function leftTab(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);

    menu.className=i==cursel?"hover":"";

   }
  }
  
   function close2(name){
   var clo=document.getElementById("msbox");
   clo.style.display="none";
  }
  
   function showms(name){
   var clo=document.getElementById("msbox");
   clo.style.display="block";
  }
 
  function setTabprpr(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);
    var con=document.getElementById("con_"+name+"_"+i);
    menu.className=i==cursel?"prorboxtitle2":"prorboxtitle";
    con.style.display=i==cursel?"block":"none";
   }
  }
 
 
 function showDiv(n){
document.getElementById('pop'+n).style.display='block';
document.getElementById('bg').style.display='block';
}
 
 function showDiv2(n,url,dspt,imgId){
	 $("#"+imgId).attr("src",url);
	 $("#imgDesc").text(dspt);
	 document.getElementById('pop'+n).style.display='block';
	 document.getElementById('bg').style.display='block';
}


function closeDiv(n){
document.getElementById('pop'+n).style.display='none';
document.getElementById('bg').style.display='none';
}

  function hisTab(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);
    var con=document.getElementById("con_"+name+"_"+i);
    menu.className=i==cursel?"hover":"";
    con.style.display=i==cursel?"block":"none";
	 var con2=document.getElementById("hs_"+name+"_"+i);
	 con2.style.display=i==cursel?"block":"none";
   }
  }
  
  
   function setlist(name){
	  var num=document.getElementById(name);
	 
num.style.display = num.style.display == 'block' ? 'none' : 'block';
 }


function setsu(name,cursel,n){
   for(i=1;i<=n;i++){
    var menu=document.getElementById(name+i);
   
    menu.className=i==cursel?"hover":"";

	
   }
   var con=document.getElementById("con_"+name+"_"+cursel);
   con.style.display = con.style.display == 'block' ? 'none' : 'block';
  }

 function setTab22(name,n){
	  var num=document.getElementById(name);
	   var num2=document.getElementById(n);
		num.style.display = num.style.display == 'block' ? 'none' : 'block';
		num2.className = num2.className== 'hover' ? '' : '';
 } 