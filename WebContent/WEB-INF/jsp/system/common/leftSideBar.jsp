<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<c:if test="${!empty sysUser}">
	<div id="lside" class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar menubar">
		
			<!--  <li class="article active"><a href="/system/article" target="mainframe">文章管理</a></li>
     <li class="article"><a href="/system/article" target="mainframe">calendar</a></li>
     <li class="article"><a href="/system/article" target="mainframe">地图</a></li>  -->
     
<li class='menu_pa'><a href="/map"><i class='gis'></i><span class='menu_name'>首页</span></a></li>
<li class='menu_pa active'><a href="/Dataanalysis" target="mainframe"><i class='dataanalysis'></i><span class='menu_name'>状态评估</span></a></li>
<li class='menu_pa'><a href="/alarm" target="mainframe"><i class='alarmanalysis'></i><span class='menu_name'>实时告警</span></a></li>
<li class='menu_pa'><a href="/svgmonitor" target="mainframe"><i class='needanalysis'></i><span class='menu_name'>在线监测</span></a></li>
<li class='menu_pa'><a href="/camera" target="mainframe"><i class='realtimemonitor'></i><span class='menu_name'>视频监控</span></a></li>
<li class='menu_pa'><a href="/report" target="mainframe"><i class='reportanalysis'></i><span class='menu_name'>统计分析</span></a></li>
<li class='menu_pa'><a href="/system/article" target="mainframe"><i class='systemset'></i><span class='menu_name'>系统管理</span></a></li>
		</ul>
	</div>
</c:if>
