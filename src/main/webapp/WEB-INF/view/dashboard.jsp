<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>eai-work dashboard</title>
	
	<!-- meta tag -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- style -->
	<link rel="stylesheet" href="/css/index.css"></link>

	<!-- lib -->
	<script src="/lib/jquery-3.7.1/jquery-3.7.1.js"></script>
	<script src="/lib/jquery-modal-0.9.1/jquery.modal.min.js"></script>

	<!-- common javascript -->
	<script src="/js/StringUtil.js"></script>
	<script src="/js/CommonUtil.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
		})
		
		function fn_init(){
			
			CommonUtil.api.ajaxPost("/getDashBoardList", {}, function(res){
				console.log(res);		
				console.log(res.data.list);	
			})
		}
	</script>
</head>
<body>
	<h1>eai-work dashboard</h1>
	
</body>
</html>