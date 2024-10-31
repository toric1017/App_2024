<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">

	var eaiSeq = ${eai_seq};
	
	$(document).ready(function(){
		fn_init();
	})
		
	var fn_init = function() {    	
		mappingDataSet();
	}

	var mappingDataSet = function() {
		var data ={
			"eai_seq" : eaiSeq
		};
		
		// Ajax 호출
		$.ajax({
		    url: "/eaiInterface/mapping/selectMapping",
		    type: "POST",
		    data: JSON.stringify(data),
		    headers: {
				"Content-Type" : "application/json; charset=utf-8",
				"Authorization" : CommonUtil.session.apiKey
			},
		    dataType: "json",
		    success: function(response) {
		        if (response.resCode === "S") {
				 fn_callback("mappingSelect", response.data);
		        } else {
		            alert("조회 중 오류가 발생했습니다.");
		        }
		    },
		    error: function(xhr, status, error) {
		        console.error("Ajax 오류: ", xhr.responseText);
		        alert("조회 중 오류가 발생했습니다.");
		    }
		});
	}

	var fn_callback = function(svcId, data) {
		if(svcId == "mappingSelect"){
			fn_mappingDataSet(data);
		}
	}

	//Mapping 데이터 Setting
	var fn_mappingDataSet = function(data) {
		// interface 데이터
		var interfaceInfo = data.interfaceMaster;
		
		$("#eai_desc").text(interfaceInfo.eai_desc);
		$("#req_resource_name").text(interfaceInfo.req_resource_name);
		$("#req_adaptor").text(interfaceInfo.req_adaptor);
		$("#req_if_way_cd").text(interfaceInfo.req_if_way_cd);
		if(interfaceInfo.req_rfc_type_cd != ""){
			$("#req_object_name").text(interfaceInfo.req_rfc_type_cd);	
		} else {
			$("#req_object_name").text(interfaceInfo.req_rfc_id);	
		}
		
		$("#if_id").text(interfaceInfo.eai_id);
		$("#res_resource_name").text(interfaceInfo.res_resource_name);
		$("#res_adaptor").text(interfaceInfo.res_adaptor);
		$("#res_if_way_cd").text(interfaceInfo.res_if_way_cd);
		if(interfaceInfo.res_rfc_type_cd != ""){
			$("#res_object_name").text(interfaceInfo.res_rfc_type_cd);	
		} else {
			$("#req_object_name").text(interfaceInfo.res_rfc_id);	
		}
		
		// Mapping 상세 데이터
		var mappingDetail         = data.mappingDetail;
		if(mappingDetail != null){
			var seq                   = mappingDetail.seq;
			var use_yn                = mappingDetail.use_yn;
			var del_yn                = mappingDetail.del_yn;
			var reg_id                = mappingDetail.reg_id;
			var reg_dtm               = mappingDetail.reg_dtm;
			var upd_id                = mappingDetail.upd_id;
			var upd_dtm               = mappingDetail.upd_dtm;
			var if_id                 = mappingDetail.if_id;
			var source_input_data     = mappingDetail.source_input_data;
			var source_mapping_data   = mappingDetail.source_mapping_data;
			var target_input_data     = mappingDetail.target_input_data;
			var target_mapping_data   = mappingDetail.target_mapping_data;
			
			$("#mapping_seq").val(seq);		
			
			//source_input_data
			if(source_input_data.length > 0) {
				for(var i=0; i<source_input_data.length; i++) {
					if(i > 1) {
						addInputData('input');	
					}
					var dataMap = source_input_data[i];
					fn_inputDataSet(i, "s", "input", dataMap);
				}	
			}
			//source_mapping_data
			if(source_mapping_data.length > 0) {
				
				for(var i=0; i<source_mapping_data.length; i++) {
					if(i > 1) {
						addInputData('req');	
					}
					var dataMap = source_mapping_data[i];
					fn_inputDataSet(i, "s", "req", dataMap);
				}	
			}
			
			//target_input_data
			if(target_input_data.length > 0) {
				for(var i=0; i<target_input_data.length; i++) {
					var dataMap = target_input_data[i];
					fn_inputDataSet(i, "t", "input", dataMap);
				}	
			}

			//target_mapping_data
			if(target_mapping_data.length > 0) {
				for(var i=0; i<target_mapping_data.length; i++) {
					var dataMap = target_mapping_data[i];
					fn_inputDataSet(i, "t", "req", dataMap);
				}	
			}
		}
	}

	var fn_inputDataSet = function(rownum, system, btn, data) {
		var s_input_description = data.s_input_description;
		var s_input_field       = data.s_input_field;
		var s_input_io          = data.s_input_io;
		var s_input_null        = data.s_input_null;
		var s_input_pk          = data.s_input_pk;
		var s_input_seq         = data.s_input_seq;
		var s_input_size        = data.s_input_size;
		var s_input_type        = data.s_input_type;		

		var idx = rownum + 1;
		$("#"+system+"_"+btn+"_seq_"+idx).val(s_input_seq);
		$("#"+system+"_"+btn+"_field_"+idx).val(s_input_field);
		$("#"+system+"_"+btn+"_pk_"+idx).val(s_input_pk);
		$("#"+system+"_"+btn+"_type_"+idx).val(s_input_type);
		$("#"+system+"_"+btn+"_size_"+idx).val(s_input_size);
		$("#"+system+"_"+btn+"_io_"+idx).val(s_input_io);
		$("#"+system+"_"+btn+"_null_"+idx).val(s_input_null);
		$("#"+system+"_"+btn+"_des_"+idx).val(s_input_description);
	}
	
	
    var addInputData = function(btn) {    	
    	var rowSpan = Number($("#s_"+btn+"_td").attr("rowspan"));
    	var idx = rowSpan + 1;
    	
		var s_row = "<tr id='s_"+btn+"_tr_"+idx+"'>"
                + "<td id='s_"+btn+"_td_"+idx+"'><input id='s_"+btn+"_seq_"+idx+"' type='text' style='width:100%; border: 0;' value="+idx+"></td>"
                + "<td><input id='s_"+btn+"_field_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_pk_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_type_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_size_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_io_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_null_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='s_"+btn+"_des_"+idx+"' type='text' style='width:100%; border: 0;'></td>"                                                       
                + "</tr>";
                
        var t_row = "<tr id='t_"+btn+"_tr_"+idx+"'>"
                + "<td id='t_"+btn+"_td_"+idx+"'><input id='t_"+btn+"_seq_"+idx+"' type='text' style='width:100%; border: 0;' value="+idx+"></td>"
                + "<td><input id='t_"+btn+"_field_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_pk_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_type_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_size_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_io_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_null_"+idx+"' type='text' style='width:100%; border: 0;'></td>"
                + "<td><input id='t_"+btn+"_des_"+idx+"' type='text' style='width:100%; border: 0;'></td>"                                                       
                + "</tr>";
        
		
		$("#s_"+btn+"_tr_"+rowSpan).after(s_row);
		$("#s_"+btn+"_td").attr("rowspan", idx);
		
		$("#t_"+btn+"_tr_"+rowSpan).after(t_row);
		$("#t_"+btn+"_td").attr("rowspan", idx);
    }
    
    
    var delInputData = function(btn) {
    	var rowSpan = Number($("#s_"+btn+"_td").attr("rowspan"));
    	var idx = rowSpan-1;
		
		if(rowSpan < 3) {
			return;
		}
		
		var idx = rowSpan-1;
		
		$("#s_"+btn+"_tr_"+rowSpan).remove();
		$("#s_"+btn+"_td").attr("rowspan", idx);
		
		$("#t_"+btn+"_tr_"+rowSpan).remove();
		$("#t_"+btn+"_td").attr("rowspan", idx);
    }
    
    var saveMapping = function() {
		
		var mappingSeq = $("#mapping_seq").val();
		
    	var data = {    		
    		"if_id" : $("#if_id").text()
    		,"source_input_data" : getJSONData('s_input')
    		,"source_mapping_data" : getJSONData('s_req')
    		,"target_input_data" : getJSONData('t_input')
    		,"target_mapping_data" : getJSONData('t_req')
			,"eai_seq" : eaiSeq
			,"seq" : mappingSeq
    	}
		
		var url = "/eaiInterface/mapping/insertMapping";
    	
		if(confirm("저장하시겠습니까?")) {
	    	$.ajax({
	            url: url,
	            type: "POST",
	            data: JSON.stringify(data),
	            headers : {
							"Content-Type" : "application/json; charset=utf-8",
							"Authorization" : CommonUtil.session.apiKey
							},
	            dataType: "json",
	            success: function(response) {
	                location.reload();
	             },
	             error: function(xhr, status, error) {
	             	console.error("Ajax 오류: ", xhr.responseText);
	             	alert("등록 중 오류가 발생했습니다.");
	             }
	        });
        }
    }
	
	var deleteMapping = function(){
		var mappingSeq = $("#mapping_seq").val();
		if(mappingSeq == null || mappingSeq == ""){
			alert("삭제할 Mapping 데이터가 없습니다.");
			return false;
		}
		
		if(confirm("삭제하시겠습니까?")) {
			var data = {
				"seq" : mappingSeq
			}
			
			$.ajax({
			    url: "/eaiInterface/mapping/deleteMapping",
			    type: "POST",
			    data: JSON.stringify(data),
			    headers : {
							"Content-Type" : "application/json; charset=utf-8",
							"Authorization" : CommonUtil.session.apiKey
							},
			    dataType: "json",
			    success: function(response) {
					location.reload();
			    },
				error: function(xhr, status, error) {
					console.error("Ajax 오류: ", xhr.responseText);
			     	alert("삭제 중 오류가 발생했습니다.");
			    }
			});
		}
	}
    
    var getJSONData = function(gbn) {
    	var rowSpan = Number($("#"+gbn+"_td").attr("rowspan"));
    	
    	var inputDataArray = new Array();
    	
    	for(let i=1;i<rowSpan+1;i++) {
    		var inputData = {
    			"s_input_seq" : $("#"+gbn+"_seq_"+i).val(),
    			"s_input_field" : $("#"+gbn+"_field_"+i).val(),
    			"s_input_pk" : $("#"+gbn+"_pk_"+i).val(),
    			"s_input_type" : $("#"+gbn+"_type_"+i).val(),
    			"s_input_size" : $("#"+gbn+"_size_"+i).val(),
    			"s_input_io" : $("#"+gbn+"_io_"+i).val(),
    			"s_input_null" : $("#"+gbn+"_null_"+i).val(),
    			"s_input_description" : $("#"+gbn+"_des_"+i).val()    		
    		}
    		
    		inputDataArray.push(inputData);
    	}    	
    	return JSON.stringify(inputDataArray);
    }
</script>
	<div class="card">
        <div class="container">
            <div class="page__util-box">
                <!-- 페이지 타이틀 -->
                <h2>EAI Interface <span>Mapping</span></h2>
            </div>
            <div class="page__data-wrap">
                <div class="page__detail-util--box">
                    <a href="/eaiInterface/modifyView?eai_seq=${eai_seq}" class="btn__black">Cancel</a>
                    <a href="#" class="btn__white" onclick="saveMapping()">Save</a>
                    <a href="#" class="btn__white" onclick="deleteMapping()">Del</a>
                </div>
                
                <div class="half-area">
                    <div class="page__data-list mapping">
                        <table>                        
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th class="th__title">인터페이스명</th>
                                <td colspan="3" id="eai_desc"></td>
                            </tr>
                            <tr>
                                <th colspan="4">요청시스템</th>
                            </tr>
                            <tr>
                                <th>시스템명</th>
                                <td colspan="3" id="req_resource_name"></td>
                            </tr>                      
                            <tr>
                                <th>관련 Object 명</th>
                                <td colspan="3" id="req_object_name"></td>
                            </tr>
                            <tr>
                                <th>Adaptor</th>
                                <td id="req_adaptor"></td>
                                <th>인터페이스 방식</th>
                                <td id="req_if_way_cd"></td>
                            </tr>
                        </table>
                        <div class="scroll-area">
							<input type="hidden" name="mapping_seq" id="mapping_seq" value="" />
                            <div class="page__data-list">
                                <table id="source_table_data">                        
                                    <colgroup>
                                        <col style="width:170px;">
                                        <col style="width:40px;">
                                        <col style="width:120px;">
                                        <col style="width:50px;">
                                        <col style="width:60px;">
                                        <col style="width:60px;">
                                        <col style="width:60px;">
                                        <col style="width:50px;">
                                        <col style="width:200px;">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>Table/<br>Structure</th>
                                        <th>Seq</th>
                                        <th>Field</th>
                                        <th>PK</th>
                                        <th>Type</th>
                                        <th>SIZE</th>
                                        <th>I/O</th>
                                        <th>null허용</th>
                                        <th>Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td rowspan="5"><strong>&lt;EAI_REQUEST&gt;</strong> INTERFACE_INFO</td>
                                        <td>1</td>
                                        <td>REQEUST_SYSTEM</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td></td>
                                        <td>요청시스템</td>
                                    </tr>                                    
                                    <tr>
                                        <td>2</td>
                                        <td>UUID</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td></td>
                                        <td>요청시스템+currentTimeMillis</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>OPTIONAL_1</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드1</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>OPTIONAL_2</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드2</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>OPTIONAL_3</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드3</td>
                                    </tr>                                   
                                    <tr id="s_input_tr">
                                        <td id="s_input_td" rowspan="2" class="btn__area">
                                            INPUT_DATA <strong>&lt;/EAI_REQUEST&gt;</strong>
                                            <button type="button" class="btn__row-add" onclick="addInputData('input')">+</button>
                                            <button type="button" class="btn__row-del" onclick="delInputData('input')">-</button>
                                        </td>
                                        <td id="s_input_td_1"><input id="s_input_seq_1" type="text" style="width:100%; border: 0;" value=1></td>
                                        <td><input id="s_input_field_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_pk_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_type_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_size_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_io_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_null_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_des_1" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="s_input_tr_2">                                        
                                        <td id="s_input_td_2"><input id="s_input_seq_2" type="text" style="width:100%; border: 0;" value=2></td>
                                        <td><input id="s_input_field_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_pk_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_type_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_size_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_io_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_null_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_input_des_2" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="s_req_tr">
                                        <td id="s_req_td" rowspan="2" class="btn__area">
                                            REQ_DATA                                            
                                            <button type="button" class="btn__row-add" onclick="addInputData('req')">+</button>
                                            <button type="button" class="btn__row-del" onclick="delInputData('req')">-</button>
                                        </td>
                                        <td id="s_req_td_1"><input id="s_req_seq_1" type="text" style="width:100%; border: 0;" value=1></td>
                                        <td><input id="s_req_field_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_pk_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_type_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_size_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_io_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_null_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_des_1" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="s_req_tr_2">
                                        <td id="s_req_td_2"><input id="s_req_seq_2" type="text" style="width:100%; border: 0;" value=2></td>
                                        <td><input id="s_req_field_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_pk_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_type_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_size_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_io_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_null_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="s_req_des_2" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="5"><strong>&lt;EAI_RESPONSE&gt;</strong> RESPONSE_INFO<strong><br>&lt;/EAI_RESPONSE&gt;</strong></td>
                                        <td>1</td>
                                        <td>RESPONSE_CODE</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>2</td>
                                        <td>I</td>
                                        <td></td>
                                        <td>EAI Return Code(성공:S, 실패:E)</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>RESPONSE_MESSEGE</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>220</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>메시지 텍스트(성공/실패 메시지)</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>RESPONSE_SYSTEM</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>응답시스템 서비스ID</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>UUID</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>요청시스템+currentTimeMillis</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>EAI_RESPONSETIME</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>14</td>
                                        <td>i</td>
                                        <td>&nbsp;</td>
                                        <td>EAI응답시간</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="page__data-list mapping">
                        <table>                        
                            <colgroup>
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col style="width:20%;">
                                <col style="width:30%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th class="th__title">인터페이스ID</th>
                                <td colspan="3" id="if_id"></td>
                            </tr>
                            <tr>
                                <th colspan="4">응답시스템</th>
                            </tr>
                            <tr>
                                <th>시스템명</th>
                                <td colspan="3" id="res_resource_name"></td>
                            </tr>                      
                            <tr>
                                <th>관련 Object 명</th>
                                <td colspan="3" id="res_object_name"></td>
                            </tr>
                            <tr>
                                <th>Adaptor</th>
                                <td id="res_adaptor"></td>
                                <th>인터페이스 방식</th>
                                <td id="res_if_way_cd"></td>
                            </tr>
                        </table>
                        <div class="scroll-area">
                            <div class="page__data-list">
                                <table id="target_table_data">                        
                                    <colgroup>
                                        <col style="width:120px;">
                                        <col style="width:40px;">
                                        <col style="width:120px;">
                                        <col style="width:50px;">
                                        <col style="width:60px;">
                                        <col style="width:60px;">
                                        <col style="width:60px;">
                                        <col style="width:50px;">
                                        <col style="width:200px;">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>Table/<br>Structure</th>
                                        <th>Seq</th>
                                        <th>Field</th>
                                        <th>PK</th>
                                        <th>Type</th>
                                        <th>SIZE</th>
                                        <th>I/O</th>
                                        <th>null허용</th>
                                        <th>Description</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td rowspan="5"><strong>&lt;EAI_REQUEST&gt;</strong> INTERFACE_INFO</td>
                                        <td>1</td>
                                        <td>REQEUST_SYSTEM</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td></td>
                                        <td>요청시스템</td>
                                    </tr>                                    
                                    <tr>
                                        <td>2</td>
                                        <td>UUID</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td></td>
                                        <td>요청시스템+currentTimeMillis</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>OPTIONAL_1</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드1</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>OPTIONAL_2</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드2</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>OPTIONAL_3</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>O</td>
                                        <td>&nbsp;</td>
                                        <td>선택노드3</td>
                                    </tr>                                   
                                    <tr id="t_input_tr">
                                        <td id="t_input_td" rowspan="2" class="btn__area">
											INPUT_DATA <strong>&lt;/EAI_REQUEST&gt;</strong>
                                        	<button type="button" class="btn__row-add" onclick="addInputData('input')">+</button>
                                            <button type="button" class="btn__row-del" onclick="delInputData('input')">-</button>                               
                                        </td>
                                        <td id="t_input_td_1"><input id="t_input_seq_1" type="text" style="width:100%; border: 0;" value=1></td>
                                        <td><input id="t_input_field_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_pk_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_type_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_size_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_io_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_null_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_des_1" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="t_input_tr_2">
                                        <td id="t_input_td_2"><input id="t_input_seq_2" type="text" style="width:100%; border: 0;" value=2></td>
                                        <td><input id="t_input_field_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_pk_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_type_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_size_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_io_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_null_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_input_des_2" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="t_req_tr">
                                        <td id="t_req_td" rowspan="2" class="btn__area">
                                            REQ_DATA                                            
                                            <button type="button" class="btn__row-add" onclick="addInputData('req')">+</button>
                                            <button type="button" class="btn__row-del" onclick="delInputData('req')">-</button>
                                        </td>
                                        <td id="t_req_td_1"><input id="t_req_seq_1" type="text" style="width:100%; border: 0;" value=1></td>
                                        <td><input id="t_req_field_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_pk_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_type_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_size_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_io_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_null_1" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_des_1" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr id="t_req_tr_2">
                                        <td id="t_req_td_2"><input id="t_req_seq_2" type="text" style="width:100%; border: 0;" value=2></td>
                                        <td><input id="t_req_field_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_pk_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_type_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_size_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_io_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_null_2" type="text" style="width:100%; border: 0;"></td>
                                        <td><input id="t_req_des_2" type="text" style="width:100%; border: 0;"></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="5"><strong>&lt;EAI_RESPONSE&gt;</strong> RESPONSE_INFO<strong><br>&lt;/EAI_RESPONSE&gt;</strong></td>
                                        <td>1</td>
                                        <td>RESPONSE_CODE</td>
                                        <td></td>
                                        <td>String</td>
                                        <td>2</td>
                                        <td>I</td>
                                        <td></td>
                                        <td>EAI Return Code(성공:S, 실패:E)</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>RESPONSE_MESSEGE</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>220</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>메시지 텍스트(성공/실패 메시지)</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>RESPONSE_SYSTEM</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>응답시스템 서비스ID</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>UUID</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>30</td>
                                        <td>I</td>
                                        <td>&nbsp;</td>
                                        <td>요청시스템+currentTimeMillis</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>EAI_RESPONSETIME</td>
                                        <td>&nbsp;</td>
                                        <td>String</td>
                                        <td>14</td>
                                        <td>i</td>
                                        <td>&nbsp;</td>
                                        <td>EAI응답시간</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>