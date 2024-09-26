<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function(){
		fn_init();
	})
	
	function fn_init(){

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
                    <a href="#" class="btn__black">Cancel</a>
                    <a href="#" class="btn__white">Save</a>
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
                            <td><input type="text" value="디아이웨어"></td>
                            <th>부서명</th>
                            <td colspan="2"><input type="text" value="식품바이오팀"></td>
                        </tr>                        
                        <tr>
                            <th>담당자성명</th>
                            <td><input type="text" value="OOO님"></td>
                            <th>전화번호</th>
                            <td colspan="2"><input type="text" value="000-000-0000"></td>
                        </tr>
                        <tr>
                            <th rowspan="9">시스템명</th>
                            <td rowspan="9"><input type="text"></td>
                            <th rowspan="3">WEB/WAS</th>
                            <th>종류</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th rowspan="3">DB</th>
                            <th>종류</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text"></td>
                        </tr>                        
                        <tr>
                            <th rowspan="3">기타</th>
                            <th>종류</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td><input type="text"></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>