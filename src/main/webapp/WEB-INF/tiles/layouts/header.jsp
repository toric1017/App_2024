<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="header">
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
			<div class="header_menu btn_menu noti_btn" id="noti_btn"></div>
		</div> 
	</div>
</div>

<div class="header_noti hidden">
	<div class="noti_tail"></div>
	<div class="noti_body">
		<div class="noti_card_wrapper">
			<div class="noti_card">
				<div class="noti_card_header">
					<p>설정</p>
				</div>
				<div class="noti_card_row" id="noti_user_info_row">
					<p>브라우저 알림 ON/OFF</p>
					<label class="toggle_switch">
						<input type="checkbox" name="noti_yn"></input> 
						<span class="toggle_slider round"></span>
					</label>
				</div>
			</div>
			<div class="noti_card">
				<div class="noti_card_header">
					<p>알림 리스트</p>
				</div>
				<div class="noti_card_row">
					<div class="noti_list" id="noti_list"></div>
				</div>
			</div>
			<div class="noti_card noti_card_transparent" id="noti_logout">
				<div class="div-icon"><i class="fa fa-sign-out" aria-hidden="true"></i></div>
				<p>로그아웃</p> 
			</div>
		</div>
		<div class="loading hidden"></div>
	</div>
	
</div>
 
<jsp:include page="../../view/common/modal-textarea.jsp" />

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
		notiHTML += '<span class="noti_btn_icon hidden">';
		notiHTML += '<i class="fa fa-exclamation" aria-hidden="true" style="padding: 0px 2px 0 2px;"></i>';
		notiHTML += '</span> ' + CommonUtil.session.userName;
		$("#noti_btn").html(notiHTML); 

		$("#noti_btn").on('click', async function(){
			$(".noti_btn_icon").addClass('hidden');

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
 
		$("#noti_user_info_row").on('click', 'input[name="noti_yn"]', function(){
			updateUserInfo($(this).is(":checked"));
		});

		$("#noti_list").on('click', '.noti_el',function(){
			openNotiDetailPopup($(this), $(this).data('element'));
		});

		$("#noti_logout").on('click', function(){
			logout(); 
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
				var notiYn = res.data.noti_yn;
				$('#noti_user_info_row input[name="noti_yn"]').prop('checked', (notiYn == 'Y') ? true : false);
				resolve();
			});
		});
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
			alert('실시간 알림 ON/OFF 기능은 브라우저 새로코침 이후에 적용됩니다.');
		});
	}

	var getNotiList = function(){ 
		return new Promise(function(resolve, reject){
			CommonUtil.api.ajaxPost("/api/noti/getNotiListAjax", {}, function(res){
				var innerHTML = '';
				if(res.data.length < 1){
					innerHTML = '<div class="noti_el">알림이 없습니다.</div>';
				}else{
					res.data.forEach((e, idx) => { 
						innerHTML += '<div class="noti_el" data-element=\'' + JSON.stringify(e) + '\'>';
						if(StringUtil.isEquals('N', e.seen_yn)){
							innerHTML += '<span class="noti_icon"><i class="fa fa-exclamation-circle" aria-hidden="true" style="padding: 0px 2px 0 2px;"></i> 신규</span>';
						}
						innerHTML += '<p>'+e.noti_subject+'</p>';
						innerHTML += '</div>';
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
 
	var openNotiDetailPopup = async function(thisObj, reqData){
		saveNotiItem(thisObj, reqData);
		CommonUtil.modal.modal_detail.init(reqData.noti_subject, reqData.noti_content);
		CommonUtil.modal.modal_detail.open("#modal-textarea");
	}

</script>