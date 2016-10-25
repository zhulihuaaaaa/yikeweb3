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
    <title>svg</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/svg.css'/>">
    <script type="text/javascript" src="<c:url value='/js/jquery-1.9.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/svg.js'/>"></script>
</head>
<body>
  <div class="container-machine">
    <embed  style="background-color:#fff" src="${baseUrlStatic}/svg/svg.svg" width="100%" name="svgDetail" id="svgDetail" height="100%"
            type="image/svg+xml" pluginspage="http://www.adobe.com/svg/viewer/install/"  style="overflow-y:hidden"/>
  </div> 
</body>
</html>
