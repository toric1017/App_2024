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
			init : function(_modal_header, _modal_context){
				if(!StringUtil.isEmpty(_modal_header)){
					$("#modal-header").html(_modal_header);
				}
				if(!StringUtil.isEmpty(_modal_context)){
					$("#modal-context").html(_modal_context);
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
			if(CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				ws.send(_data);
			}
		},
		close : function(){
			if(CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				ws.close();
			}
		}, 
		actions : function(data){
			if(CommonUtil.websocket.ws.readyState == WebSocket.OPEN){
				if(data.dataType == "noti"){
					$('.noti_btn_icon').removeClass('hidden');
					
					// Notification.requestPermission().then(function(){
					// 	new Notification('[EAI-PORTAL] 알림이 도착했습니다.', { body: data.noti_subject, icon: img });
					// });
				}
			}
		}
	}
}