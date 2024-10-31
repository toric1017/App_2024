<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function(){
		fn_init();
	})
	
	function fn_init(){
        console.log('modify eaiResources: '  + $("#resResourcesSeq").val());
	}   

    var btnUpdate = function(){
    var data ={
        "eai_seq" : "1",
        "eai_nm" : "eai_nm" ,
        "eai_div_cd" : "eai_div_cd" ,
        "eai_desc" : "eai_desc" ,
        "req_adaptor" : "req_adaptor" ,
        "req_if_way_cd" : "req_if_way_cd" ,
        "req_rfc_id" : "req_rfc_id" ,
        "req_rfc_type_cd" : "req_rfc_type_cd" ,
        "req_dev_db_user_id" : "req_dev_db_user_id" ,
        "req_dev_d_user_pass" : "req_dev_db_user_pass" ,
        "req_real_db_user_id" : "req_real_db_user_id" ,
        "req_real_db_user_pass" : "req_real_db_user_pass" ,
        "req_api_chl_nm" : "req_api_chl_nm" ,
        "req_api_add" : "req_api_add" ,
        "req_operation" : "req_operation" ,
        "res_adaptor" : "res_adaptor" ,
        "res_if_way_cd" : "res_if_way_cd" ,
        "res_rfc_id" : "res_rfc_id" ,
        "res_rfc_type_cd" : "res_rfc_type_cd" ,
        "res_dev_db_user_id" : "res_dev_db_user_id" ,
        "res_dev_db_user_pass" : "res_dev_db_user_pass" ,
        "res_real_db_user_id" : "res_real_db_user_id" ,
        "res_real_db_user_pass" : "res_real_db_user_pass" ,
        "res_api_chl_nm" : "res_api_chl_nm" ,
        "res_api_add" : "res_api_add" ,
        "res_operation" : "res_operation" ,
        "eai_if_real_time_yn" : "Y" ,
        "eai_sync_yn" : "Y" ,
        "eai_cycle" : "eai_cycle" ,
        "eai_occurs_cnt" : "eai_occurs_cnt" ,
        "eai_event_way" : "eai_event_way" ,
        "procedure_call_yn" : "Y" ,
        "use_yn" : "Y" ,
        "updr_id" : "updr_id" ,
        "upd_dtm" : "upd_dtm"

    };
     // Ajax 호출
     $.ajax({
         url: "/eaiInterface/update",   
         type: "POST",
         data: JSON.stringify(data),
         headers : {
                "Content-Type" : "application/json; charset=utf-8",
                "Authorization" : CommonUtil.session.apiKey
            },
         dataType: "json",
         success: function(response) {
             if (response.resCode == "S") {
                 // 등록 성공 시, 반환된 resourceSeq 값으로 상세 페이지로 리다이렉트
                 console.log("Success callback called", response);
                 alert(response.resMeg);
                 location.href = "/eaiInterface/";
             } else {
                 alert("수정 중 오류가 발생했습니다.");
             }
         },
         error: function(xhr, status, error) {
             console.error("Ajax 오류: ", xhr.responseText);
             alert("수정 중 오류가 발생했습니다.");
         }
     });
    }

    

    var btnDelte = function(){


    var data ={
        "eai_seq" : $("#eaiSeq").val()
    };
         // Ajax 호출
         $.ajax({
             url: "/eaiInterface/delete",   
             type: "POST",
             data: JSON.stringify(data),
             headers : {
                    "Content-Type" : "application/json; charset=utf-8",
                    "Authorization" : CommonUtil.session.apiKey
                },
             dataType: "json",
             success: function(response) {
                console.log('response.status :: ' + response.status );

                console.log("Success callback called", response);
                alert("삭제 완료");
                location.href = "/eaiInterface/index";


                //  if (response.status === 200) {
                //      // 등록 성공 시, 반환된 resourceSeq 값으로 상세 페이지로 리다이렉트
                //      console.log("Success callback called", response);
                //      location.href = "/eaiInterface/index";
                //  } else {
                //      alert("삭제 중 오류가 발생했습니다.");
                //  }
             }
            //  ,
            //  error: function(xhr, status, error) {
            //      console.error("Ajax 오류: ", xhr.responseText);
            //      alert("삭제 중 오류가 발생했습니다.");
            //  }
         });
    }

    


</script>
<style>
    tr {
        height: 45px;
    }
</style>
<div class="card">
	<div class="container">
            <div class="page__util-box">
                <!-- 페이지 타이틀 -->
                <h2>EAI Interface</h2>
            </div>
            <div class="page__data-wrap">
                <div class="page__detail-util--box">
                    <a href="/eaiInterface/index" class="btn__black">List</a>
   					<a href="/eaiInterface/mapping/view?eai_seq=${eaiInterface.eai_seq}" class="btn__green">Mapping</a>
                    <a href="/eaiInterface/modify?eai_seq=${eaiInterface.eai_seq}" class="btn__white">Edit</a>
                    <!-- <a href="#" class="btn__black" onclick="btnEdit()">Edit</a> -->

                    <a href="#" class="btn__white" onclick="btnDelte()">Del</a>
                    <!-- <a href="#" class="btn__white" onclick="btnUpdate()">Save</a> -->
                </div>
                <div class="page__data-form">
                    <h3>1. 인터페이스 개요</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th>ID</th>
                            <input type="hidden" id="eaiSeq" value="${eaiInterface.eai_seq}">
                            <td>${eaiInterface.eai_id}</td>
                        </tr>
                        <tr>
                            <th>항목명</th>
                            <td>${eaiInterface.eai_nm}</td>
                        </tr>
                        <tr>
                            <th>업무분류</th>
                            <td>
                                ${eaiInterface.eai_div_cd}
                            </td>
                        </tr>
                        <tr>
                            <th>개요</th>
                            <td>${eaiInterface.eai_desc}</td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-form">
                    <h3>2. EAI대상 시스템 정보</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col>
                            <col style="width:150px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th colspan="2" class="th__title">요청시스템</th>
                            <th colspan="2" class="th__title">응답시스템</th>
                        </tr>
                        <tr>
                            <th>시스템명</th>
                            <td>${eaiInterface.req_resource_name}</td>
                            <th>시스템명</th>
                            <td>${eaiInterface.res_resource_name}</td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-form">
                    <h3>3. 인터페이스 상세</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col>
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th colspan="5" class="th__title">요청시스템</th>
                            <th colspan="5" class="th__title">응답시스템</th>
                        </tr>
                        <tr>
                            <th>Adaptor</th>
                            <td>${eaiInterface.req_adaptor}</td>
                            <th colspan="2">인터페이스 방식</th>
                            <td>${eaiInterface.req_if_way_cd}</td>
                            <th>Adaptor</th>
                            <td>${eaiInterface.res_adaptor}</td>
                            <th colspan="2">인터페이스 방식</th>
                            <td>${eaiInterface.res_if_way_cd}</td>
                        </tr>
                        <tr>
                            <th>RFC</th>
                            <td colspan="4">${eaiInterface.req_rfc_type_cd}</td>
                            <th>RFC</th>
                            <td colspan="4">${eaiInterface.res_rfc_type_cd}</td>
                        </tr>
                        <tr>
                            <th rowspan="2">DB</th>
                            <td>${eaiInterface.req_rfc_id}</td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td>${eaiInterface.req_dev_db_user_id} / ${eaiInterface.req_dev_db_user_pass}</td>
                            <th rowspan="2">DB</th>
                            <td>${eaiInterface.res_rfc_id}</td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td>${eaiInterface.res_dev_db_user_id} / ${eaiInterface.res_dev_db_user_pass}</td>
                        </tr>
                        <tr>
                            <td>${eaiInterface.req_rfc_type_cd}</td>
                            <th>운영</th>
                            <td>${eaiInterface.req_real_db_user_id} / ${eaiInterface.req_real_db_user_pass}</td>
                            <td>${eaiInterface.res_rfc_type_cd}</td>
                            <th>운영</th>
                            <td>${eaiInterface.res_real_db_user_id} / ${eaiInterface.res_real_db_user_pass}</td>
                        </tr>
                        <tr>
                            <th>API(채널명)</th>
                            <td colspan="4">${eaiInterface.req_api_chl_nm}</td>
                            <th>API(채널명)</th>
                            <td colspan="4">${eaiInterface.res_api_chl_nm}</td>
                        </tr>                        
                        <tr>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3">${eaiInterface.req_api_add}</td>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3">${eaiInterface.res_api_add}</td>
                        </tr>                        
                        <tr>
                            <th>Operation</th>
                            <td colspan="3">${eaiInterface.req_operation}</td>
                            <th>Operation</th>
                            <td colspan="3">${eaiInterface.res_operation}</td>
                        </tr>
                        <tr>
                            <th colspan="10" class="th__title">인터페이스 속성</th>
                        </tr>
                        <tr>
                            <th>실시간 여부</th>
                            <td>${eaiInterface.eai_if_real_time_yn}</td>
                            <th colspan="2">동기/비동기</th>
                            <td>${eaiInterface.eai_sync_yn}</td>
                            <th>발생주기(상세)</th>
                            <td>${eaiInterface.eai_cycle}</td>
                            <th colspan="2">예상 발생건수(1회)</th>
                            <td>${eaiInterface.eai_occurs_cnt}</td>
                        </tr>                        
                        <tr>
                            <th>Event 발생</th>
                            <td>${eaiInterface.eai_event_way}</td>
                            <th colspan="2">프로시저 호출여부</th>
                            <td>${eaiInterface.procedure_call_yn}</td>
                            <th>사용 유무</th>
                            <td>${eaiInterface.use_yn}</td>
                            <th colspan="2"></th>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>