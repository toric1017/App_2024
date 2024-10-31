<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<script type="text/javascript">
	$(document).ready(function(){
		fn_init();
	})
	
	function fn_init(){
        $("#eaiDivCdSel").val($("#eaiDivCd").val()).prop("selected", true);
        $("#eaiIfRealTimeYnSel").val($("#eaiIfRealTimeYn").val()).prop("selected", true);
        $("#eaiSyncYnSel").val($("#eaiSyncYn").val()).prop("selected", true);
        $("#procedureCallYnSel").val($("#procedureCallYn").val()).prop("selected", true);
        $("#useYnSel").val($("#useYn").val()).prop("selected", true);

        $("#reqResourcesSeqSel").val($("#reqResourcesSeq").val()).prop("selected", true);
        $("#reqResourcesSeq1Sel").val($("#reqResourcesSeq1").val()).prop("selected", true);
        
	}   

    var btnUpdate = function(){
    var data ={
        "eai_seq" : $("#eaiSeq").val(),
        "eai_nm" : $("#eaiNm").val() ,
        "eai_div_cd" : $("#eaiDivCd").val() ,
        "eai_desc" : $("#eaiDesc").val() ,
        "req_adaptor" : $("#reqAdaptor").val()  ,
        "req_if_way_cd" : $("#reqIfWayCd").val()  ,
        "req_rfc_id" : $("#reqRfcId").val()  ,
        "req_rfc_type_cd" : $("#reqRfcTypeCd").val()  ,
        "req_dev_db_user_id" : $("#reqDevDbUserId").val()  ,
        "req_dev_d_user_pass" : $("#reqDevDbUserPass").val()  ,
        "req_real_db_user_id" : $("#reqRealDbUserId").val()  ,
        "req_real_db_user_pass" : $("#reqRealDbUserPass").val()  ,
        "req_api_chl_nm" : $("#reqApiChlNm").val()  ,
        "req_api_add" : $("#reqApiAdd").val()  ,
        "req_operation" : $("#reqOperation").val()  ,
        "res_adaptor" : $("#resAdaptor").val()  ,
        "res_if_way_cd" : $("#resIfWayCd").val()  ,
        "res_rfc_id" : $("#resRfcId").val()  ,
        "res_rfc_type_cd" : $("#resRfcTypeCd").val()  ,
        "res_dev_db_user_id" : $("#resDevDbUserId").val()  ,
        "res_dev_db_user_pass" : $("#resDevDbUserPass").val()  ,
        "res_real_db_user_id" : $("#resRealDbUserId").val()  ,
        "res_real_db_user_pass" : $("#resRealDbUserPass").val()  ,
        "res_api_chl_nm" : $("#resApiChlNm").val()  ,
        "res_api_add" : $("#resApiAdd").val()  ,
        "res_operation" : $("#resOperation").val()  ,
        "eai_if_real_time_yn" : $("#eaiIfRealTimeYnSel").val() ,
        "eai_sync_yn" : $("#eaiSyncYnSel").val()  ,
        "eai_cycle" : $("#eaiCycle").val()  ,
        "eai_occurs_cnt" : $("#eaiOccursCnt").val()  ,
        "eai_event_way" : $("#eaiEventWay").val() ,
        "procedure_call_yn" : $("#procedureCallYnSel").val()  ,
        "use_yn" : $("#useYnSel").val()  ,
        "updr_id" : $("#updrId").val()  ,
        "upd_dtm" : $("#updDtm").val() 

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
                 if (response.status === 200) {
                     // 등록 성공 시, 반환된 resourceSeq 값으로 상세 페이지로 리다이렉트
                     console.log("Success callback called", response);
                     location.href = "/eaiInterface/modify";
                 } else {
                     alert("등록 중 오류가 발생했습니다.");
                 }
             },
             error: function(xhr, status, error) {
                 console.error("Ajax 오류: ", xhr.responseText);
                 alert("등록 중 오류가 발생했습니다.");
             }
         });
    }


</script>
<div class="card">
	<div class="container">
            <div class="page__util-box">
                <!-- 페이지 타이틀 -->
                <h2>EAI Interface</h2>
            </div>
            <div class="page__data-wrap">
                <div class="page__detail-util--box">
                    <!-- <a href="#" class="btn__black" onclick="btnDelte()">Delete</a> -->
                    <a href="/eaiInterface/modifyView?eai_seq=${eaiInterface.eai_seq}" class="btn__black">Cancel</a>
                    <a href="#" class="btn__white" onclick="btnUpdate()">Save</a>
                </div>
                <div class="page__data-form">
                    <h3>1. 인터페이스 개요 - 요청자 입력사항</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th>ID</th>
                            <input type="hidden" id="eaiSeq" value="${eaiInterface.eai_seq}">
                            <td><input type="text" value="${eaiInterface.eai_id}"></td>
                        </tr>
                        <tr>
                            <th>항목명</th>
                            <td><input type="text" id="eaiNm" value="${eaiInterface.eai_nm}"></td>
                        </tr>
                        <tr>
                            <th>업무분류</th>
                            <td>
                                <input type="hidden" id="eaiDivCd" value="${eaiInterface.eai_div_cd}">
                                <select id="eaiDivCdSel">
                                    <option value="">선택하세요</option>
                                    <option value="업무분류1">업무분류 1</option>
                                    <option value="업무분류2">업무분류 2</option>
                                    <option value="업무분류3">업무분류 3</option>
                                    <option value="업무분류4">업무분류 4</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>개요</th>
                            <td><textarea id="eaiDesc">${eaiInterface.eai_desc}</textarea></td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-form">
                    <h3>2. EAI대상 시스템 정보 - 요청자 입력사항</h3>
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
                            <td>
                            <input type="hidden" id="reqResourcesSeq" value="${eaiInterface.req_resource_seq}">
                                <select  onchange="selectReqBoxChange(this.value)" id="reqResourcesSeqSel">
                                    <option value="">선택</option>
                                    <c:forEach items="${eaiResources.content}" var="resource" varStatus="status">
                                        <option value="${resource.resourceSeq}">${resource.resourceName}</option>
                                    </c:forEach>
                                 </select>
                                </td>
                            <th>시스템명</th>
                            <td>
                            <input type="hidden" id="reqResourcesSeq1" value="${eaiInterface.res_resource_seq}">
                                <select  onchange="selectReqBoxChange(this.value)" id="reqResourcesSeq1Sel">
                                    <option value="">선택</option>
                                    <c:forEach items="${eaiResources.content}" var="resource" varStatus="status">
                                        <option value="${resource.resourceSeq}">${resource.resourceName}</option>
                                    </c:forEach>
                                 </select>
                                </td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-form">
                    <h3>3. 인터페이스 상세 - 요청자 입력사항</h3>
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
                            <td><input type="text" id="reqAdaptor" value="${eaiInterface.req_adaptor}"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text" id="reqIfWayCd" value="${eaiInterface.req_if_way_cd}"></td>
                            <th>Adaptor</th>
                            <td><input type="text" id="resAdaptor" value="${eaiInterface.res_adaptor}"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text" id="resIfWayCd" value="${eaiInterface.res_if_way_cd}"></td>
                        </tr>
                        <tr>
                            <th>RFC</th>
                            <td colspan="4"><input type="text" id="reqRfcTypeCd" value="${eaiInterface.req_rfc_type_cd}"></td>
                            <th>RFC</th>
                            <td colspan="4"><input type="text" id="resRfcTypeCd" value="${eaiInterface.res_rfc_type_cd}"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">DB</th>
                            <td><input type="text" id="reqRfcId" value="${eaiInterface.req_rfc_id}"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input type="text" id="reqDevDbUserId" value="${eaiInterface.req_dev_db_user_id}" style="width: 45%;"> / <input type="text" id="reqDevDbUserPass" value="${eaiInterface.req_dev_db_user_pass}" style="width: 45%;"></td>
                            <th rowspan="2">DB</th>
                            <td><input type="text" id="resRfcId" value="${eaiInterface.res_rfc_id}"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input type="text" id="resDevDbUserId" value="${eaiInterface.req_dev_db_user_id}" style="width: 45%;"> / <input type="text" id="resDevDbUserPass" value="${eaiInterface.req_dev_db_user_pass}" style="width: 45%;"></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="reqRfcTypeCd" value="${eaiInterface.req_rfc_type_cd}"></td>
                            <th>운영</th>
                            <td><input type="text" id="reqRealDbUserId" value="${eaiInterface.req_real_db_user_id}" style="width: 45%;"> / <input type="text" id="reqRealDbUserPass" value="${eaiInterface.req_real_db_user_pass}" style="width: 45%;"></td>
                            <td><input type="text" id="resRfcTypeCd" value="${eaiInterface.res_rfc_type_cd}"></td>
                            <th>운영</th>
                            <td><input type="text" id="reqRealDbUserId" value="${eaiInterface.res_real_db_user_id}" style="width: 45%;"> / <input type="text" id="reqRealDbUserPass" value="${eaiInterface.res_real_db_user_pass}" style="width: 45%;"></td>
                        </tr>
                        <tr>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text" id="reqApiChlNm" value="${eaiInterface.req_api_chl_nm}"></td>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text" id="resApiChlNm" value="${eaiInterface.res_api_chl_nm}"></td>
                        </tr>                        
                        <tr>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text" id="reqApiAdd" value="${eaiInterface.req_api_add}"></td>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text" id="resApiAdd" value="${eaiInterface.res_api_add}"></td>
                        </tr>                        
                        <tr>
                            <th>Operation</th>
                            <td colspan="3"><input type="text" id="reqOperation" value="${eaiInterface.req_operation}"></td>
                            <th>Operation</th>
                            <td colspan="3"><input type="text" id="resOperation" value="${eaiInterface.res_operation}"></td>
                        </tr>
                        <tr>
                            <th colspan="10" class="th__title">인터페이스 속성</th>
                        </tr>
                        <tr>
                            <th>실시간 여부</th>
                            <td>
                                <select onchange="selectRealBoxChange(this.value)" id="eaiIfRealTimeYnSel">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="eaiIfRealTimeYn" value="${eaiInterface.eai_if_real_time_yn}">
                                <!-- <input type="text" id="eaiIfRealTimeYn" value="${eaiInterface.eai_if_real_time_yn}"> -->
                            </td>
                            <th colspan="2">동기/비동기</th>
                            <td>
                                <!-- <input type="text" id="eaiSyncYn" value="${eaiInterface.eai_sync_yn}"> -->
                                <select onchange="selectScBoxChange(this.value)" id="eaiSyncYnSel">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="eaiSyncYn" value="${eaiInterface.eai_sync_yn}">
                            </td>
                            <th>발생주기(상세)</th>
                            <td><input type="text" id="eaiCycle" value="${eaiInterface.eai_cycle}"></td>
                            <th colspan="2">예상 발생건수(1회)</th>
                            <td><input type="text" id="eaiOccursCnt" value="${eaiInterface.eai_occurs_cnt}"></td>
                        </tr>                        
                        <tr>
                            <th>Event 발생</th>
                            <td><input type="text" id="eaiEventWay" value="${eaiInterface.eai_event_way}"></td>
                            <th colspan="2">프로시저 호출여부</th>
                            <td>
                                <!-- <input type="text" id="procedureCallYn" value="${eaiInterface.procedure_call_yn}"> -->
                                <select onchange="selectCallBoxChange(this.value)" id="procedureCallYnSel">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="procedureCallYn" value="${eaiInterface.procedure_call_yn}">
                            </td>
                            <th>사용 유무</th>
                            <td>
                                <!-- <input type="text" id="useYn" value="${eaiInterface.use_yn}"> -->
                                <select onchange="selectUseBoxChange(this.value)" id="useYnSel">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="useYn" value="${eaiInterface.use_yn}">
                            </td>
                            <th colspan="2"></th>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>
