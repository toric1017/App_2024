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
                    <a href="#" class="btn__black">Mapping</a>
                    <a href="#" class="btn__white">Edit</a>
                </div>
                <div class="page__data-detail">
                    <h3>1. 인터페이스 개요 - 요청자 입력사항</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th>ID</th>
                            <td>MxTTR_TOT_REQ_H</td>
                        </tr>
                        <tr>
                            <th>항목명</th>
                            <td>통합의뢰 상태 변경 이력 인터페이스(PLM &gt; QMS)</td>
                        </tr>
                        <tr>
                            <th>업무분류</th>
                            <td>CJ_QMS</td>
                        </tr>
                        <tr>
                            <th>개요</th>
                            <td>CJ_QMS 요청으로 PLM에서 통합의뢰 상태 변경 이력을 QMS로 전송함</td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-detail">
                    <h3>2. EAI대상 시스템 정보</h3>
                    <table>                        
                        <colgroup>
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col style="width:160px;">
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col style="width:160px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th colspan="5" class="th__title">요청시스템</th>
                            <th colspan="5" class="th__title">응답시스템</th>
                        </tr>
                        <tr>
                            <th>소속</th>
                            <td>CJ올리브네트웍스</td>
                            <th>부서명</th>
                            <td colspan="2">제일제당팀</td>
                            <th>소속</th>
                            <td>CJ올리브네트웍스</td>
                            <th>부서명</th>
                            <td colspan="2">제일제당팀</td>
                        </tr>                        
                        <tr>
                            <th>담당자성명</th>
                            <td>OOO님</td>
                            <th>전화번호</th>
                            <td colspan="2">000-000-0000</td>
                            <th>담당자성명</th>
                            <td>OOO님</td>
                            <th>전화번호</th>
                            <td colspan="2">000-000-0000</td>
                        </tr>
                        <tr>
                            <th rowspan="9">시스템명</th>
                            <td rowspan="9">CJ_QMS</td>
                            <th rowspan="3">WEB/WAS</th>
                            <th>종류</th>
                            <td>-</td>
                            <th rowspan="9">시스템명</th>
                            <td rowspan="9">CJ_PLM</td>
                            <th rowspan="3">WEB/WAS</th>
                            <th>종류</th>
                            <td>-</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>-</td>
                            <th>개발</th>
                            <td>-</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>-</td>
                            <th>운영</th>
                            <td>-</td>
                        </tr>                        
                        <tr>
                            <th rowspan="3">DB</th>
                            <th>종류</th>
                            <td>Tibero</td>
                            <th rowspan="3">DB</th>
                            <th>종류</th>
                            <td>Oracle</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>52.2.205.200:9029:CJQMSDEV</td>
                            <th>개발</th>
                            <td>10.64.2.114:1531:RNDPLMDEV</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>52.2.205.217:8629:CJQMS</td>
                            <th>운영</th>
                            <td>10.64.2.107:1531:RNDPLM</td>
                        </tr>                        
                        <tr>
                            <th rowspan="3">기타</th>
                            <th>종류</th>
                            <td>-</td>
                            <th rowspan="3">기타</th>
                            <th>종류</th>
                            <td>-</td>
                        </tr>
                        <tr>
                            <th>개발</th>
                            <td>-</td>
                            <th>개발</th>
                            <td>-</td>
                        </tr>
                        <tr>
                            <th>운영</th>
                            <td>-</td>
                            <th>운영</th>
                            <td>-</td>
                        </tr>
                    </table>
                </div>
                <div class="page__data-detail">
                    <h3>3. 인터페이스 상세</h3>
                    <table>
                        <colgroup>
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col style="width:160px;">
                            <col style="width:150px;">
                            <col style="width:150px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                            <col style="width:160px;">
                        </colgroup>
                        <tr>
                            <th colspan="5" class="th__title">요청시스템</th>
                            <th colspan="5" class="th__title">응답시스템</th>
                        </tr>
                        <tr>
                            <th>Adaptor</th>
                            <td>API(MOM)/DB</td>
                            <th colspan="2">인터페이스 방식</th>
                            <td>요청/데이터수신</td>
                            <th>Adaptor</th>
                            <td>DB</td>
                            <th colspan="2">인터페이스 방식</th>
                            <td>데이터송신</td>
                        </tr>
                        <tr>
                            <th>RFC</th>
                            <td colspan="4"></td>
                            <th>RFC</th>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">DB</th>
                            <td>IFGIF_REQ_STATUS_INFO</td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td>neai_inf</td>
                            <th rowspan="2">DB</th>
                            <td>TTR_TOT_REQ_H</td>
                            <th rowspan="2">User/Pass</th>
                            <th>개발</th>
                            <td>IF_EAI</td>
                        </tr>
                        <tr>
                            <td>프로시저명</td>
                            <th>운영</th>
                            <td>neai_inf</td>
                            <td>프로시저명</td>
                            <th>운영</th>
                            <td>IF_EAI</td>
                        </tr>
                        <tr>
                            <th>API(채널명)</th>
                            <td colspan="4">/CJ_QMS/MxTTR_TOT_REQ_H</td>
                            <th>API(채널명)</th>
                            <td colspan="4">-</td>
                        </tr>                        
                        <tr>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3">-</td>
                            <th rowspan="2">WebService</th>
                            <th>Address(WSDL)</th>
                            <td colspan="3">-</td>
                        </tr>                        
                        <tr>
                            <th>Operation</th>
                            <td colspan="3">-</td>
                            <th>Operation</th>
                            <td colspan="3">-</td>
                        </tr>
                        <tr>
                            <th colspan="10" class="th__title">인터페이스 속성</th>
                        </tr>
                        <tr>
                            <th>실시간 여부</th>
                            <td>N</td>
                            <th colspan="2">동기/비동기</th>
                            <td>Sync</td>
                            <th>발생주기(상세)</th>
                            <td>일 8회(4시간 주기)</td>
                            <th colspan="2">예상 발생건수(1회)</th>
                            <td>100건 이하</td>
                        </tr>                        
                        <tr>
                            <th>Event 발생</th>
                            <td>요청시스템</td>
                            <th colspan="2">프로시저 호출여부</th>
                            <td>N</td>
                            <th>사용 유무</th>
                            <td>활성화</td>
                            <th colspan="2"></th>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>