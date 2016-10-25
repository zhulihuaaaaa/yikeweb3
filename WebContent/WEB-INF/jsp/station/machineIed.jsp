<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>变电站设备页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	 <link href="${baseUrlStatic}/css/Ied/machine.css" rel="stylesheet">
	<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${baseUrlStatic}/js/Ied/machine.js"></script>
	<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-ui.js"></script>
	<script type="text/javascript" src="${baseUrlStatic}/js/common/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts.js"></script>
  <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-more.js"></script>
  <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/solid-gauge.js"></script>
  <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-3d.js"></script>
 
  </head>
  
  <body>
   <div class="container2">
   		<div class="chart-bottom-heading"><span id="returnBDZ" class="label1">返回变电站</span> </div>
        <c:forEach items="${IedList}" var="IedList" varStatus="status" begin="0" end="12">
        <div class="content-singlechart2">
           <div class="title-in">${IedList.name}</div>
         <div style="border: 1px solid #BFBFBF;border-width:1px 1px 1px 1px;">  
         <div id="chart${status.count}" class="chart" style="float:left;height:110px;width:100%;"></div>
         <script>
         chart($('#'+'chart${status.count}'),'${IedList.score}','${IedList.id}');
		 function chart(chartA,data,url) {
			
			var gaugeOptions = {
			        chart: {
			            type: 'solidgauge',
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
							[0.1, '#EE0000'], // red
							[0.5, '#DDDF0D'], // yellow
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
			            	enabled: false
			            }
			        },
			        plotOptions: {
			            solidgauge: {
			                dataLabels: {
			                    y: 15,
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
	    	   cursor: 'pointer',
	    	   events: {
  	            click:function(){
  	                location.href="real_ied_Servlet?method=jump&para="+url
  	            }
  	        },
	           name: '设备',
	           data: [eval(data)],
	           dataLabels: {
	          	 format: '<div style="text-align:center"><span style="font-size:25px;color:' +
	               ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
	               '<span style="font-size:12px;color:silver">分</span></div>'
	           },
	           tooltip: {
	               valueSuffix: 'percent'
	           }
	       }]
	    }));
		 }
         
         
         
  			
  		  
         </script>
          <table id="basestation"cellspacing="0" cellpadding="0" style="line-height:35px;font-size:14px;text-align:center">
                <tr style="border-width:1px 0px">
                    <td>
                    <div id="${IedList.id}" class="singlemachine"style="background:#CAE8EA;cursor: pointer;width:49%;float:left;border-right:1px solid #BFBFBF">查看详细</div>
                    <div id="${IedList.id}" class="insidemachine"style="background:#CAE8EA;cursor: pointer;width:50%;float:left">内部监测</div>
                    </td>
                </tr>
                <tr>
                    <td class="label"><div style="float:left;margin-left:45px"> 通讯状态:&nbsp</div>
                     <c:choose>
    					<c:when test="${IedList.runstatus == 1.0}">
    					 <div class='circle2' style="margin-top:5px"></div>
					    </c:when>
    					<c:otherwise>
    					<div class='circle' style="margin-top:5px"></div>
   						 </c:otherwise>
					</c:choose>
                    </td>
                </tr>
                <tr style="border-width:0px;margin:0 auto">
                    <td class="label"><div style="float:left;margin-left:45px">运行状态:&nbsp</div>
					  <c:choose>
    					<c:when test="${IedList.comstatus == 1.0}">
    					 <div class='circle2' style="margin-top:5px"></div>
					    </c:when>
    					<c:otherwise>
    					<div class='circle' style="margin-top:5px"></div>
   						 </c:otherwise>
					</c:choose>
                    </td>
                </tr>
           </table>
         </div>
        </div>
        </c:forEach>
        
   </div> 

	
</body>
</html>



