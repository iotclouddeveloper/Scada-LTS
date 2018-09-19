<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<link href=resources/new-ui/css/app.css rel=stylesheet>

<style type="text/css">

.menu-padding {
	padding-top: 40px;
}

.dropdown-menu-right {
	float: left;
}

.btn-separator:after {
	content: ' ';
	display: block;
	float: left;
	background: #2fb34a;
	margin: 0 5px;
	height: 37px;
	width: 1px;
}

#mainHeader {
	padding-top: 5px;
	background-color: #d6d5d5;
}

.menu {
	margin-top: 10px;
}

.logo {
	margin: 5px;
}

.margin_nav {
	margin-top: 5px;
	line-height: 20px;
	margin-bottom: 5px;
}

.nav-pills>li>a {
	line-height: 1px;
	margin-right: 2px;
	padding-left: 12px;
	padding-right: 12px;
}

table {
    font-size: 12px;
    border-color: white;

}

thead th {
    background-color: #006DCC;
    color: white;
}

</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<table width="100%" cellspacing="0" cellpadding="0" border="0"
				id="mainHeader">
				<tr>
					<td><img id="logo" class="logo" src="assets/logo.png"
						alt="Logo" /></td>
					<c:if test="${!simple}">
						<td align="center" width="99%" id="eventsRow">
						<span id="__header__MemoryInfo" style="visibility:visible;">
							<input type="button" value="UserSessions" onclick="OnListUserSessions();">
							<input type="button" value="SessonAttributes" onclick="OnListSessionsAttributes();">
							<input type="button" value="WebsocketStats" onclick="OnListWebsocketStats();">

						</span>
						<a
							href="events.shtm">
		         			<span id="__header__alarmLevelDiv" style="visibility:visible;display:visible;">
		           			<img id="__header__alarmLevelImg" src="images/spacer.gif" alt="" border="0" title=""/>
		           			<span id="__header__alarmLevelText">text</span>
		         			</span>
						</a></td>
					</c:if>
					<c:if test="${!empty instanceDescription}">
						<td align="right" valign="bottom" class="projectTitle"
							style="padding: 5px; white-space: nowrap;">${instanceDescription}</td>
					</c:if>
				</tr>
			</table>
		</div>



		<div class="row">
			<div class="col-md-12">
				<nav>
					<ul class="nav nav-pills margin_nav">
						<c:if test="${!empty sessionUser}">

							<li role="presentation"><a href="watch_list.shtm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.watchlists.tooltip"/>'><img
									src="resources/app/menu_icons/eye.png"></a></li>
							<li role="presentation"><a href="views.shtm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.graphicalviews.tooltip"/>'><img
									src="resources/app/menu_icons/icon_view.png"></a></li>
							<li role="presentation"><a href="events.shtm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.alarms.tooltip"/>'><img
									src="resources/app/menu_icons/flag_white.png"></a></li>
							<li role="presentation"><a href="reports.shtm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.reports.tooltip"/>'><img
									src="resources/app/menu_icons/report.png"></a></li>

							<c:if test="${sessionUser.dataSourcePermission}">
								<span class="btn-separator"></span>
								<li role="presentation"><a href="event_handlers.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.event_handlers.tooltip"/>'><img
										src="resources/app/menu_icons/cog.png" /></a></li>
								<li role="presentation"><a href="data_sources.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.data_source.tooltip"/>'><img
										src="resources/app/menu_icons/icon_ds.png" /></a></li>
								<li role="presentation"><a href="scheduled_events.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.scheduled_events.tooltip"/>'><img
										src="resources/app/menu_icons/clock.png" /></a></li>
								<li role="presentation"><a href="compound_events.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.compound_event_detectors.tooltip"/>'><img
										src="resources/app/menu_icons/multi_bell.png" /></a></li>
								<li role="presentation"><a href="point_links.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.point_links.tooltip"/>'><img
										src="resources/app/menu_icons/link.png" /></a></li>
								<li role="presentation"><a href="scripting.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.scripting.tooltip"/>'><img
										src="resources/app/menu_icons/script_gear.png" /></a></li>
								<span class="btn-separator"></span>
							</c:if>

							<!-- TODO my acount -->
							<c:if test="${sessionUser.admin}">
								<li role="presentation" class="active"><a href="permission.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='Permission'><img
										src="resources/app/menu_icons/user_ds.png" /></a></li>
								<li role="presentation"><a
									href="pointHierarchySLTS" class='btn btn-xs'
									data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.point_hierarchy.tooltip"/>'><img
										src="resources/app/menu_icons/folder_brick.png" /></a></li>
								<li role="presentation"><a href="mailing_lists.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.mailing_lists.tooltip"/>'><img
										src="resources/app/menu_icons/book.png" /></a></li>
								<li role="presentation"><a href="publishers.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.publishers.tooltip"/>'><img
										src="resources/app/menu_icons/transmit.png" /></a></li>
								<li role="presentation"><a href="maintenance_events.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.maintenance_events.tooltip"/>'><img
										src="resources/app/menu_icons/hammer.png" /></a></li>
								<li role="presentation"><a href="system_settings.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.system_setings.tooltip"/>'><img
										src="resources/app/menu_icons/application_form.png" /></a></li>
								<li role="presentation"><a href="emport.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.import_export.tooltip"/>'><img
										src="resources/app/menu_icons/script_code.png" /></a></li>
								<li role="presentation"><a href="sql.shtm"
									class='btn btn-xs' data-toggle="tooltip" data-placement="top"
									title='<fmt:message key="menu.sql.tooltip"/>'><img
										src="resources/app/menu_icons/script.png" /></a></li>
								<span class="btn-separator"></span>
							</c:if>

							<li role="presentation"><a href="logout.htm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.logout.tooltip"/>'><img
									src="resources/app/menu_icons/control_stop_blue.png"></a></li>
							<li role="presentation"><a href="help.shtm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.help.tooltip"/>'><img
									src="resources/app/menu_icons/help.png"></a></li>
						</c:if>
						<c:if test="${empty sessionUser}">
							<li role="presentation"><a href="login.htm"
								class='btn btn-xs' data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.login.tooltip"/>'><img
									src="resources/app/menu_icons/control_play_blue.png"></a></li>
						</c:if>
						<div class="btn-group pull-right menu">
							<button class="btn dropdown-toggle btn-xs" data-toggle="dropdown"
								data-toggle="tooltip" data-placement="top"
								title='<fmt:message key="menu.change_language.tooltip"/>'>
								<img src="resources/app/menu_icons/world.png" alt=""> <span
									class="caret" />
							</button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a onclick="setLocale('de')">Deutsch</a></li>
								<li><a onclick="setLocale('ru')">Руссиан</a></li>
								<li><a onclick="setLocale('fi')">Suomi</a></li>
								<li><a onclick="setLocale('pt')">Português</a></li>
								<li><a onclick="setLocale('en')">English</a></li>
								<li><a onclick="setLocale('lu')">Luxembourgeois</a></li>
								<li><a onclick="setLocale('fr')">Francais</a></li>
								<li><a onclick="setLocale('zh')">中文</a></li>
								<li><a onclick="setLocale('nl')">Nederlands</a></li>
								<li><a onclick="setLocale('es')">Español</a></li>
								<li><a onclisk="setLocale('pl')">Polski</a></li>
							</ul>
						</div>
						<div class="btn-group pull-right menu">
							<c:if test="${!empty sessionUser}">
								<a href="" class="btn btn-xs"><span><fmt:message
											key="header.user" />: <b>${sessionUser.username}</b>
									</mark></span></a>

								<!-- TODO REST MiscDwr.toggleUserMuted(setUserMuted)
            				<img id="userMutedImg" class="ptr" onclick="MiscDwr.toggleUserMuted(setUserMuted)" onmouseover="hideLayer('localeEdit')" border="0" src="images/sound_none.png" title="Mute" alt="Mute" style="display: inline;">
            			-->
								<!-- TODO goHomeUrl()
            				<img src="images/house.png" alt="" title="Go to my default page" class="ptr" onclick="goHomeUrl()" onmouseover="hideLayer('localeEdit')" border="0">
            			-->
								<!-- TODO setHomeUrl()
            				<img src="images/house_link.png" alt="" title="Make this my default page" class="ptr" onclick="setHomeUrl()" onmouseover="hideLayer('localeEdit')" border="0">
            			-->
							</c:if>
						</div>
					</ul>
				</nav>
			</div>
		</div>

		<div class="row">
		   <div id="app">
			  <permission></permission>
		   </div>
		</div>
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" class="footer" align="center">&copy;2012-2018 Scada-LTS All rights reserved. <fmt:message
						key="footer.rightsReserved" /></td>
			</tr>
		</table>
	</div>
</body>

<script src=resources/new-ui/js/manifest.js></script>
<script src=resources/new-ui/js/vendor.js></script>
<script src=resources/new-ui/js/app.js></script>

</html>