<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function(){
        $("#resourceList").bind("click", function(){
            resourceList();
        });

        $("#resourceDel").bind("click", function(){
            resourceDel();
        });
	})

	var resourceList = function(){
	     location.href = "/eaiResources/index";
    }

    var resourceDel = function(){


                 // Ajax 호출
                 $.ajax({
                     url: "/eaiResources/api/delete/"+${eaiResources.resourceSeq},
                     type: "PUT",
                     headers : {
							"Content-Type" : "application/json; charset=utf-8",
							"Authorization" : CommonUtil.session.apiKey
						},
                     dataType: "json",
                     success: function(response) {
                         if (response.status === 200) {
                             // 등록 성공 시, 반환된 resourceSeq 값으로 상세 페이지로 리다이렉트
                             console.log("Success callback called", response);
                             alert("삭제 되었습니다.");
                             location.href = "/eaiResources/index";
                         } else {
                             alert("삭제 처리 중 오류가 발생했습니다.");
                         }
                     },
                     error: function(xhr, status, error) {
                         console.error("Ajax 오류: ", xhr.responseText);
                         alert("삭제 처리 중 오류가 발생했습니다.");
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
                    <a href="#" class="btn__white" onclick="resourceList()">list</a>
                    <a href="/eaiResources/updateForm/${eaiResources.resourceSeq}" class="btn__white">Edit</a>
                    <a href="#" id="btn-delete" class="btn__white" onclick="resourceDel()">Del</a>
                </div>
                <div class="page__data-detail">
                    <h3>1. EAI 대상 시스템 정보</h3>
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
                            <td>${eaiResources.managerCompany}</td>
                            <th>부서명</th>
                            <td colspan="2">${eaiResources.managerDept}</td>
                        </tr>
                        <tr>
                            <th>담당자성명</th>
                            <td>${eaiResources.managerName}</td>
                            <th>전화번호</th>
                            <td colspan="2">${eaiResources.managerPhone}</td>
                        </tr>
                        <tr>
                            <th rowspan="9">시스템명</th>
                            <td rowspan="9">${eaiResources.resourceName}</td>
                            <th rowspan="3">WEB/WAS</th>
                            <th>종류</th>
                            <td>${eaiResources.resourceWasKind}</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>${eaiResources.resourceWasDev}</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>${eaiResources.resourceWasPrd}</td>
                        </tr>
                        <tr>
                            <th rowspan="3">DB</th>
                            <th>종류</th>
                            <td>${eaiResources.resourceDbKind}</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>${eaiResources.resourceDbDev}</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>${eaiResources.resourceDbPrd}</td>
                        </tr>
                        <tr>
                            <th rowspan="3">기타</th>
                            <th>종류</th>
                            <td>${eaiResources.resourceEtcKind}</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>${eaiResources.resourceEtcDev}</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>${eaiResources.resourceEtcPrd}</td>
                        </tr>
                        <tr>
                            <th>시스템설명</th>
                            <td colspan="4">${eaiResources.resourceDetail}</td>

                        </tr>
                    </table>
                </div>
                </div>
            </div>
            
        </div>
    </div>
</div>