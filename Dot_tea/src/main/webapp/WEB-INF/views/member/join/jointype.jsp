<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<br>
	<br>
	<br>

	<div class="main">
		<div class="content">
			<div class="page_aticle">
				<div class="head_section head_join">
					<h2 class="tit">회원가입</h2>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<a href="${pageContext.request.contextPath}/join/UserJoinForm.tea">
			<img alt="개인회원가입" src="../images/userJoin.png"/>
		</a> <a
			href="${pageContext.request.contextPath}/join/companyJoinForm.tea">
			<img alt="기업회원가입" src="../images/companyJoin.png"/>
		</a>

	</center>


	<!-- <script type="text/javascript">

$(document).ready(function(){
    $("#user_join").on("click", function(e) {
    	e.preventDefault();
		go_userJoinForm();
	})
});


function go_userJoinForm() {
	
}
</script>
 -->
</body>
</html>