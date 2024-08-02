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
	<img class="logoIntro" src="/img/logo_intro.png" />
	<div class="header_control">
		<div class="header_row">
			<a href="javascript:logout()"></a>
			<div class="div-icon"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
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
		if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")){
			location.replace("/index");
		}
	}
</script>