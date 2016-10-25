$(document).ready(function (){
	var svgObj = document.getElementById("svgDetail");
	svgObj.src="svg/svg.svg";
	$(window).load(function() {
	/*	var svgDoc = svgObj.getSVGDocument();
	    //alert(svgDoc);
	    var svgRoot = svgDoc.documentElement;
	    var text_List = svgRoot.getElementsByTagName("text");*/
		SVGAutoSize();
		Refreshdataana();
	    Refreshdatadgt();
	    setInterval(Refreshdataana, 100000);
	    setInterval(Refreshdatadgt, 100000);
	     
	    
	});
	
	
	 $(window).resize(function () {
         SVGAutoSize();
     });
	
	//svg变化大小
	function SVGAutoSize() {
        var svgObj = document.getElementById("svgDetail");
        var svgDoc = svgObj.getSVGDocument();
        var svgRoot = svgDoc.documentElement;
        var heightVal = svgRoot.getAttribute("height");//SVG的高度
        var widthVal = svgRoot.getAttribute("width");//SVG的宽度
        //alert(heightVal);
        //alert(widthVal);
        var containerWidth = $(".container-machine").width();//容器宽度
        //alert(containerWidth);
        svgObj.setAttribute("width", containerWidth);
        svgObj.setAttribute("height", containerWidth * (heightVal / widthVal));
    }
	
	  //刷新ana
    function Refreshdataana() {

       // var StationID = $("#StationID").val();
        $.ajax({
        	url:"/yikeWeb/anaServlet",
            type: 'post',
            datatype: 'json',
            data:{method:"InitAlarm",para:15},
            success: function (data) {
                var svgObj = document.getElementById("svgDetail");
                var svgDoc = svgObj.getSVGDocument();
                var svgRoot = svgDoc.documentElement;
                //alert(svgRoot);
                //(data);
                var jsonData = $.parseJSON(data);
                $.each(jsonData, function (i, v) {
                	
                	 var texts = svgDoc.getElementsByTagName("text");
                	    for(var i=0;i<texts.length;i++){
                	        if(texts[i].getAttribute("database_id") != null){
                	        if(texts[i].attributes["database_id"].nodeValue == v.id){
                	        	texts[i].firstChild.nodeValue = v.value;
                	        }
                	        }
                	    }
                });
               }
            })
        }

  //刷新dgt
    function Refreshdatadgt() {

       // var StationID = $("#StationID").val();
        $.ajax({
        	url:"/yikeWeb/dgtServlet",
            type: 'post',
            datatype: 'json',
            data:{method:"InitAlarm",para:15},
            success: function (data) {
                var svgObj = document.getElementById("svgDetail");
                var svgDoc = svgObj.getSVGDocument();
                var svgRoot = svgDoc.documentElement;
                //alert(svgRoot);
                //(data);
                var jsonData = $.parseJSON(data);
                $.each(jsonData, function (i, v) {
                	
                	 var g = svgDoc.getElementsByTagName("g");
                	    for(var i=0;i<g.length;i++){
                	        if(g[i].getAttribute("database_id") != null){
                	        if(g[i].attributes["database_id"].nodeValue == v.id){
                	        	if(v.value==0){
                	        		g[i].getElementsByTagName("circle")[0].setAttribute("fill","#ff0000");
                	        	}
                	        	else{
                	        		g[i].getElementsByTagName("circle")[0].setAttribute("fill","#00ff00");
                	        	}
                	        	
                	            
                	        }
                	        }
                	    }
                });
               }
            })
        }
    
    	
    
    
});