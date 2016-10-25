<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>变电站告警页</title>

<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap-responsive.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/common/bootstrap/bootstrap.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/Dataanalysis/layout.css" rel="stylesheet">
<link href="${baseUrlStatic}/css/alarm/mystyle.css" rel="stylesheet">


<%java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat( 
		   "yyyy-MM-dd HH:mm:ss"); 
		  java.util.Date currentTime = new java.util.Date(); 
		  String time = simpleDateFormat.format(currentTime).toString();  
%>
</head>
<body>
<div id="stationid" style="display: none">${sessionScope.station.getId()}</div>
<div class="container-machine">
<div class="row-fluid">
<!-- 设备chart -->
<div class="span4">
<div class="content-smallchart">
           <div class="small-title-alarm">当前设备实时告警分布图</div>
         <div style="border: 0px solid #BFBFBF">  
         <div id="circle" style="height:230px"></div>
         </div>
</div>
</div>
<!-- 告警对比图 -->
<!-- <div class="span3">
<div class="small-title-alarm" style="margin-top:6px">设备告警两日对比曲线</div>
<div class="chartRow" style="height:265px;margin-left:-10px"></div>
</div> -->
<div class="span8">
<div class="small-title-alarm" style="margin-top:6px">近两日告警事件24小时对比图</div>
 <div id="container22" style="height:230px;margin-left:-10px"></div>
</div>

</div>

<div class="row-fluid">

<!-- 告警详细 -->
<div class="span12">
         <!-- Box -->
				<div class="box1" style="margin:0px 5px 0px 6px">
					<!-- Box Head -->
					<div class="box-head1" style="background:#ba4c32">
						<h3 class="left1">变电站告警详细</h3>
						<div class="right1">
							<input type="text" id="textsearch" value="${value}" class="field small-field"/>
							<input type="button" id="searchbutton"class="button" value="search" />
						</div>
					</div>
					<!-- End Box Head -->	

					<!-- Table -->
					<div class="table1" style="height:200px" id="tableexcel">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr style="font-size:13px;">
								<th>告警级别</th>
								<th>设备名称</th>
								<th>告警类别</th>
								<th>事件名称</th>
								<th>描述</th>
								<th>告警时间</th>
							</tr>
							<c:forEach items="${alarmpb.beanList}" var="alarmpb" >
							<tr>
            					<td>
            					<c:if test="${(alarmpb.subtract) ==0}">
            					<img src="${baseUrlStatic}/img/emergency-off3.png"  height="20" width="20">
            					</c:if>
            					<c:if test="${(alarmpb.subtract) ==1}">
            					<img src="${baseUrlStatic}/img/emergency-off2.png"  height="20" width="20">
            					</c:if>
            					<c:if test="${(alarmpb.subtract) ==2}">
            					<img src="${baseUrlStatic}/img/emergency-off.png"  height="20" width="20">
            					</c:if>
            					</td>
								<td>${alarmpb.ied_name}</td>
								<td>${alarmpb.ied_class}</td>
								<td>${alarmpb.ied_type}</td>
								<td>${alarmpb.desc}</td>
								<td>${alarmpb.time}
								<%-- <fmt:formatDate value="${alarmpb.time}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
								</td>
							</tr>
							</c:forEach>
						</table>
						
					</div>
					<!-- Table -->
					<!-- Pagging -->
						<div class="pagging1">
							<div class="left1"><%=time%>&nbsp  告警记录总数：${alarmpb.tr}</div>
							<div class="right1">
								<%@include file="pager-alarm.jsp" %>
							</div>
						</div>
						<!-- End Pagging -->
					
				</div>
				<!-- End Box -->
         		
           
</div>


</div>
</div>
<script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${baseUrlStatic}/js/common/json2.js"></script>
<script type="text/javascript" src="${baseUrlStatic}/js/alarm/machine-alarm.js"></script>
<script type="text/javascript" src="${baseUrlStatic}/js/common/modernizr-2.6.2-respond-1.1.0.min.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-more.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/solid-gauge.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/Highcharts-4.0.3/highcharts-3d.js"></script>
 <script type="text/javascript" src="${baseUrlStatic}/js/common/bootstrap/bootstrap.min.js"></script>

</body>
</html>


