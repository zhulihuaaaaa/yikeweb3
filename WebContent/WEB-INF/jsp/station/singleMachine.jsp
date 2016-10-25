<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个变电站信息页</title>
<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap-responsive.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/Dataanalysis/layout.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/alarm/mystyle.css" rel="stylesheet">
<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/Ied/machine.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/modernizr-2.6.2-respond-1.1.0.min.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-more.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/solid-gauge.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-3d.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/bootstrap.min.js"></script>
</head>
<body>

<div class="container-machine">
<div class="chart-bottom-heading"><span id="returnMachine" class="label">返回设备列表</span> </div>
<div class="row-fluid">
<!-- 设备chart -->
<div class="span2">

<div class="content-smallchart">
           <div class="small-title-in">${IedSingle.name}</div>
         <div style="border: 1px solid #BFBFBF;border-width:1px 1px 1px 1px;">  
         <div class="chart1" style="float:left;height:110px;width:100%;"></div>
         <script>
         chart($('.chart1'));
       //扇形图
    	 function chart(chartA) {
    		var gaugeOptions = {
    		        chart: {
    		            type: 'solidgauge'
    		        },
    		        title: null,
    		        pane: {
    		            center: ['50%', '95%'],
    		            size: '170%',
    		            startAngle: -90,
    		            endAngle: 90,
    		            background: {
    		                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
    		                innerRadius: '60%',
    		                outerRadius: '100%',
    		                shape: 'arc'
    		            }
    		        },
    		        tooltip: {
    		            enabled: false
    		        },
    		        // the value axis
    		        yAxis: {
    		            stops: [
    						[0.8, '#EE0000'], // red
    						[0.8, '#DDDF0D'], // yellow
    						[0.9, '#55BF3B'] // green
    		            ],
    		            lineWidth: 0,
    		            minorTickInterval: null,
    		            tickPixelInterval: 400,
    		            tickWidth: 0,
    		            title: {
    		                y: -70
    		            },
    		            labels: {
    		                y: 16
    		            }
    		        },
    		        plotOptions: {
    		            solidgauge: {
    		                dataLabels: {
    		                    y: 20,
    		                    borderWidth: 0,
    		                    useHTML: true
    		                }
    		            }
    		        }
    		    };
       	
     	  chartA.highcharts(Highcharts.merge(gaugeOptions, {
     		 
           yAxis: {
               min: 0,
               max: 100
           },
           credits: {
               enabled: false
           },
           series: [{
               name: '设备',
               data: [eval('${IedSingle.score}')],
               dataLabels: {
              	 format: '<div style="text-align:center"><span style="font-size:20px;color:' +
                   ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                   '<span style="font-size:8px;color:silver">分</span></div>'
               },
               tooltip: {
                   valueSuffix: 'percent'
               }
           }]
        }));
    	}
     //扇形图end
         
         
         </script>
          <table id="basestation"cellspacing="0" cellpadding="0" style="line-height:30px;font-size:12px;text-align:center">
                <tr style="border-width:1px 0px;background:#f5fafa">
                    <td class="label-smallchart"><div style="float:left;margin-left:45px">运行状态:&nbsp</div>
                    <c:choose>
    					<c:when test="${IedSingle.runstatus == 1.0}">
    					 <div class='circle2' style="margin-top:5px"></div>
					    </c:when>
    					<c:otherwise>
    					<div class='circle' style="margin-top:5px"></div>
   						 </c:otherwise>
					</c:choose>
                    </td>
                </tr>
                <tr style="background:#f5fafa">
                    <td class="label-smallchart"><div style="float:left;margin-left:45px">通讯状态:&nbsp</div>
					 <c:choose>
    					<c:when test="${IedSingle.comstatus == 1.0}">
    					 <div class='circle2' style="margin-top:5px"></div>
					    </c:when>
    					<c:otherwise>
    					<div class='circle' style="margin-top:5px"></div>
   						 </c:otherwise>
					</c:choose>
                    </td>
                </tr>
                <tr style="border-width:0px;margin:0 auto;background:#CAE8EA">
                    <td class="label-smallchart"><div style="float:left;margin-left:45px">评分:${IedSingle.score}</div></td>
                </tr>
           </table>
         </div>
</div>

</div>
<!-- 曲线图-->
<div class="span10">
 <div id="chartRow" style="height:250px;margin-left:-15px"></div>
</div>

</div>
<!-- 遥测数据 -->
<div class="row-fluid" style="height:400px">
<div class="span6">
<!-- Box -->
				<div class="box1"  style="margin:0px 0px 0px 5px">
					<!-- Box Head -->
					<div class="box-head1">
						<h3 class="left1">1#进线遥测数据</h3>
					</div>
					<!-- End Box Head -->	

					<!-- Table -->
					<div class="table2" style="height:210px">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
								<th>遥测名称</th>
								<th>数值</th>
								<th>遥测名称</th>
								<th>数值</th>
								<th>遥测名称</th>
								<th>数值</th>
						</tr>
						<tr>
							 <c:forEach items="${anapb.beanList}" var="anapb" varStatus="status">
							 <c:if test="${(status.index+1) mod 3!=1}">
                  				<td><h5>${anapb.name}:</h5></td>
                  				<td>${anapb.value}</td>
           						</c:if>
           						<c:if test="${(status.index+1) mod 3==1}">
           						</tr>
            					<tr>
            					<td><h5>${anapb.name}:</h5></td>
                  				<td>${anapb.value}</td>
            					 </c:if>
							 </c:forEach>
						</tr>
						</table>
						</div>
						<div class="pagging1">
							<div class="left1">Showing 1-3</div>
							<div class="right1">
								<!-- <a href="#">Previous</a>
								<a href="#">1</a>
								<a href="#">2</a>
								<span>...</span>
								<a href="#">Next</a>
								<a href="machine5.jsp">View all</a> -->
								<%@include file="pager-ana.jsp" %>
							</div>
						</div>
					
					<!-- Table -->
					
				</div>
				<!-- End Box -->
</div>
<!-- 遥测数据 -->
<!-- 遥信数据 -->
<div  class="span6">
<!-- Box -->
				<div class="box1"  style="margin:0px 5px 0px -15px">
					<!-- Box Head -->
					<div class="box-head-small">
						<h5 class="left1">1#进线遥信数据</h5>
					</div>
					<!-- End Box Head -->	

					<!-- Table -->
					<div class="table1">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
								<th>遥信名称</th>
								<th>状态</th>
								<th>遥信名称</th>
								<th>状态</th>
								<th>遥信名称</th>
								<th>状态</th>
							</tr>
							<tr>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
							</tr>
							<tr class="odd">
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
							</tr>
							<tr>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
							</tr>
				
						</table>
						
					</div>
					<!-- Table -->
					
				</div>
				<!-- End Box -->
<!-- 遥信数据 -->

<!-- 压板数据 -->
<!-- Box -->
				<div class="box-no-radius" style="margin:10px 5px 0px -15px">
					<!-- Box Head -->
					<div class="box-head-small" style="background:#fffff">
						<h5 class="left1">1#进线压板数据</h5>
					</div>
					<!-- End Box Head -->	

					<!-- Table -->
					<div class="table1">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
								<th>遥信名称</th>
								<th>状态</th>
								<th>遥信名称</th>
								<th>状态</th>
								<th>遥信名称</th>
								<th>状态</th>
							</tr>
							<tr>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
							</tr>
							<tr class="odd">
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
								<td><h5>跳闸位置开入</h5></td>
								<td><div class="circle" style="float:left;margin-left:5px"></div></td>
							</tr>
							
				
						</table>
						
					</div>
					<!-- Table -->
					
				</div>
				<!-- End Box -->
<!-- 压板数据 -->
</div>




</div>
</div>
<script>
var id = ${IedSingle.id};
//折线图		
	$.ajax({
 	url:"/station/StationHis",
 	data:{id:id},
     type: "POST",
     datatype: 'json',
     success: function (data) {
    	 var model = $.parseJSON(data);
    	 var options = {
		        chart: {
		            type: 'line',
		           renderTo: 'chartRow'
		        },
		        title: {
		        	useHTML: true,
		            text: '<a href="/Ied/jumptomachineIed">1#设备状态评估曲线</a>'
		        },
		        subtitle:{
		        	text: '(100分为基数表示设备无异常，出现异常扣一分)'
		        },
		        xAxis: {
		            categories: []
		        },
		        yAxis: {
		            title: {
		                text: '分数 (100分为满分)'
		            }
		        },
		        plotOptions: {
		            series: {
		                animation: false
		            }
		        },
		        tooltip: {
                 shared: true,
                 valueSuffix: '分'
             },
		        series: [{
		            name: '七月(横轴为小时数)',
		            data: []
		        }]
		    };
		    var i,len=model.length;   
         //alert(model.length);
         for( i=0;i<len;i++){
         	//alert(model[i].score);
         	var s = model[i].time.substr(11,2);
         	options.xAxis.categories[i]=s;
         	options.series[0].data[i] = eval(model[i].score);
         }
       
         var chart = new Highcharts.Chart(options);
		    
		    
     }
	});

</script>


</body>
</html>


