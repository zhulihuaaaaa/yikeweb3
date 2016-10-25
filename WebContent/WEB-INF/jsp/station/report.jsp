<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>统计分析</title>
	 <link href="${baseUrlStatic}/css/report/report.css" rel="stylesheet">
	 <script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.9.1.min.js"></script>
	 <script type="text/javascript" src="${baseUrlStatic}/js/report/report.js"></script>
	 <script type="text/javascript" src="${baseUrlStatic}/js/common/My97DatePicker/WdatePicker.js"></script>
	 
	 <%java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat( 
		   "yyyy-MM-dd HH:mm:ss"); 
		  java.util.Date currentTime = new java.util.Date(); 
		  String time = simpleDateFormat.format(currentTime).toString();  %>
</head>
<body>
<div class="container-machine">
 <div class="pricing-table" style="margin-left:10px">
        <div class="pricing-table-header">
            <div style="float:left"><input type="checkbox" onclick="selectStation()" value=""/></div><h1>变电站列表</h1>
        </div>
        
        <div class="pricing-table-content" >
            <ul>
               <c:forEach items="${stationList}" var="stationList">
               <li>
                <div style="margin-left:10px;float:left">
                	<input type="checkbox"class="checkstation" value="${stationList.id}"/>
                </div>&nbsp&nbsp
                <div class="strong" style="float:left;margin-left:28%;cursor:pointer">
                	<div class="hide" style="display:none">${stationList.id}</div>
                	<strong>${stationList.name}</strong>
                </div>
               </li>
             </c:forEach> 
            </ul>
        </div>
        
 </div>
 <div class="pricing-table">
        <div class="pricing-table-header" style="background: #EE9A00">
            <div style="float:left"><input type="checkbox"onclick="selectIed()"/></div><h1>所属设备列表</h1>
        </div>
        
        <div class="pricing-table-content">
            <ul id="content">
             <c:forEach items="${IedList}" var="IedList">
                <li><div style="margin-left:10px;float:left"><input class="checkIed" value="${IedList.id}"type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>${IedList.name}</strong></div></li>
             </c:forEach> 
            </ul>
        </div>
        
    </div>
      <div class="pricing-table">
        <div class="pricing-table-header"style="background: #FFCC00;">
            <h1>时间列表</h1>
        </div>
        
        <table>
        <div class="pricing-table-content">
             <ul>
                <li> 
                 <input type="button" class="TypeButton TypeButtonSele" value="日报表" />
                  <input type="button" class="TypeButton " value="月报表" />
                   <input type="button" class="TypeButton " value="年报表" />
           	   </li>
           	   
                <li> 
                <div class="toolbar">
                    <!-- <input type="button" class="TypeButton" value="总" /> -->
                    <input type="button" value="&lt;" />
                    <input type="text" id="FDLDate" size="12" onfocus="javascript:WdatePicker({
                    onpicked: function () {
                       GetFDL() ;
                    },
                    skin: 'whyGreen',
                    lang: 'zh-cn',
                    isShowClear: false,
                    minDate: '2015-01-01',
                    maxDate: '%y-%M-{%d-0}'
                })" readonly="readonly" value=<%=time%> style="text-align: center;" />

                    <input type="button" value=">" />
            	</div>
           	   </li>
           	   
           	   
            </ul>
           
        </div>
        </table>
         
    </div>
    
  <div class="pricing-table">
        <div class="pricing-table-header"style="background: #ba4c32;">
            <div style="float:left"><input type="checkbox" onclick="selectReport()"/></div><h1>报表类型</h1>
        </div>
        
        <table id="PrintA">
        <div class="pricing-table-content" style="text-align:center;cursor:pointer">
            <ul>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>事件报表</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>遥测报表</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>遥信报表</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>遥测曲线表</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>遥信曲线表</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>站状态评估曲线</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>设备状态评估曲线</strong></div></li>
                <li><div style="margin-left:10px;float:left"><input name="checkReport" value=""type="checkbox"/></div>&nbsp&nbsp<div style="float:left;margin-left:28%;cursor:pointer"><strong>告警曲线表</strong></div></li>
            </ul>
        </div>
        </table>
         
    </div>
    <div style="margin:auto;width:100px;display: inline-block;">
     <input type="button" class="exbutton" onclick="javascript:getXlsFromTbl('tableexcel','machineAlarm.jsp');"value="导出报表Excel"></input>  
     <input type="button" class="exbutton2"onclick="winpop()" value="预览"></input>  
     <!-- <input type="button" class="exbutton2" onclick="alertMsg('11111',1)" value="预览"></input> --> 
     </div>
   
     
</div>   
 
</body>
</html>