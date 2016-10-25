<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设备检测页</title>
<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap-responsive.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/Dataanalysis/layout.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/Ied/insidemachine.css" rel="stylesheet">
<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highstock.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/exporting.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/Ied/insidemachine.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/bootstrap.min.js"></script>
</head>
<body>

<div class="container-machine">
<div class="chart-bottom-heading" style="margin-bottom:3px"><span id="returnsingleMachine" class="label">返回上一层</span> </div>
<!-- 第一行结束 -->
<div class="row-fluid" >
<div class="span2">
<img src="${baseUrlStatic}/img/ma.png" width="100%" style="height:42%"/> 
</div>
<%-- <div class="span2">
<jsp:include page="insidemachine-chart.jsp"></jsp:include>
</div> --%>
<div class="span10">
	<div class="box1"  style="margin:0px 0px 5px 5px">
					<!-- Box Head -->
					<div class="box-head1">
						<h3 class="left1">${IedSingle.name}内部环境监测</h3>
					</div>
					<!-- End Box Head -->	
					<div class="table1" style="height:210px">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>监测项目</th>
								<th>数值</th>
								<th>监测项目</th>
								<th>数值</th>
								<th>监测项目</th>
								<th>数值</th>
								
							</tr>
						</table>
					</div>
	</div>
</div>
</div>
<!-- 第二行-->
<div class="row-fluid" >
<!-- 录波器-->

<div id="container"style="height:160px"></div>
<div id="container2"style="height:130px"></div>
</div>

</div>
</body>
</html>


