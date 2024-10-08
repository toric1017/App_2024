<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="/css/modal.css">
</head> 
<div id="modal-sendNoti" class="modal modal-wrapper">
	<div class="modal-header" id="modal-header"></div>
	<div class="modal-content">
		<div class="page__data-form">
			<table>
			<colgroup>
				<col style="width: 150px" />
				<col />
			</colgroup>
				<tr><td>사용자</td><td><input type="text" id="userId" /></td></tr>
				<tr><td>제목</td><td><input type="text" id="notiSubject" /></td></tr>
				<tr><td>내용</td><td><textarea spellcheck="false" class="modal-textarea" id="notiContent"></textarea></td></tr>
			</table>
		</div>
	</div>
	<div class="modal-control">
		<div class="btn_group">
			<a href="#" class="btn__white" id="sendNotiItem">보내기</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendNotiItem").on('click', function(){
			sendNotiItem();
		});
	});

	var sendNotiItem = function(){
		var _userId = $("#userId");
		var _notiSubject = $("#notiSubject");
		var _notiContent = $("#notiContent");
		
		if(StringUtil.isEmpty(_userId.val())){
			alert('사용자를 입력하세요');
			_userId.focus();
			return;
		}

		if(StringUtil.isEmpty(_notiSubject.val())){
			alert('제목을 입력하세요');
			_notiSubject.focus();
			return;
		}

		if(StringUtil.isEmpty(_notiContent.val())){
			alert('내용을 입력하세요');
			_notiContent.focus();
			return;
		}

		if(!confirm('알림을 보내겠습니까?')){
			return;
		}

		var reqData = {
			notiContent: $("#notiContent").val()
			, notiSubject: $("#notiSubject").val()
			, userId : $("#userId").val()
		};
		
		CommonUtil.api.ajaxPost("/api/noti/saveNotiItemAjax", reqData, function(){
			alert("알림이 보내졌습니다.");
		});
	}
</script>