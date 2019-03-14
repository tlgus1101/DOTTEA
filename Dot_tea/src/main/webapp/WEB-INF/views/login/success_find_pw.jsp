<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 아이디 찾기 결과</title>
<script>
/* 	var id = ${findedId}
	if(findedId.MEM_USER_USERID == null){
		id = findedId.MEM_COM_ID
		return id
	}else{
		id = findedId.MEM_USER_USERID
		return id
	} */
</script>
</head>
<body>

	<div class="layout-bg">
		<div class="layout-wrapper">
			<div class="login_wrap_outer">

				<form id="success_find_id">
					<div
						class="xans-element- xans-member xans-member-login login_wrap ">
						<h2 class="layout-page-title">아이디 찾기</h2>
						<div class="login">
							<div>
							
							</div>
							<ul class="text">
								<li><span> 이메일이 </span></li>
							</ul>
							<ul>
								<strong>
								<font color="#4b0082"><li>
								" ${resultEmail} " 로
								</strong></li></font>
							</ul>
							<ul class="text">
								<li><span> 발송되었습니다. </span></li>
							</ul>
						</div>
						<div class="login_button">
							<ul>
								<li><a class="link" href="${pageContext.request.contextPath}/login/loginForm.tea">
								<button type="button" id="toLogin" 
									class="bhs_button">로그인 하러 가기</button></a>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script>

</script>
</body>
</html>