<%@page import="com.eai_work.common.util.SessionEnum"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String auth = (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_AUTH ) );
%>
<div class="header">
	<div class="header_control display_responsive">
		<div class="header_row">
			<a href="javascript:toggleSide()"></a>
			<div class="div-icon"><i class="fa fa-bars" aria-hidden="true"></i></div>
		</div>
	</div>
	<div class="logo">
		EAI Portal System
	</div>
	<div class="header_control">
		<div class="header_row">
			<a href="#"></a>
			<div class="header_menu">EAI Interface</div>
		</div>
		<div class="header_row">
			<a href="#"></a>
			<div class="header_menu">EAI Resources</div>
		</div>
		<div class="header_row">
			<a href="#"></a>
			<div class="header_menu">EAI PM</div>
		</div>
		<div class="header_row">
			<a href="#"></a>
			<div class="header_menu">EAI Log</div>
		</div>
		<div class="header_row">
			<a href="#"></a>
			<div class="header_menu btn_menu">Admin</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){

		$(document).on('keydown', function(e){
			if(e.keyCode == 119){ // F8 
				toggleSide();
			}
		});
		
	})
	
	var toggleSide = function(){
		if($(".sidenav").css("display") == "none"){
			$(".sidenav").show(); 
			$(".content").css("padding-left", "250px");
			$(".content").css("justify-content", "flex-start");
		}else{
			$(".sidenav").hide(); 
			$(".content").css("padding-left", "0px");
			$(".content").css("justify-content", "center");
		}
	}
	
	var logout = function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.replace("/index");
		}
	}
</script>