<%@page import="com.eai_work.common.util.SessionEnum"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String auth = (String)session.getAttribute( String.valueOf( SessionEnum.SESSION_USER_AUTH ) );
%>

<div class="sidenav">
		<!-- <img class="logoIntro" src="/img/logo_intro.png" /> -->
		<div class="div-side-row">
			<a href="/DashBoard"></a>
			<div class="div-icon"><i class="fa fa-tachometer" aria-hidden="true"></i></div>
			<div class="div-link">��ú���</div>
		</div>
		<div class="div-side-row">
			<a href=""></a>
			<div class="div-icon"><i class="fa fa-info" aria-hidden="true"></i></div>
			<div class="div-link">��ġ ����</div>
		</div>
		<%
			if("admin".equals(auth)){
		%>
		<div class="div-side-row">
			<a href=""></a>
			<div class="div-icon"><i class="fa fa-cog" aria-hidden="true"></i></div>
			<div class="div-link">�����ڱ��</div>
		</div>
		<%
			}
		%> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var currentUrl = $(location).attr('pathname');
		
		$(".div-side-row").each(function(i, current){
			if(StringUtil.isEquals(currentUrl, $(current).find('a').attr('href'))){
				$(current).addClass("active");
			}
		});
		
	})
	
	var logout = function(){
		if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")){
			location.replace("/index");
		}
	}
</script>