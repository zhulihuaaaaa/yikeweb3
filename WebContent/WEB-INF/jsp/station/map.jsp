<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>main</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	 <!-- Bootstrap core CSS -->
    <!-- <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"> -->
     <link href="${baseUrlStatic}/css/system/bootstrap.min.css" rel="stylesheet">
    <!-- 我们自己的css样式文件放在这里 -->
     <link href="${baseUrlStatic}/css/map/site.css" rel="stylesheet">
    <link href="${baseUrlStatic}/css/system/dashboard.css" rel="stylesheet">
    <link href="${baseUrlStatic}/css/map/map.css" rel="stylesheet">
  	<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=5c4b6cfcdf62237013fe7c34ddb9d80c"></script>
  	
</head>
<body>
<jsp:include page="/WEB-INF/jsp/system/common/topSideBar.jsp" />

    <%-- <div class="header">
        <div class="logo"><img class="logoo"src="/yikeWeb/images/yike11.png"/> </div>
        <div class="logo_text">变电站在线监视系统</div>
        <div class="logo_text1"> 1.0 version</div>
        <div class="userInfo">
            欢迎您,${sessionScope.sessionUser.name }&nbsp;<i class="LogOutIco"></i><a href="login.jsp">安全退出</a>&nbsp;&nbsp;
        </div>
    </div> --%>
   <!--  <div class="container">
    <iframe src="baidumap.jsp" width="100%" height="570px" frameborder="0" scrolling="no"></iframe>  
    </div> -->
    
    <!--百度地图容器-->
<div
     id="dituContent">
</div>
<div id="searchmap" class="searchmapdiv">
    <input type="text" id="input" class="searchmaptext"/>
    <input type="button" onclick="searchMap()" value="搜索变电站" class="searchmapbut"/>
</div>



<script>
// alert('${Static_stationmap.id}'); 

initMap();//创建和初始化地图
//创建和初始化地图函数：
function initMap() {
    createMap(104.860993, 36.949517);//创建地图
    setMapEvent();//设置地图事件
    addMapControl();//向地图添加控件
}

//创建地图函数：
function createMap(x, y) {
    var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
    var point = new BMap.Point(x,y);//定义一个中心点坐标
    map.centerAndZoom(point,5);//设定地图的中心点和坐标并将地图显示在地图容器中
    window.map = map;//将map变量存储在全局
}

//地图事件设置函数：
function setMapEvent() {
    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
    map.enableScrollWheelZoom();//启用地图滚轮放大缩小
    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
    map.enableKeyboard();//启用键盘上下左右键移动地图
}

//地图控件添加函数：
function addMapControl() {
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl( {
        anchor : BMAP_ANCHOR_TOP_LEFT,
        type : BMAP_NAVIGATION_CONTROL_LARGE
    });
    map.addControl(ctrl_nav); 
}

//创建覆盖物
//alert('${sessionUser.owner_id}');
var owner_id = '${sysUser.owner_id}';
//alert(owner_id);
//储存标注
var markerList = new Array();
var InfoWinList = new Array();

 $.ajax({
	url:"/station/GetStation",
	data:{id:owner_id},
	async:false,
    type: "POST",
    dataType : "json",
    success: function (data) {
    	//alert(data.constructor.name);
    	var a = JSON.stringify(data.data);
    	/* var b = "["+a+"]"; */
    	var model = $.parseJSON(a);
    	//alert(a);
    	$.each(model, function (i, v) {
    		   var point = new BMap.Point(v.longitude, v.latitude);
    	       var marker = new BMap.Marker(point);
    	       map.addOverlay(marker);
    	       var label = new BMap.Label(v.name,{offset: new BMap.Size(25,5)});
    	       marker.setLabel(label);
               marker.setTitle(v.name);
               //创建信息窗口
               var infoContent = "<div>";
               infoContent += "<img src='static/img/loading.gif' />";
               infoContent += "</div>";
               var opts = { "enableMessage": false }
               var infoWindow = new BMap.InfoWindow(infoContent, opts);
               //infoWindow.setTitle("<span style='font-size:14pt; font-weight:bold'>" + v.name + "</span>");
               marker.addEventListener("click", function () {
                   this.openInfoWindow(infoWindow);
               });
               marker.addEventListener("dblclick", function () { FindMK(v.id); });
               infoWindow.addEventListener("open", function () {
                   UpdateStation(v.id,v.name);
                   marker.getLabel().hide();
               });
               infoWindow.addEventListener("close", function () {
                   infoWindow.setContent(infoContent);
                   marker.getLabel().show();
               });
               //存储信息
               markerList[v.id] = marker;
               InfoWinList[v.id] = infoWindow;
    	      
    	});
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
        alert(XMLHttpRequest.status);
        alert(XMLHttpRequest.readyState);
        alert(textStatus);
    }
}); 
    	
//进入变电站新
function UpdateStation(ID,name) {

            $.ajax({
            	url:"/station/Realstation",
            	data:{id:ID},
                type: "POST",
                async:false,
                datatype: 'json',
                success: function (data) {
                	//alert(data);
                	 var aa = JSON.parse(data);
                	 var a = JSON.stringify(aa.data);
                	 var model = $.parseJSON(a);
                	//alert(model.constructor.name);
                	/* var model = $.parseJSON(data);
                	alert(model); */
                	$.each(model, function (i, v) {
                	//alert(v.id);
                	
                	 var strinfo = "<div class='map_info_container'>";
                	 /*****标题*****/
                	 strinfo += "<div class='map_info_title'>" +name+ "</div>";
                     /*****块*****/
                     strinfo += "<div class='map_info_content'>";
                     strinfo += "<div class='map_info_content_text'>通讯状态：</div>";
                     strinfo += "<div class='map_info_content_val'>" + (v.comstatus == 1 ? "<div class='circle2' style='margin-top:5px'></div>" : "<div class='circle' style='margin-top:5px'></div>") + "</div>";
                     strinfo += "</div>";

                     strinfo += "<div class='map_info_content'>";
                     strinfo += "<div class='map_info_content_text'>运行状态：</div>";
                     strinfo += "<div class='map_info_content_val'>" + (v.runstatus == 1 ? "<div class='circle2' style='margin-top:5px'></div>" : "<div class='circle' style='margin-top:5px'></div>") + "</div>";
                     strinfo += "</div>";

                     strinfo += "<div class='map_info_content'>";
                     strinfo += "<div class='map_info_content_text'>评估分：</div>";
                     strinfo += "<div class='map_info_content_val'>" + v.score + "</div>";
                     strinfo += "</div>";

                     /*********/
                     strinfo += "<div class='map_info_toolbar'>";
                     strinfo += "<a href='/station/GetSingleStation?id="+ID+"'>进入变电站</a>";
                     strinfo += "</div>";
                     strinfo += "</div>";
                     var infoWindow = InfoWinList[ID];
                     infoWindow.setContent(strinfo);
                	});
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            });
            
        }
        
//查找站点。显示Infowindow并显示为中点
function FindMK(i) {

    var marker = markerList[i];
    marker.openInfoWindow(InfoWinList[i]);

    var p = marker.getPosition();
    map.centerAndZoom(new BMap.Point(p.lng, p.lat), 11);

    marker.setAnimation(BMAP_ANIMATION_BOUNCE);
    setTimeout(function () { marker.setAnimation(); }, 1500);
}        
        
        
        
//setInterval(UpdateStation(window), 1000);
//点击事件
/* 	function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
        UpdateStation(window); 
      });*/
      /*target.addEventListener("mouseout",function(){
	    	 //alert(1111);
	        target.closeInfoWindow(window);
	  });*/
     
    /*  window.addEventListener("mouseover",function(){
	    	// alert(1111);
	        target.closeInfoWindow(window);
    		});*/

//地图搜索
function searchMap() {
	//alert(111111);
    var area = document.getElementById("input").value; //得到地区
    var ls = new BMap.LocalSearch(map);
    ls.setSearchCompleteCallback(function(rs) {
        if (ls.getStatus() == BMAP_STATUS_SUCCESS) {
            var poi = rs.getPoi(0);
            if (poi) {
                //createMap(poi.point.lng, poi.point.lat);//创建地图(经度poi.point.lng,纬度poi.point.lat)
            	
				 var point = new BMap.Point(poi.point.lng, poi.point.lat);//定义一个中心点坐标
				 map.centerAndZoom(point,12);//设定地图的中心点和坐标并将地图显示在地图容器中
                setMapEvent();//设置地图事件
                addMapControl();//向地图添加控件
				addMapOverlay();
            }
        }
    });
    ls.search(area);
}
</script>
    <jsp:include page="/WEB-INF/jsp/system/common/footerSideBar.jsp" />

</body>
</html>
