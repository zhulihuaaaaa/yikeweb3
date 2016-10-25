<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>变电站状态页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
 <link href="${baseUrlStatic}/css/Dataanalysis/site.css" rel="stylesheet">
 <link href="${baseUrlStatic}/css/Dataanalysis/layout.css" rel="stylesheet">
  <script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-ui.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/Dataanalysis/Dataanalysis.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-more.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/solid-gauge.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-3d.js"></script>
 

<style>
body {
	overflow: hidden;
}
</style>
</head>

<body>
	<div id="stationid" style="display: none">${sessionScope.station.getId()}</div>
	<div class="container">
		<div class="content">
			<div class="content-info">
				<div class="title-in">变电站基本信息</div>
				<table id="basestation" cellspacing="0" cellpadding="6">
					<tr>
						<td>电站名:&nbsp<h8>${sessionScope.station.getName()}</h8></td>
					</tr>
					<tr>
						<td class="label">地址 :&nbsp<h8>${sessionScope.station.getLocation()}</h8></td>
					</tr>
					<tr>
						<td class="label">经纬度:&nbsp<h8>${sessionScope.station.getLongitude()},${sessionScope.station.getLatitude()}</h8></td>
					</tr>
					<tr>
						<td>时区:&nbsp<h8>${sessionScope.station.getTimezone()}</h8></td>
					</tr>
					<tr>
						<td>国家:&nbsp<h8>${sessionScope.station.getCountry()}</h8></td>
					</tr>
					<tr>
						<td class="label">城市:&nbsp<h8>${sessionScope.station.getCity()}</h8></td>
					</tr>
					<tr>
						<td class="label">所属业主:&nbsp<h8>${sessionScope.owner.getName()}</h8></td>
					</tr>
				</table>

			</div>
<!-- 状态评估 -->
			<div class="content-chart">
				<div class="title-in">状态评估</div>
				<div class="content-chartdiv">
					<div id="mygauge" style="float: left;height:100px;width:64.5%;"></div>
<!-- chart颜色分布表 -->
					<div style="float: left; height: 40.5%; width: 34.5%; border: 0px solid #BFBFBF; border-width: 0px 0px 0px 1px; overflow: hidden">
						<table id="basestation" cellspacing="0" cellpadding="4" style="font-weight: normal;height: 100%; width: 100%;">
							<tr>
								<td>评估分范围</td>
							</tr>
							<tr>
								<td class="label"><div style="float: left;">0~79分&nbsp</div>
									<div style="float: left; width: 20%; height: 10px; background: red; margin-top: 3px"></div>
								</td>
							</tr>
							<tr>
								<td class="label"><div style="float: left;">80~89分&nbsp</div>
									<div style="float: left; width: 20%; height: 60%; background: #FF8C00; margin-top: 3px"></div>
								</td>
							</tr>
							<tr style="border-width: 0px; height: 30px">
								<td class="label"><div style="float: left;">90~100分</div>
									<div style="float: left; width: 20%; height: 50%; background: green; margin-top: 3px;"></div>
								</td>
							</tr>
						</table>
					</div>
<!-- chart颜色分布表 -->
					<table id="basestation" cellspacing="0" cellpadding="0"
						style="line-height: 31px; font-size: 14px; text-align: center">
						<tr style="border-width: 1px 0px">
							<td><div id="enterStation" style="background: #CAE8EA; cursor: pointer;">进入变电站</div></td>
						</tr>
						<tr>
							<td class="label"><div style="float: left; margin-left:35%">通讯状态:&nbsp</div> 
							<c:choose>
									<c:when test="${Realstation.comstatus == 1}">
										<div class='circle2' style='margin-top: 5px'></div>
									</c:when>
									<c:otherwise>
										<div class='circle' style='margin-top: 5px'></div>
									</c:otherwise>
							</c:choose>
							</td>
						</tr>
						
						<tr style="border-width: 0px; margin: 0 auto">
							<td class="label"><div style="float: left; margin-left: 35%">运行状态:&nbsp</div> <c:choose>
									<c:when test="${Realstation.runstatus == 1}">
										<div class='circle2' style='margin-top: 5px'></div>
									</c:when>
									<c:otherwise>
										<div class='circle' style='margin-top: 5px'></div>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
					</table>
				</div>
			</div>
<!-- 状态评估 -->			
			<div class="content-run">
				<div class="title-in">运行信息</div>
				<table id="basestation" cellspacing="0" cellpadding="8">
					<tr>
						<td>相电压UA:&nbsp<h8>${RunInfolist.get(0)}</h8></td>
					</tr>
					<tr>
						<td class="label">气体温度:&nbsp<h8>${RunInfolist.get(1)}</h8></td>
					</tr>
					<tr>
						<td>气体湿度:&nbsp<h8>${RunInfolist.get(2)}</h8></td>
					</tr>
					<tr>
						<td class="label"><div style="float: left">跳闸位置开入:&nbsp</div>
							<c:choose>
								<c:when test="${RunInfolist.get(3) == 1.0}">
									<div class='circle4'></div>
								</c:when>
								<c:otherwise>
									<div class='circle3'></div>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td class="label"><div style="float: left">隔离刀分位开入:&nbsp</div>
							<c:choose>
								<c:when test="${RunInfolist.get(4) == 1.0}">
									<div class='circle4'></div>
								</c:when>
								<c:otherwise>
									<div class='circle3'></div>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td class="label"><div style="float: left">母线TV断线:&nbsp</div>
							<c:choose>
								<c:when test="${RunInfolist.get(5) == 1.0}">
									<div class='circle4'></div>
								</c:when>
								<c:otherwise>
									<div class='circle3'></div>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
				</table>

			</div>

			<div class="content-table">
				<div class="title-in">扣分设备部分</div>
				<div
					style="margin-left: 15px; height: 200px; width: 100%; border: 1px solid #BFBFBF; border-width: 0;">
					<c:forEach items="${IedList}" var="IedList" begin="0" end="8">
						<div class="run_block">
							<div class="run_title">${IedList.name}</div>
							<div class="run_val" id="year_output">${IedList.score}</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<div class="containerreport">
		<div class="title">状态评估历史曲线</div>
		<div class="content">
			<div class="toolbar">
				<input type="button" class="TypeButton TypeButtonSele" value="日" />
				<input type="button" class="TypeButton" value="月" /> <input
					type="button" class="TypeButton" value="年" />
				<!-- <input type="button" class="TypeButton" value="总" /> -->
				<input type="button" value="&lt;" /> <input type="text"
					id="FDLDate" size="12"
					onfocus="javascript:WdatePicker({
                    onpicked: function () {
                       GetFDL() ;
                    },
                    skin: 'whyGreen',
                    lang: 'zh-cn',
                    isShowClear: false,
                    minDate: '2012-01-01',
                    maxDate: '%y-%M-{%d-0}'
                })"
					readonly="readonly" value="" style="text-align: center;" /> <input
					type="button" value=">" />
			</div>
			<div style="width: 100%; height: 230px;" id="myPower"></div>
		</div>

	</div>
	<!-- <script type="text/javascript">
 window.setInterval(function(){
$("#mygauge").load("js/BDZ.js");
}, 3000);  
</script> -->

</body>
</html>
