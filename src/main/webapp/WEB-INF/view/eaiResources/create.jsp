<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function() {

	    $("#resourceList").bind("click", function(){
            resourceList();
        });

	    $("#resourceCreate").bind("click", function(){
            resourceCreate();
        });

    });

    var resourceList = function(){
	     location.href = "/eaiResources/index";
    }

	var resourceCreate = function(){

	    if( $("#managerCompany").val() == "" ){
	        alert("소속은 필수 입력 입니다.");
	        $("#managerCompany").focus();
	        return;
	    }

	    if( $("#managerDept").val() == "" ){
        	 alert("부서는 필수 입력 입니다.");
        	 $("#managerDept").focus();
        	 return;
        }

        if( $("#managerName").val() == "" ){
              alert("담당자성명은 필수 입력 입니다.");
              $("#managerName").focus();
              return;
        }

        if( $("#resourceName").val() == "" ){
               alert("시스템명은 필수 입력 입니다.");
               $("#resourceName").focus();
               return;
        }

    	var data ={
    		"managerCompany" : $("#managerCompany").val(),
            "managerDept" : $("#managerDept").val(),
            "managerName" : $("#managerName").val(),
            "managerPhone" : $("#managerPhone").val(),
            "resourceName" : $("#resourceName").val(),
            "resourceWasKind" : $("#resourceWasKind").val(),
            "resourceWasDev" : $("#resourceWasDev").val(),
            "resourceWasPrd" : $("#resourceWasPrd").val(),
            "resourceDbKind" : $("#resourceDbKind").val(),
            "resourceDbDev" : $("#resourceDbDev").val(),
            "resourceDbPrd" : $("#resourceDbPrd").val(),
            "resourceEtcKind" : $("#resourceEtcKind").val(),
            "resourceEtcDev" : $("#resourceEtcDev").val(),
            "resourceEtcPrd" : $("#resourceEtcPrd").val(),
            "resourceDetail" : $("#resourceDetail").val(),
            "useYn" : "Y"
    	};
                 // Ajax 호출
                 $.ajax({
                     url: "/eaiResources/api/create",
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
                             location.href = "/eaiResources/detail/" + response.data;
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
                <h2>EAI Resource</h2>
            </div>
            <div class="page__data-wrap">
                <div class="page__detail-util--box">
                    <a href="#" class="btn__black" onclick="resourceList()">Cancel</a>                
                    <a href="#" class="btn__white" id="resourceCreate">Save</a>
                </div>
                <div class="page__data-form">
                    <h3>1. EAI 대상 시스템 정보 - 요청자 입력사항</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col style="width:490px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:390px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th colspan="5" class="th__title">시스템</th>
                        </tr>
                        <tr>
                            <th>소속</th>
                            <td><input type="text" id="managerCompany" value=""></td>
                            <th>부서명</th>
                            <td colspan="2"><input type="text" id="managerDept" value=""></td>
                        </tr>
                        <tr>
                            <th>담당자성명</th>
                            <td><input type="text" id="managerName" value=""></td>
                            <th>전화번호</th>
                            <td colspan="2"><input type="text" id="managerPhone" value=""></td>
                        </tr>
                        <tr>
                            <th rowspan="9">시스템명</th>
                            <td rowspan="9"><input type="text" id="resourceName" value=""></td>
                            <th rowspan="3">WEB/WAS</th>
                            <th>종류</th>
                            <td><input type="text" id="resourceWasKind" value=""></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text" id="resourceWasDev" value="" ></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text" id="resourceWasPrd" value=""></td>
                        </tr>
                        <tr>
                            <th rowspan="3">DB</th>
                            <th>종류</th>
                            <td><input type="text" id="resourceDbKind" value=""></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text" id="resourceDbDev" value=""></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text" id="resourceDbPrd" value=""></td>
                        </tr>
                        <tr>
                            <th rowspan="3">기타</th>
                            <th>종류</th>
                            <td><input type="text" id="resourceEtcKind" value=""></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text" id="resourceEtcDev" value=""></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text" id="resourceEtcPrd" value=""></td>
                        </tr>
                        <tr>
                             <th>시스템 설명</th>
                             <td colspan="4"><input type="text" id="resourceDetail" value=""></td>

                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>