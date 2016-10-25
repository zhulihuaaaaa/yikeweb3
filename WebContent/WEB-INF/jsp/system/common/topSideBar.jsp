
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="/system"> <c:if
					test="${!empty sysUser}">
					<img class="logo" src="${baseUrlStatic}/img/yike11.jpg" />
          		变电站在线监视系统
			</c:if>
			</a>
		</div>
		<div class="navbar-collapse collapse">
			<!-- <ul class="nav navbar-nav ">
            <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> 主页</a></li>
          </ul> -->
			<!--           	<span style="color: white;float: right;">欢迎您：</span> -->

			<!--           <form class="navbar-form navbar-right"> -->
			<!--             <input type="text" class="form-control" placeholder="Search..."> -->
			<!--           </form> -->
			<div class="pull-right">
				<c:if test="${!empty sysUser}">
					<p style="padding-top: 10px; color: #fff;">
						<span class="glyphicon glyphicon-user"></span> 欢迎您， <a href="#"
							class="navbar-link">${sysUser.name}</a>&nbsp;&nbsp;
						<button id="sysAdminLogout" type="button"
							class="btn btn-danger btn-sm logout" onfocus="this.blur()">退出</button>
					</p>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="${baseUrlStatic}/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${baseUrlStatic}/js/system/index.js?ver=${version}"></script>