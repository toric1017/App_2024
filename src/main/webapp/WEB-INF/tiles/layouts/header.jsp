<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.eai_work.common.util.SessionEnum"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<div class="header">
	<div class="header_control display_responsive">
		<div class="header_row">
			<a href="javascript:toggleSide()"></a>
			<div class="div-icon"><i class="fa fa-bars" aria-hidden="true"></i></div>
		</div>
	</div>
	<div class="logo display_responsive_none">
		EAI Portal System
	</div>
	<div class="header_control header_menu">
		<div class="header_row hover_row display_responsive_none">
			<a href="/eaiInterface/"></a>
			<div class="header_menu">EAI Interface</div>
		</div>
		<div class="header_row hover_row display_responsive_none">
			<a href="/eaiResources/"></a>
			<div class="header_menu">EAI Resources</div>
		</div>
		<div class="header_row hover_row display_responsive_none">
			<a href="/eaiPm/"></a>
			<div class="header_menu">EAI PM</div>
		</div>
		<div class="header_row hover_row display_responsive_none">
			<a href="/eaiLog/"></a>
			<div class="header_menu">EAI Log</div>
		</div>
		<div class="header_row">
			<div class="header_menu btn_menu noti_btn" id="noti_btn"></div>
		</div> 
	</div>
</div>

<div class="header_slider hidden">
	<div class="header_slider_row">
		<a href="/eaiInterface/"></a>
		<div class="header_slider_menu">EAI Interface</div>
	</div>
	<div class="header_slider_row">
		<a href="/eaiResources/"></a>
		<div class="header_slider_menu">EAI Resources</div>
	</div>
	<div class="header_slider_row">
		<a href="/eaiPm/"></a>
		<div class="header_slider_menu">EAI PM</div>
	</div>
	<div class="header_slider_row">
		<a href="/eaiLog/"></a>
		<div class="header_slider_menu">EAI Log</div>
	</div>
</div>

<div class="header_noti hidden">
	<div class="noti_tail"></div>
	<div class="noti_body">
		<div class="noti_card_wrapper">
			<div class="noti_card">
				<div class="noti_card_header">
					<p class="m-w10"><i class='fa fa-gear'></i>&nbsp;설정</p>
				</div>
				<div class="noti_card_row" id="noti_user_info_row">
					<p class="m-w10"><i class='fa fa-circle fa-lg noti_dot'></i></p><p>브라우저 알림 ON/OFF</p>
					<label class="toggle_switch">
						<input type="checkbox" name="noti_yn"></input> 
						<span class="toggle_slider round"></span>
					</label>
				</div>
			</div>
			<div class="noti_card">
				<div class="noti_card_header">
					<p class="m-w10"><i class='fa fa-bell-o'></i>&nbsp;알림 리스트</p>
				</div>
				<div class="noti_card_row">
					<ul class="noti_list" id="noti_list"></ul>
				</div>
			</div>	
		<c:set var="userAuthCode" value='<%= (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_AUTH_CODE ) ) %>' ></c:set>
		<c:if test="${userAuthCode == 'ADMIN'}">
			<div class="noti_card">
				<div class="noti_card_header">
					<p class="m-w10"><i class='fa fa-gear'></i>&nbsp;관리자 메뉴</p>
				</div>
				<div class="noti_card_row">
					<ul class="noti_list">
						<li class="noti_el" id="sendNoti">
							<p class="m-w10"><i class="fa fa-circle fa-lg noti_dot"></i></p><p>알림 보내기</p>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
			<div class="noti_card noti_card_transparent" id="noti_logout">
				<div class="div-icon"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
				<p>로그아웃</p> 
			</div>
		</div>
		<div class="loading hidden"></div>
	</div>
	
</div>

<%-- <div class="custom_cursor hidden" id="custom_cursor"></div> --%>
 
<jsp:include page="../../view/common/modal-textarea.jsp" />
<jsp:include page="../../view/common/modal-sendNoti.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		let currUrl = window.location.href; // current page URL
 
		$('.header_menu .header_row').each(function() {
			var linkUrl = $(this).children('a').attr('href'); 
			if (currUrl.indexOf(linkUrl) > -1) {
				$(this).addClass('active');
			} 
		});
 
		var notiHTML = '';
		notiHTML += '<span class="noti_btn_icon hidden_animated">';
		notiHTML += '<i class="fa fa-exclamation" aria-hidden="true" style="padding: 0px 2px 0 2px;"></i>';
		notiHTML += '</span><span class="noti_username">' + CommonUtil.session.userName + '</span>';
		$("#noti_btn").html(notiHTML);  

		$("#noti_btn").on('click', async function(){ 
			$(".noti_btn_icon").removeClass('visible_animated');
			$(".noti_btn_icon").addClass('hidden_animated');

			$(".noti_username").removeClass('right_animated');
			$(".noti_username").addClass('left_animated');

			if($(".header_noti").hasClass('hidden')){
				$(".header_noti").removeClass('hidden'); 

				// 비동기 데이터 로드
				$(".noti_card_wrapper").addClass('hidden');
				$(".loading").removeClass('hidden');
				await getNotiList(); 
				$(".loading").addClass('hidden');
				$(".noti_card_wrapper").removeClass('hidden');
			}else{ 
				$(".header_noti").addClass('hidden');
			} 
		});

		$('.card').on('click', function(e){
			if(e.target.id != 'noti_btn' && !$(".header_noti").hasClass('hidden')){
				$(".header_noti").addClass('hidden');
			}
		});

		$("#noti_user_info_row").on('click', 'input[name="noti_yn"]', function(){
			updateUserInfo($(this).is(":checked"));
		});

		$("#noti_list").on('click', 'li[name="noti_detail"]',function(){
			openNotiDetailPopup($(this), $(this).data('element'));
		});

		$("#noti_logout").on('click', function(){
			logout(); 
		});

		$("#sendNoti").on('click', function(){
			openSendNotiPopup();
		});

		$(".card .container").on('mousedown', function(e) {
			var isExecute = true;
			var _target = $(e.target).attr('class');
			// 이미 세션 사용자가 수정중인 항목은 수정불가
			for(var i=0; i<CommonUtil.websocket.cursorActiveList.length; i++){
				if(_target == CommonUtil.websocket.cursorActiveList[i].target){
					e.preventDefault();
					isExecute = false;
					break;
				}
			}

			if(isExecute){
				var data = {
					dataType: 'mousedown',
					curUrl : currUrl,
					userId: CommonUtil.session.userId,
					userName: CommonUtil.session.userName, 
					screenWidth: $(this).innerWidth(),
					screenHeight : $(this).innerHeight(),
					left: e.pageX - 0,
					top: e.pageY - 50,
					value : e.target.value,
					target : _target
				};

				CommonUtil.websocket.send(JSON.stringify(data));
			}
		});

		$(".card .container").on('keyup', function(e) {
			var isExecute = true;
			var _target = $(e.target).attr('class');
			// 이미 세션 사용자가 수정중인 항목은 수정불가
			for(var i=0; i<CommonUtil.websocket.cursorActiveList.length; i++){
				if(_target == CommonUtil.websocket.cursorActiveList[i].target){
					e.preventDefault();
					isExecute = false;
					break;
				}
			}

			if(isExecute){
				var data = {
					dataType: 'keyup',
					curUrl : currUrl,
					userId: CommonUtil.session.userId,
					userName: CommonUtil.session.userName,
					target : $(e.target).attr('class'),
					keyCode : e.keyCode,
					value : e.target.value
				};

				CommonUtil.websocket.send(JSON.stringify(data));
			}
		});

		$(".card .container input, .card .container textarea, .card .container select").blur(async function(e){
			$(".card .container input").each(function(idx){
				console.log($(this).attr('class') + ": " + $(this).val()); 
			});
			$(".card .container textarea").each(function(idx){
				console.log($(this).attr('class') + ": " + $(this).val()); 
			});
			$(".card .container select").each(function(idx){
				console.log($(this).attr('class') + ": " + $(this).val()); 
			});
		});

		getUserInfo();
	})
	 
	var logout = function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.replace("/index");
		}
	}

	var getUserInfo = function(){
		var _userId = CommonUtil.session.userId;

		if(StringUtil.isEmpty(_userId)){
			return ;
		}
		
		return new Promise(function(resolve, reject){
			var reqData = {
				userId : _userId
			};
			
			CommonUtil.api.ajaxPost("/api/user/getUserInfoAjax", reqData, function(res){
				if(StringUtil.isEmpty(res.data)){
					reject('userData doesnot exist');
				}else{
					var notiYn = res.data.noti_yn;
					$('#noti_user_info_row input[name="noti_yn"]').prop('checked', (notiYn == 'Y') ? true : false);

					var notiCnt = res.data.noti_cnt;
					if(StringUtil.number.stringToNumber(notiCnt) > 0){
						$(".noti_username").addClass('right_animated');

						$(".noti_btn_icon").removeClass('hidden_animated');
						$(".noti_btn_icon").addClass('visible_animated');
					}
					
					resolve();
				} 
			});
		}).catch(e => console.log(e));
	} 

	var updateUserInfo = function(isChecked){
		var _userId = CommonUtil.session.userId;
		if(StringUtil.isEmpty(_userId)){
			return ;
		}
			
		var reqData = {
			userId : _userId
			, notiYn : isChecked ? "Y" : "N"
		};
		
		CommonUtil.api.ajaxPost("/api/user/updateUserInfoAjax", reqData, function(){
			alert('실시간 알림 ON/OFF 기능은 브라우저 새로고침 이후에 적용됩니다.');
		});
	}

	var getNotiList = function(){ 
		return new Promise(function(resolve, reject){
			CommonUtil.api.ajaxPost("/api/noti/getNotiListAjax", {}, function(res){
				var innerHTML = '';
				if(res.data.length < 1){
					innerHTML = '<li class="noti_el">알림이 없습니다.</li>';
				}else{
					res.data.forEach((e, idx) => {
						innerHTML += '<li class="noti_el" name="noti_detail" data-element=\'' + JSON.stringify(e) + '\'>';
						innerHTML += '<p class="m-w10"><i class="fa fa-circle fa-lg noti_dot"></i></p>';
						if(StringUtil.isEquals('N', e.seen_yn)){
							innerHTML += '<span class="noti_icon" style="margin: 0 10px 0 0"><i class="fa fa-exclamation-circle" aria-hidden="true" style="padding: 0px 2px 0 2px;"></i> 신규</span>';
						}
						innerHTML += '<p>'+e.noti_subject+'</p>';
						innerHTML += '</li>';
						if(idx < res.data.length - 1){
							innerHTML += '<div class="noti_bar"></div>';
						}
					});
				}
				$("#noti_list").html(innerHTML);

				resolve();
			});
		});
	} 

	var saveNotiItem = function(thisObj, reqData){
		thisObj.find(".noti_icon").addClass('hidden');
		reqData.seenYn = 'Y';
		reqData.notiSeq = reqData.noti_seq;
		CommonUtil.api.ajaxPost("/api/noti/saveNotiItemAjax", reqData, null);
	}
 
	var openNotiDetailPopup = function(thisObj, reqData){
		saveNotiItem(thisObj, reqData);
		CommonUtil.modal.modal_detail.init("#modal-textarea", reqData.noti_subject, reqData.noti_content);
		CommonUtil.modal.modal_detail.open("#modal-textarea");
	}

	var openSendNotiPopup = function(){
		CommonUtil.modal.modal_detail.init("#modal-sendNoti", "[관리자 메뉴] 알림 보내기", null);
		CommonUtil.modal.modal_detail.open("#modal-sendNoti");
	}

	var toggleSide = function(){
		if($('.header_slider').hasClass('hidden')){
			$('.header_slider').removeClass('hidden');
		}else{
			$('.header_slider').addClass('hidden');
		}
	}
 
</script>