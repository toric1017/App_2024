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
                <h2>EAI Interface</h2>
            </div>
            <div class="page__data-wrap">
                <div class="page__detail-util--box">
                    <a href="#" class="btn__black">Cancel</a>
                    <a href="#" class="btn__white">Save</a>
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
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>항목명</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>업무분류</th>
                            <td>
                                <select>
                                    <option value="">선택하세요</option>
                                    <option value="">업무분류 1</option>
                                    <option value="">업무분류 2</option>
                                    <option value="">업무분류 3</option>
                                    <option value="">업무분류 4</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>개요</th>
                            <td><textarea></textarea></td>
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
                            <td><input type="text"></td>
                            <th>시스템명</th>
                            <td><input type="text"></td>
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
                            <td><input type="text"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text"></td>
                            <th>Adaptor</th>
                            <td><input type="text"></td>
                            <th colspan="2">인터페이스 방식</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>RFC</th>
                            <td colspan="4"><input type="text"></td>
                            <th>RFC</th>
                            <td colspan="4"><input type="text"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">DB</th>
                            <td><input type="text"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input type="text"></td>
                            <th rowspan="2">DB</th>
                            <td><input type="text"></td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td><input type="text"></td>
                            <th>운영</th>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <th>운영</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text"></td>
                            <th>API(채널명)</th>
                            <td colspan="4"><input type="text"></td>
                        </tr>                        
                        <tr>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text"></td>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3"><input type="text"></td>
                        </tr>                        
                        <tr>
                            <th>Operation</th>
                            <td colspan="3"><input type="text"></td>
                            <th>Operation</th>
                            <td colspan="3"><input type="text"></td>
                        </tr>
                        <tr>
                            <th colspan="10" class="th__title">인터페이스 속성</th>
                        </tr>
                        <tr>
                            <th>실시간 여부</th>
                            <td><input type="text"></td>
                            <th colspan="2">동기/비동기</th>
                            <td><input type="text"></td>
                            <th>발생주기(상세)</th>
                            <td><input type="text"></td>
                            <th colspan="2">예상 발생건수(1회)</th>
                            <td><input type="text"></td>
                        </tr>                        
                        <tr>
                            <th>Event 발생</th>
                            <td><input type="text"></td>
                            <th colspan="2">프로시저 호출여부</th>
                            <td><input type="text"></td>
                            <th>사용 유무</th>
                            <td><input type="text"></td>
                            <th colspan="2"></th>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>