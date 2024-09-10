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
	<div class="header_control header_menu">
		<div class="header_row hover_row">
			<a href="/eaiInterface/index"></a>
			<div class="header_menu">EAI Interface</div>
		</div>
		<div class="header_row hover_row">
			<a href="/eaiResources/index"></a>
			<div class="header_menu">EAI Resources</div>
		</div>
		<div class="header_row hover_row">
			<a href="/eaiPm/index"></a>
			<div class="header_menu">EAI PM</div>
		</div>
		<div class="header_row hover_row">
			<a href="/eaiLog/index"></a>
			<div class="header_menu">EAI Log</div>
		</div>
		<div class="header_row">
			<a href="#"></a>
			<div id="user_profile" class="header_menu btn_menu">Admin</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var currUrl = window.location.href; // current page URL
 
		$('.header_menu .header_row').each(function() {
			var linkUrl = $(this).children('a').attr('href'); 
			if (currUrl.indexOf(linkUrl) > -1) {
				$(this).addClass('active');
			} 
		});

		$("#user_profile").html(CommonUtil.session.userName); 
	})
	 
	var logout = function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.replace("/index");
		}
	}
</script>