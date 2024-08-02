<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pagination">
	<c:if test="${resMap.searchVO.totalCount gt 0}">
		<a href="javascript:search('endPrev')">&laquo;</a>
		<a href="javascript:search('prev')">&lsaquo;</a>
	  	<c:forEach begin="${resMap.searchVO.pageButtonStart}" end="${resMap.searchVO.pageButtonEnd}" var="i">
	  		<c:choose>
				<c:when test="${i eq resMap.searchVO.page}">
					<a class="active" href="javascript:search('${i}')">${i}</a> 
				</c:when> 
				<c:otherwise>
					<a href="javascript:search('${i}')">${i}</a>
				</c:otherwise>
			</c:choose>
	  	</c:forEach>
	  	<a href="javascript:search('next')">&rsaquo;</a>
	  	<a href="javascript:search('endNext')">&raquo;</a>
	</c:if>
</div>

<form method="POST">
	<input type="hidden" name="api_id" id="job_id" value="${resMap.searchVO.api_id}" />
	<input type="hidden" name="api_meg" id="job_meg" value="${resMap.searchVO.api_meg}" />
	<input type="hidden" name="job_id" id="job_id" value="${resMap.searchVO.job_id}" />
	<input type="hidden" name="job_meg" id="job_meg" value="${resMap.searchVO.job_meg}" />
	<input type="hidden" name="start_dtm" id="start_dtm" value="${resMap.searchVO.start_dtm}" />
	<input type="hidden" name="end_dtm" id="end_dtm" value="${resMap.searchVO.end_dtm}" />
	
	<input type="hidden" name="page" id="page" value="${resMap.searchVO.page}" />
	<input type="hidden" name="recordSize" id="recordSize" value="${resMap.searchVO.recordSize}" />
	<input type="hidden" name="pageButtons" id="pageButtons" value="${resMap.searchVO.pageButtons}" />
	<input type="hidden" name="pageButtonStart" id="pageButtonStart" value="${resMap.searchVO.pageButtonStart}" />
	<input type="hidden" name="pageButtonEnd" id="pageButtonEnd" value="${resMap.searchVO.pageButtonEnd}" /> 
	<input type="hidden" name="totalPage" id="totalPage" value="${resMap.searchVO.totalPage}" />
	<input type="hidden" name="totalCount" id="totalCount" value="${resMap.searchVO.totalCount}" />
	<input type="hidden" name="isPrevPage" id="isPrevPage" value="${resMap.searchVO.isPrevPage}" />
	<input type="hidden" name="isNextPage" id="isNextPage" value="${resMap.searchVO.isNextPage}" />
	<input type="submit" id="paginationForm" style="display: none"/>
</form>

<script type="text/javascript">
	$(document).ready(function(){
		
	});
	
	var search = function(key){
		 
		var page = StringUtil.number.stringToNumber( $("#page").val() );
		var isPrevPage = $("#isPrevPage").val();
		var isNextPage = $("#isNextPage").val();
		var totalPage = StringUtil.number.stringToNumber( $("#totalPage").val() );
		
		switch(key){
			case 'endPrev' :
				if(isPrevPage == 'true'){
					$("#page").val('1');
					$("#paginationForm").trigger('click');
				}
				break;
			case 'prev' :
				if(isPrevPage == 'true'){
					page -= 1;
					$("#page").val(page);
					$("#paginationForm").trigger('click');
				}
				break;
			case 'next' :
				if(isNextPage == 'true'){
					page += 1; 
					$("#page").val(page);
					$("#paginationForm").trigger('click');
				}
				break;
			case 'endNext' :
				if(isNextPage == 'true'){
					$("#page").val(totalPage);
					$("#paginationForm").trigger('click');
				}
				break;
			case '1' :
				$("#page").val(key);
				$("#paginationForm").trigger('click');
				break;
			default : 
				if(page != key){
					$("#page").val(key);
					$("#paginationForm").trigger('click');
				}
				break;
		}
	}
</script>