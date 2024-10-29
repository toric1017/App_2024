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
                <h2>EAI Log</h2>
                <div class="search__item-wrap">
                    <span class="search__item-date important">
                        <label for="inpPeriod">기간 날짜</label>
                        <input type="date" id="inpPeriod" placeholder="날짜를 입력해주세요">
                        <input type="date" id="inpPeriod" placeholder="날짜를 입력해주세요">
                    </span>
                    <span class="search__item-text">
                        <input type="text" placeholder="검색어를 입력해주세요">
                    </span>
                    <button type="button" class="btn__search">
                        <svg enable-background="new 0 0 70 70" height="70px" id="Icons" version="1.1" viewBox="0 0 70 70" width="70px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M51.957,49.129l-8.713-8.713c1.75-2.337,2.799-5.229,2.799-8.373c0-7.732-6.268-14-14-14s-14,6.268-14,14s6.268,14,14,14  c3.144,0,6.036-1.049,8.373-2.799l8.713,8.713L51.957,49.129z M22.043,32.043c0-5.514,4.486-10,10-10c5.514,0,10,4.486,10,10  c0,5.514-4.486,10-10,10C26.529,42.043,22.043,37.557,22.043,32.043z"/></svg>
                    </button>
                </div>
            </div>
            <div class="page__data-wrap">
                <p class="page__data-cnt">Total : 3 items</p>
                <div class="page__data-list">
                    <table>
                        <colgroup>
                            <col style="width:50px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th>No.</th>
                            <th>ID</th>
                            <th>Request_System</th>
                            <th>Response_Code</th>
                            <th>Response_Message</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                            <td>내용입력</td>
                        </tr>
                    </table>
                    <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo; 처음</a></li>
                        <li><a href="#">1</a></li>
                        <li class="active"><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo; 끝</a></li>
                    </ul>
                </div>
            </div>
            
        </div>
    </div>
</div>