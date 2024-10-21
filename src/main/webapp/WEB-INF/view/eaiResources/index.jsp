<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<script type="text/javascript">
	$(document).ready(function(){

        $("#search_btn").bind("click", function(){
            searchBtn();
        });
	})

	// 각 행 클릭 시 링크로 이동
    function goToDetailPage(resourceSeq) {
        window.location.href = "/eaiResources/detail/" + resourceSeq;
    }

    var searchBtn = function(){
    	var searchVal = $("#searchVal").val();
    	location.href = "/eaiResources/index?searchVal=" + encodeURIComponent(searchVal);
    }

</script>
<div class="card">
	<div class="container">
            <div class="page__util-box">
                <!-- 페이지 타이틀 -->
                <h2>EAI Resource</h2>
                <div class="search__item-wrap">
                    <span class="search__item-text">
                        <input type="text" placeholder="검색어를 입력해주세요" id="searchVal" value="${param.searchVal}">
                    </span>
                    <button type="button" class="btn__search" id="search_btn">
                        <svg enable-background="new 0 0 70 70" height="70px" id="Icons" version="1.1" viewBox="0 0 70 70" width="70px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M51.957,49.129l-8.713-8.713c1.75-2.337,2.799-5.229,2.799-8.373c0-7.732-6.268-14-14-14s-14,6.268-14,14s6.268,14,14,14  c3.144,0,6.036-1.049,8.373-2.799l8.713,8.713L51.957,49.129z M22.043,32.043c0-5.514,4.486-10,10-10c5.514,0,10,4.486,10,10  c0,5.514-4.486,10-10,10C26.529,42.043,22.043,37.557,22.043,32.043z"/></svg>
                    </button>
                </div>
            </div>
            <div class="page__data-wrap">
                <div class="page__data-util--box">
                    <p class="page__data-cnt">Total : ${eaiResources.totalElements} items</p>
					<div class="btn_group">
						<a href="/eaiResources/create" class="btn__white">NEW</a>
					</div>
                </div>
                <div class="page__data-list">
                    <table>
                        <colgroup>
                            <col style="width:50px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col style="width:200px;">
                            <col>
                        </colgroup>
                        <tr>
                            <th>No.</th>
                            <th>시스템명</th>
                            <th>소속</th>
                            <th>부서명</th>
                            <th>담당자</th>
                            <th>전화번호</th>
                        </tr>
                        <c:forEach items="${eaiResources.content}" var="resource" varStatus="status">
                         <tr onclick="goToDetailPage(${resource.resourceSeq})" style="cursor: pointer;" >
                             <td>${eaiResources.number * eaiResources.size + status.index + 1}</td>
                             <td>${resource.resourceName}</td>
                             <td>${resource.managerCompany}</td>
                             <td>${resource.managerDept}</td>
                             <td>${resource.managerName}</td>
                             <td>${resource.managerPhone}</td>
                        </tr>
                        </c:forEach>
                    </table>

                    <ul class="pagination">
                    <!-- 처음 페이지 링크 -->
                    <c:choose>
                        <c:when test="${eaiResources.first}">
                            <li class="disabled"><a href="#">&laquo; 처음</a></li> <!-- 첫 페이지일 때 비활성화 -->
                        </c:when>
                        <c:otherwise>
                            <li><a href="?page=0">&laquo; 처음</a></li> <!-- 첫 페이지로 이동 -->
                        </c:otherwise>
                    </c:choose>

                    <!-- 페이지 번호 반복 -->
                    <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
                        <c:choose>
                            <c:when test="${i-1 eq eaiResources.number}">
                                <li class="active"><a href="?page=${i-1}">${i}</a></li> <!-- 현재 페이지 활성화 -->
                            </c:when>
                            <c:otherwise>
                                <li><a href="?page=${i-1}">${i}</a></li> <!-- 다른 페이지로 이동 -->
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- 끝 페이지 링크 -->
                    <c:choose>
                        <c:when test="${eaiResources.last}">
                            <li class="disabled"><a href="#">끝 &raquo; </a></li> <!-- 마지막 페이지일 때 비활성화 -->
                        </c:when>
                        <c:otherwise>
                            <li><a href="?page=${eaiResources.totalPages - 1}">끝 &raquo; </a></li> <!-- 마지막 페이지로 이동 -->
                        </c:otherwise>
                    </c:choose>

                    </ul>

                </div>
            </div>
            
        </div>
    </div>
</div>