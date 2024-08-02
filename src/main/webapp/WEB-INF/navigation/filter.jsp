<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="div_search_date">
	<div class="div_search_btn">
		<div class="div_icon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
		<div class="search_date_control">
			<input class="search_date_input" type="text" value="${resMap.searchVO.start_dtm}" id="filter_start_dtm" readonly/> ~
			<input class="search_date_input" type="text" value="${resMap.searchVO.end_dtm}" id="filter_end_dtm" readonly/>
		</div>
	</div>
</div>
<div class="div_dropdown">
	<button class="drop_btn"> 
		<div class="dropbtn_icon"><i class="fa fa-list" aria-hidden="true"></i></div>
		<div class="dropbtn_text">${resMap.searchVO.recordSize}개</div>
	</button>
	<div class="dropdown_content">
		<a href="javascript:filterSearch('15')">15개</a>
		<a href="javascript:filterSearch('50')">50개</a>
		<a href="javascript:filterSearch('100')">100개</a>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){

		var filteredStartDtm = "${resMap.searchVO.start_dtm}";
		var filteredEndDtm = "${resMap.searchVO.end_dtm}";

		var isStartDtmPicked = !StringUtil.isEmpty(filteredStartDtm) ? true : false;
		var isEndDtmPicked = !StringUtil.isEmpty(filteredEndDtm) ? true : false;
		
		
		if(isStartDtmPicked && isEndDtmPicked){
			$('.search_date_control').css('display', 'block');
		}
		
		var picker_start_dtm = new Pikaday({
			field: $('#filter_start_dtm')[0], 
			onSelect: function(date) {
				$('#start_dtm').val(this.getMoment().format('YYYY-MM-DD'));
				isStartDtmPicked = true;
				
				if(isStartDtmPicked && isEndDtmPicked){
					search('1');
				}
		    }
		});
		
		var picker_end_dtm = new Pikaday({  
			field: $('#filter_end_dtm')[0],
			onSelect: function(date) {
				$('#end_dtm').val(this.getMoment().format('YYYY-MM-DD'));
				isEndDtmPicked = true;
				
				if(isStartDtmPicked && isEndDtmPicked){
					search('1');
				}
		    }
		});
		
		$('.div_search_btn').on('click', function(){
			$('.search_date_control').css('display', 'block');
		});
		
		$('.div_dropdown').on('click', function(){
			$('.dropdown_content').css('display', 'block');
		});
	});
	
	var filterSearch = function(_recordSize){
		var recordSize = StringUtil.number.stringToNumber( _recordSize );
		$('#recordSize').val(recordSize);
		search('1');
	}
	
</script>