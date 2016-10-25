<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="管理">
    <meta name="author" content="jack">
    <link rel="shortcut icon" href="${baseUrlStatic}/icon/favicon.png">
    <title>后台管理</title>
    <!-- Bootstrap core CSS -->
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- 我们自己的css样式文件放在这里 -->
    <link href="${baseUrlStatic}/css/system/dashboard.css" rel="stylesheet">
    <style type="text/css">
		textarea {
			display: block;
		}
    </style>
  </head>
<body style="padding-top: 50px;">
	<jsp:include page="common/topSideBar.jsp" />
    <div class="container-fluid">
      <div class="row">
       	<jsp:include page="common/leftSideBar.jsp" />
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div id="indexDiv" class="">
       		  <div id="mainDiv">
				  <iframe id="mainframe" frameborder="0" width="100%" height="650" scrolling="no" src="/Dataanalysis" name="mainframe"></iframe>
			  </div>
		  </div>  
        </div>
      </div>
    </div>          
    
    <jsp:include page="common/footerSideBar.jsp"/>
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- 请首先引用jquery，再引用其他js文件 -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${baseUrlStatic}/js/common/commonFunc.js"></script>
    <script type="text/javascript" src="${baseUrlStatic}/js/system/index.js"></script>
</body>
</html>
