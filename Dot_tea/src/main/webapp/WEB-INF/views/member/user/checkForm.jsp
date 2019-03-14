<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
</head>
<body>
	<h3>비밀번호 확인</h3>

	<form name="checkform" id="checkform">
		<input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
		<a href="#this" class="btn" id="check">확인</a>
	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#check").on("click", function(e) {
				e.preventDefault();
				fn_check();
			});
		});
		
		function fn_check() {
			var comSubmit = new ComSubmit();
			var password = document.checkform.password.value;
			comSubmit.setUrl("<c:url value='/member/info.tea' />");
			comSubmit.addParam("password", password);
			comSubmit.submit();
		}
	</script>
</body>
</html>
