<%@page import="com.eai_work.common.util.SessionEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>EAI-PORTAL</title>
	
	<!-- meta tag -->
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- style -->
	<link rel="stylesheet" href="/lib/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/lib/jquery-modal-0.9.1/jquery.modal.min.css">
	<link rel="stylesheet" type="text/css" href="/lib/pikaday/pikaday.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/header.css">
	<link rel="stylesheet" href="/css/layout-basic.css">
	<%-- <link rel="stylesheet" href="/css/side.css"> --%>
	<link rel="stylesheet" href="/css/filter.css">
	<%-- <link rel="stylesheet" href="/css/pagination.css"> --%>
	
	<!-- javascript / lib -->
	<script src="/lib/jquery-3.7.1/jquery-3.7.1.js"></script>
	<script src="/lib/jquery-modal-0.9.1/jquery.modal.min.js"></script>
	<script src="/lib/chart.js-4.4.2/chart.js"></script>
	<script src="/lib/chart.js-4.4.2/chartjs-plugin-datalabels@2.0.0.js"></script>
	<script src="/lib/moment.js-2.30.1/moment.js"></script>
	<script src="/lib/pikaday/pikaday.js"></script>
	
	<script src="/js/StringUtil.js"></script>
	<script src="/js/CommonUtil.js"></script>
	
	<!-- CDN --> 

	<script type="text/javascript">
		$(document).ready(function(){
			CommonUtil.session.apiKey = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_API_KEY ) ) %>';
			CommonUtil.session.userAuthCode = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_AUTH_CODE ) ) %>';
			CommonUtil.session.userId = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_ID ) ) %>';
			CommonUtil.session.userName = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_NAME ) ) %>';
			CommonUtil.session.websocketUrl = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_WEBSOCKETURL ) ) %>';
			CommonUtil.session.notiYn = '<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_NOTI_YN ) ) %>';

			// 관리자 메뉴 오픈
			if(StringUtil.isEquals("admin", CommonUtil.session.authKey)){
				
			}

			// 실시간 알림 소켓연결
			if(StringUtil.isEquals("Y", CommonUtil.session.notiYn)){
				CommonUtil.websocket.init();
			}
		});
	</script>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div class="body_wrapper">
		<%-- <tiles:insertAttribute name="side"/> --%>
		<tiles:insertAttribute name="body"/>
	</div>
</body>
</html>