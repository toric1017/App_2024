/**
 * CommonUtil.js
 */

var CommonUtil = {
	session : {
		apiKey : ""	
		, userId : ""
		, userName : ""
		, userAuthCode : ""
		, websocketUrl : ""
		, notiYn : ""
	},
	api : {
				ajaxPost : function(_url, _data, _callback){
					$.ajax({
						type : 'post',
						url : _url,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST",
							"Authorization" : CommonUtil.session.apiKey
						},
						dataType : 'json',
						data : JSON.stringify(_data),
						success : function(res, status, xhr){
							if(typeof _callback === 'function'){
								_callback(res);
							}else{ 
								console.log("[ajaxPost] success : " + res);
							}
						},
						error : function(res, status, error){
							console.log("[ajaxPost] error");
							console.log(res);
							console.log(status);
							console.log(error);
							
							alert(res.responseJSON.resMeg); 
						}
					});
				
				},
				ajaxPostPromise : function(_url, _data){
					return $.ajax({
						type : 'post',
						url : _url,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST",
							"Authorization" : CommonUtil.session.apiKey
						},
						dataType : 'json',
						data : JSON.stringify(_data)
					});
				}
	},
	chart : {
			chartObj : [],
			draw : function(_elementId, _type, _dataset_label, _data){
				
				let dataset_label = !StringUtil.isEmpty(_dataset_label) ? _dataset_label : '건';
				const ctx = document.getElementById(_elementId);
				
				var chartObj = new Chart(ctx, {
					type : _type,
					plugins : [ChartDataLabels],
					data : {
						labels : _data.map(row => row.label),
						datasets: [
							{
								label : dataset_label,
								data: _data.map(row => row.count),
								datalabels: {
									align: 'end',
									anchor: 'end',
									formatter: v => v && _data.length < 30 ? v + dataset_label : '' 
								}
							}
						]
					},
					options: {
						plugins:{
							legend: { 
								display: false
							},
							datalabels: { 
								color: '#000000' 
							}
						},
						scales: {
							  x: {
								    grid: {
								      	display: false
								    }
							  }, 
							  y: {
									suggestedMin: 0,
                    				suggestedMax: 20, 
								    grid: {
								      	display: true
								    },
								    ticks:{
										stepSize : 5
									}
							  }
						}
					}
				});
				
				return chartObj;
			},
			setColor : function(_chartObj, _colorBgCode, _colorBrCode, _colorFontCode){
				if(!StringUtil.isEmpty(_chartObj)){
					_chartObj.data.datasets[0].backgroundColor = _colorBgCode;
					_chartObj.data.datasets[0].borderColor = _colorBrCode;
					_chartObj.data.datasets[0].borderWidth = 1;
					_chartObj.options.plugins.datalabels.color = _colorFontCode;
					_chartObj.update();
				}
			},
			setYAxisRange : function(_chartObj, _data, _max_limit){
				if(!StringUtil.isEmpty(_chartObj) || !StringUtil.isEmpty(_data)){
					
					let total_count = 0;
					let max_limit = !StringUtil.isEmpty(_max_limit) ? _max_limit : 5;
					
					_data.forEach((e) => 
						{ 
							if(e.count > total_count) total_count = e.count 
						}
					);
					
					_chartObj.options.scales.y.suggestedMin = 0;
					_chartObj.options.scales.y.suggestedMax = (total_count + max_limit) > 20 ? total_count + max_limit : 20;
					_chartObj.options.scales.y.ticks.stepSize = (total_count + max_limit) > 20 ? parseInt((total_count + max_limit) / 10, 10) : 5; 
					_chartObj.update();
				}
			},
			setAnimation : function(_chartObj, _isEnable){
				if(!StringUtil.isEmpty(_chartObj)){
					_chartObj.options.animations = _isEnable;
					_chartObj.update();
				}
			},
			destroy : function(_chartObj){
				if(!StringUtil.isEmpty(_chartObj)){
					_chartObj.destroy();
				}
			}
	},
	modal: {
		modal_detail : {
			init : function(_modal_id, _modal_header, _modal_context){
				if(!StringUtil.isEmpty(_modal_header)){
					$(_modal_id + " #modal-header").html(_modal_header);
				}
				if(!StringUtil.isEmpty(_modal_context)){
					$(_modal_id + " #modal-context").html(_modal_context);
				}
			},
			open : function(_modal_id){
				$(_modal_id).modal({
					closeClass: 'icon-remove',
					closeText: '⨉'
				});
			}
		}
	}, 
	websocket: {
		ws : null,
		connectedList : [],
		cursorActiveList : [],
		cursorActiveAllowList : ['input', 'textarea', 'select'],
		init : function(){
			if(CommonUtil.websocket.ws == null && !StringUtil.isEmpty(CommonUtil.session.websocketUrl)){
				CommonUtil.websocket.ws = new WebSocket(CommonUtil.session.websocketUrl);
				CommonUtil.websocket.ws.onopen = function() {
					console.log("connected");
				};
				CommonUtil.websocket.ws.onmessage = function(event) {	
					var data = JSON.parse(event.data);
					CommonUtil.websocket.actions(data);
				};

				CommonUtil.websocket.ws.onclose = function() {
					console.log("disconnected");
				};
				CommonUtil.websocket.ws.onerror = function() {
					console.log("error");
				};
			}	
		},
		send : function(_data){
			if(CommonUtil.websocket.ws != null && CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				CommonUtil.websocket.ws.send(_data);
			}
		},
		close : function(){
			if(CommonUtil.websocket.ws != null && CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				CommonUtil.websocket.ws.close();
			}
		}, 
		actions : function(data){
			if(CommonUtil.websocket.ws != null && CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				// 세션 유저의 알림
				if(data.dataType == "noti"){
					$(".noti_username").removeClass('left_animated');
					$(".noti_username").addClass('right_animated');

					$(".noti_btn_icon").removeClass('hidden_animated');
					$(".noti_btn_icon").addClass('visible_animated');
				
					Notification.requestPermission().then(function(){
						new Notification('[EAI-PORTAL] 알림이 도착했습니다.', { body: data.noti_subject, icon: '/favicon.ico' });
					});
				}
				// 세션 유저의 마우스 커서
				if(data.dataType == "mousedown"){

					var isConnectionExist = CommonUtil.websocket.connectedList.some(o => 
						o.userId == data.userId
					);

					var isCorrectConnected = data.curUrl == window.location.href;

					// 세션아이디가 아니고 접속 유저리스트에 없는 유저인 경우, 커서 유저리스트에 추가하고 커서 신규생성
					if(CommonUtil.session.userId != data.userId && !isConnectionExist && isCorrectConnected){
						
						var custom_cursor = '<div class="custom_cursor" id="custom_cursor_'+ data.userId +'"></div>';
						var hexR = Math.floor(Math.random() * 200).toString(16).padStart(2, '0');
						var hexG = Math.floor(Math.random() * 200).toString(16).padStart(2, '0');
						var hexB = Math.floor(Math.random() * 200).toString(16).padStart(2, '0');
						var randomHexColor = '#' + hexR + hexG + hexB;
						$('body').append(custom_cursor);
						
						$('#custom_cursor_' + data.userId).load('/img/cursor.svg', function() {
							$(this).find("#cursor-id-svg").html(data.userName.split('')[0]);
							$(this).find("#cursor-circle-svg").css({'stroke': randomHexColor});
							$(this).find("#cursor-id-svg").css({'stroke': randomHexColor, 'fill': randomHexColor});
							$(this).find("#cursor-triangle-svg").css({'fill': randomHexColor});
						});
						
						data.cursor_color = randomHexColor;
						CommonUtil.websocket.connectedList.push(data);
					}

					// 커서 유저리스트에는 있으나 접속Url이 다를경우
					if(isConnectionExist && !isCorrectConnected){

						// 커서 유저리스트 삭제
						CommonUtil.websocket.connectedList.forEach((o, i) => {
							if(o.userId == data.userId){
								CommonUtil.websocket.connectedList.splice(i, 1);
								$('#custom_cursor_' + o.userId).remove();
							}
						});

						// 커서 엑티브리스트 삭제
						CommonUtil.websocket.cursorActiveList.forEach((o, i) => {
							if(o.userId == data.userId && o.target != data.target){
								$('.'+o.target).removeAttr('style');
								CommonUtil.websocket.cursorActiveList.splice(i, 1);
							}
						});
					}

					// 커서 유저리스트에 있는 모든커서의 좌표를 실시간 변경
					CommonUtil.websocket.connectedList.forEach((o, i) => {
						if(o.userId == data.userId && o.curUrl == window.location.href){

							// 기존 유저의 커서 엑티브리스트 제거
							CommonUtil.websocket.cursorActiveList.forEach((o, i) => {
								if(o.userId == data.userId && o.target != data.target){
									$('.'+o.target).removeAttr('style');
									CommonUtil.websocket.cursorActiveList.splice(i, 1);
								}
							})

							// 커서 활성화가 가능한 태그인지 확인
							var isCursorActiveAllowListClicked = false;
							CommonUtil.websocket.cursorActiveAllowList.forEach(e => {
								if(!StringUtil.isEmpty(data.target) && data.target.indexOf(e) > -1){
									isCursorActiveAllowListClicked = true;
								}
							});

							if(!StringUtil.isEmpty(data.target) && isCursorActiveAllowListClicked){ // 커서 활성화가 가능한 태그 클릭 시

								// 이미 커서가 활성화 되어있는지 확인
								var isAlreadyCursorActive = CommonUtil.websocket.cursorActiveList.some(f => 
									f.userId == data.userId && f.target == data.target
								)

								if(!isAlreadyCursorActive){

									// 마우스 커서의 위치는 클릭된 태그 우측상단 고정
									$('#custom_cursor_' + o.userId).css({
										left: $('.'+data.target).offset().left + $('.'+data.target).width() + 'px',
										top: $('.'+data.target).offset().top - 50 + 'px'
									});
									
									$('.'+data.target).css({'border' : '2px solid ' + o.cursor_color});
	
									// 커서 엑티브리스트에 추가
									CommonUtil.websocket.cursorActiveList.push({
										userId : o.userId,
										target : data.target
									});
								}

							}else{ // 커서 활성화 가능한 태그가 아닐경우, 마우스 커서의 위치는 card resolution에 맞게 마우스 위치를 보여줌

								var resolutionX = $(".card .container").innerWidth() * data.left / data.screenWidth;
								var resolutionY = $(".card .container").innerHeight() * data.top / data.screenHeight;

								$('#custom_cursor_' + o.userId).css({
									left: resolutionX + 'px',
									top: resolutionY + 'px'
								}); 

							}
						}
					});
					
				}
				// 세션 유저의 키보드 입력
				if(data.dataType == "keyup"){

					var userColor = null;
					CommonUtil.websocket.connectedList.forEach(o => {
						if(o.userId == data.userId && o.curUrl == window.location.href){
							userColor = o.cursor_color;
						}
					});

					if(data.keyCode == '9'){ // tab 키 입력시
						
						CommonUtil.websocket.cursorActiveList.forEach((o, i) => {
							if(o.userId == data.userId && o.target != data.target){
								// 기존 유저의 커서 엑티브리스트 제거
								$('.'+o.target).removeAttr('style');
								CommonUtil.websocket.cursorActiveList.splice(i, 1);

								var cursorleftCnt = 0;
								CommonUtil.websocket.cursorActiveList.forEach(cc => {
									if(cc.target == data.target){
										cursorleftCnt++;
									}
								})

								// 마우스 커서의 위치는 클릭된 태그 우측상단 고정
								$('#custom_cursor_' + o.userId).css({
									left: $('.'+data.target).offset().left + $('.'+data.target).width() - (cursorleftCnt * 50) + 'px',
									top: $('.'+data.target).offset().top - 50 + 'px'
								});
								
								$('.'+data.target).css({'border' : '2px solid ' + userColor});

								// 커서 엑티브리스트에 추가
								CommonUtil.websocket.cursorActiveList.push({
									userId : o.userId,
									target : data.target
								});
							}
						})
					}else{	// 그외 다른키 text입력
						CommonUtil.websocket.cursorActiveList.forEach(o => {
							if(o.userId == data.userId && o.target == data.target){
								$('.'+o.target).css({'color' : userColor});
								$('.'+o.target).val(data.value);
							}
						});
					}
				}
			}
		}
	}
}