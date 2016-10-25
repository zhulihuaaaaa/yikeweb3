$(document).ready(function (){
//跳转功能
	$("#returnB").click(function(){
		location.href="BDZ2.jsp";
	});
	$("#returnMachine").click(function(){
		location.href="/Ied/jumptomachineIed";
	});
	$("#returnBDZ").click(function(){
		location.href="/Ied/jumptoanalysis";
	});
	 
    $(".singlemachine").click(function(){
   	 var id = $(this).attr('id');
   	 location.href="/Ied/jumptosinglemachine?id="+id;
   
	});
    $(".insidemachine").click(function(){
    	 var id = $(this).attr('id');
    	 location.href="/Ied/jumptoinsidemachine?id="+id;
   	});

 //折线图end
	//搜索功能
	
	$("#searchbutton").click(function(){
		var val = $("#textsearch").val();
		 if(val.indexOf("#")!=-1){
			 	val = val.replace("#","");
			 	//alert(val);
				location.href="/yikeWeb/AlarmServlet?method=findByMachine&name="+val;
			  }else{
				//alert(111);
				location.href="/yikeWeb/AlarmServlet?method=findByMachine&name="+val;
			  }
	});

			


		    
		    
});

