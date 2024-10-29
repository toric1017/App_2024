<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<script type="text/javascript">
	$(document).ready(function(){
        $("#overViewList").bind("click", function(){
            overViewList();
        });

        $("#overViewCreate").bind("click", function(){
            overViewCreate();
        });
	});



    var overViewList = function(){
        location.href = "/eaiInterface/index";
    }

    var overViewCreate = function(){

        if( $("#eaiId").val() == "" ){
            alert("인터페이스 ID는 필수 입력 입니다.");
            $("#eaiId").focus();
            return;
        }

        if( $("#eaiNm").val() == "" ){
            alert("인터페이스 항목명은 필수 입력 입니다.");
            $("#eaiNm").focus();
            return;
        }

        if( $("#eaiDivCd").val() == "" ){
            alert("인터페이스 업무분류는  필수 선택 입니다.");
            $("#eaiDivCd").focus();
            return;
        }

        if( $("#reqResourcesSeq").val() == "" ){
            alert("EAI대상 요청시스템은 필수 선택 입니다.");
            $("#reqResourcesSeq").focus();
            return;
        }

        if( $("#reqResourcesSeq").val() == "" ){
            alert("EAI대상 응답시스템은 필수 선택 입니다.");
            $("#reqResourcesSeq").focus();
            return;
        }

        if( $("#eaiIfRealTimeYn").val() == "" ){
            alert("인터페이스 상세 실시간여부는 필수 선택 입니다.");
            $("#eaiIfRealTimeYn").focus();
            return;
        }

        if( $("#eaiSyncYn").val() == "" ){
            alert("인터페이스 상세 동기/비동기 필수 선택 입니다.");
            $("#eaiSyncYn").focus();
            return;
        }

        if( $("#procedureCallYn").val() == "" ){
            alert("인터페이스 상세 프로시저 호출여부는 필수 선택 입니다.");
            $("#procedureCallYn").focus();
            return;
        }

        if( $("#useYn").val() == "" ){
            alert("인터페이스 상세 사용유무는 필수 선택 입니다.");
            $("#useYn").focus();
            return;
        }




        var data ={
            "eaiId" : $("#eaiId").val(),
            "eaiNm" : $("#eaiNm").val(),
            "eaiDivCd" : $("#eaiDivCd").val(),
            "eaiDesc" : $("#eaiDesc").val(),
            "eaiDesc" : $("#eaiDesc").val(),
            "reqResourcesSeq" : $("#reqResourcesSeq").val(),
            "resResourcesSeq" : $("#resResourcesSeq").val(),

            "reqAdaptor" : $("#reqAdaptor").val(),
            "reqRfc" : $("#reqRfc").val(),
            "reqIfWayCd" : $("#reqIfWayCd").val(),
            "reqRfcId" : $("#reqRfcId").val(),
            "reqRfcTypeCd" : $("#reqRfcTypeCd").val(),
            "reqDevDbUserId" : $("#reqDevDbUserId").val(),
            "reqDevDbUserPass" : $("#reqDevDbUserPass").val(),
            "reqRealDbUserId" : $("#reqRealDbUserId").val(),
            "reqRealDbUserPass" : $("#reqRealDbUserPass").val(),
            "reqApiChlNm" : $("#reqApiChlNm").val(),
            "reqApiAdd" : $("#reqApiAdd").val(),
            "reqOperation" : $("#reqOperation").val(),

            "resAdaptor" : $("#resAdaptor").val(),
            "resRfc" : $("#resRfc").val(),
            "resIfWayCd" : $("#resIfWayCd").val(),
            "resRfcId" : $("#resRfcId").val(),
            "resRfcTypeCd" : $("#resRfcTypeCd").val(),
            "resDevDbUserId" : $("#resDevDbUserId").val(),
            "resDevDbUserPass" : $("#resDevDbUserPass").val(),
            "resRealDbUserId" : $("#resRealDbUserId").val(),
            "resRealDbUserPass" : $("#resRealDbUserPass").val(),
            "resApiChlNm" : $("#resApiChlNm").val(),
            "resApiAdd" : $("#resApiAdd").val(),
            "resOperation" : $("#resOperation").val(),

            "eaiIfRealTimeYn" : $("#eaiIfRealTimeYn").val(),
            "eaiSyncYn" : $("#eaiSyncYn").val(),
            "eaiCycle" : $("#eaiCycle").val(),
            "eaiOccursCnt" : $("#eaiOccursCnt").val(),
            "eaiEventWay" : $("#eaiEventWay").val(),
            "procedureCallYn" : $("#procedureCallYn").val(),
            "useYn" : $("#useYn").val(),
            "delYn" : "N"
        };
        // Ajax 호출
        $.ajax({
            url: "/eaiInterface/api/create",
            type: "POST",
            data: JSON.stringify(data),
            headers : {
                "Content-Type" : "application/json; charset=utf-8",
                "Authorization" : CommonUtil.session.apiKey
            },
            dataType: "json",
            success: function(response) {
                if (response.status === 200) {
                    // 등록 성공 시, 반환된 resourceSeq 값으로 상세 페이지로 리다이렉트
                    console.log("Success callback called", response);
                    location.href = "/eaiInterface/modify?eai_seq=" + response.data;
                } else {
                    alert("등록 중 오류가 발생했습니다.1");
                }
            },
            error: function(xhr, status, error) {
                console.error("Ajax 오류: ", xhr.responseText);
                alert("등록 중 오류가 발생했습니다.23");
            }
        });
    }


    var selectDivBoxChange = function(value) {
        $("#eaiDivCd").val(value)
    }
    var selectReqBoxChange = function(value) {
        $("#reqResourcesSeq").val(value)
    }
    var selectResBoxChange = function(value) {
        $("#resResourcesSeq").val(value)
    }
    var selectRealBoxChange = function(value) {
        $("#eaiIfRealTimeYn").val(value)
    }
    var selectScBoxChange = function(value) {
        $("#eaiSyncYn").val(value)
    }
    var selectCallBoxChange = function(value) {
        $("#procedureCallYn").val(value)
    }
    var selectUseBoxChange = function(value) {
        $("#useYn").val(value)
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
                    <a href="#" class="btn__black" onclick="overViewList()">Cancel</a>
                    <a href="#" class="btn__white" id="overViewCreate">Save</a>
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
                            <td><input type="text" id="eaiId" value=""></td>
                        </tr>
                        <tr>
                            <th>항목명</th>
                            <td><input type="text" id="eaiNm" value=""></td>
                        </tr>
                        <tr>
                            <th>업무분류</th>
                            <td>
                                <input type="hidden" id="eaiDivCd">
                                <select onchange="selectDivBoxChange(this.value)">
                                    <option value="">선택하세요</option>
                                    <option value="업무분류1">업무분류1</option>
                                    <option value="업무분류2">업무분류2</option>
                                    <option value="업무분류3">업무분류3</option>
                                    <option value="업무분류4">업무분류4</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>개요</th>
                            <td><textarea id="eaiDesc"></textarea></td>
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
                                <input type="hidden" id="reqResourcesSeq">
                                <select  onchange="selectReqBoxChange(this.value)">
                                    <option value="">선택</option>
                                    <c:forEach items="${eaiResources.content}" var="resource" varStatus="status">
                                        <option value="${resource.resourceSeq}">${resource.resourceName}</option>
                                    </c:forEach>
                                 </select>
                            </td>
                            <th>시스템명</th>
                            <td>
                                <input type="hidden" id="resResourcesSeq">
                                <select  onchange="selectResBoxChange(this.value)">
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
                            <td><input type="text" id="reqAdaptor"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text" id="reqIfWayCd"></td>
                            <th>Adaptor</th>
                            <td><input type="text" id="resAdaptor"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text" id="resIfWayCd"></td>
                        </tr>

                        <tr>
                            <th>RFC</th>
                            <td colspan="4"><input id="resRfc" type="text"></td>
                            <th>RFC</th>
                            <td colspan="4"><input id="reqRfc" type="text"></td>


                        </tr>
                        <tr>
                            <th rowspan="2">DB</th>
                            <td><input type="text" id="reqRfcId"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input style="width:42%;" type="text" id="reqDevDbUserId">/<input style="width:42%;" type="text" id="reqDevDbUserPass"></td>
                            <th rowspan="2">DB</th>
                            <td><input type="text" id="resRfcId"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input style="width:42%;" type="text" id="resDevDbUserId">/<input style="width:42%;" type="text" id="resDevDbUserPass"></td>
                        </tr>
                        <tr>
                            <td><input id="reqRfcTypeCd" type="text"></td>
                            <th>운영</th>
                            <td><input type="text" style="width:42%;" id="reqRealDbUserId">/<input style="width:42%;" type="text" id="reqRealDbUserPass"></td>
                            <td><input id="resRfcTypeCd" type="text"></td>
                            <th>운영</th>
                            <td><input type="text" style="width:42%;" id="resRealDbUserId">/<input style="width:42%;" type="text" id="resRealDbUserPass"></td>
                        </tr>
                        <tr>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text" id="reqApiChlNm"></td>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text" id="resApiChlNm"></td>
                        </tr>                        
                        <tr>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text" id="reqApiAdd"></td>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text" id="resApiAdd"></td>
                        </tr>                        
                        <tr>
                            <th>Operation</th>
                            <td colspan="3"><input type="text" id="reqOperation"></td>
                            <th>Operation</th>
                            <td colspan="3"><input type="text" id="resOperation"></td>
                        </tr>
                        <tr>
                            <th colspan="10" class="th__title">인터페이스 속성</th>
                        </tr>
                        <tr>
                            <th>실시간 여부</th>
                            <td>
                                <select onchange="selectRealBoxChange(this.value)">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="eaiIfRealTimeYn">
                            </td>
                            <th colspan="2">동기/비동기</th>
                            <td>
                                <select onchange="selectScBoxChange(this.value)">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="eaiSyncYn">
                            </td>
                            <th>발생주기(상세)</th>
                            <td><input type="text" id="eaiCycle"></td>
                            <th colspan="2">예상 발생건수(1회)</th>
                            <td><input type="text" id="eaiOccursCnt"></td>
                        </tr>                        
                        <tr>
                            <th>Event 발생</th>
                            <td><input type="text" id="eaiEventWay"></td>
                            <th colspan="2">프로시저 호출여부</th>
                            <td>
                                <select onchange="selectCallBoxChange(this.value)">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="procedureCallYn">
                            </td>

                            <th>사용 유무</th>
                            <td>
                                <select onchange="selectUseBoxChange(this.value)">
                                    <option value="">선택</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <input type="hidden" id="useYn">
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