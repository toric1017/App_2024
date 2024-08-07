<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="/css/index.css">
</head>
<div class="content">
	<div class="card login_logo">
		<div class="card_title">
			<h5>EAI Portal System</h5>
		</div>
	</div>
	
	<div class="card login_input">
		<!-- <div class="card_title">
			<h5>Login</h5>
		</div> -->
		<div class="card_control">
			<p>User ID</p>
			<div class="card_control_icon_text">
				<div class="div_icon"><i class="fa fa-user" aria-hidden="true"></i></div>
				<input type="text" id="user_id"/>
			</div>
		</div>
		<div class="card_control">
			<p>Password</p>
			<div class="card_control_icon_text">
				<div class="div_icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
				<input type="password" id="user_pw"/>
			</div> 
		</div>
		<div class="card_control input_btn_control">
			<input type="button" name="login" id="login" value="Login"/>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){

		$("#login").bind("click", function(){
			login();
		});
		 
		$('#user_id, #user_pw').on('keydown', function(e){
			if(e.keyCode == 13){
				login(); 
			}
		});
	});	

	var disableBack = function() { 
        window.history.forward();
    } 
	
	var login = function(){

		var data ={
			"user_id" : $("#user_id").val(),
			"user_pw" : $("#user_pw").val()
		};
		 
		/*CommonUtil.api.ajaxPost("/api/login/loginAjax", data, function(){
			location.href = "/job/DashBoard";
		});*/
		
		location.href = "/dashboard";
	}
</script>