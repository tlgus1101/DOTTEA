<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/normalize.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section1.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section2.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/common.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/css/goods_style.css?ver=201901141354">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<div class="layout-bg">
		<div class="layout-wrapper">
			<div class="login_wrap_outer">
				<form action="${pageContext.request.contextPath}/login/login.tea"
					method="post" id="form_login">
					<div
						class="xans-element- xans-member xans-member-login login_wrap ">
						<h2 class="layout-page-title">로그인</h2>
						<div class="login">
							<div>
								<a href="#this" id="hidden_Type">&nbsp;&nbsp; </a><input
									type="radio" name="loginType" value="1" checked="checked">
								개인 아이디 &nbsp;<input type="radio" name="loginType" value="2">
								기업 아이디
							</div>
							<ul class="text">
								<li><span>아이디</span></li>
								<li><span>비밀번호</span></li>
							</ul>
							<ul>
								<li><input style="max-width: none; width: 180px"
									id="member_id" type="text" name="member_id" size="20"
									tabindex="1"></li>
								<li><input style="max-width: none; width: 180px"
									id="memeber_password" type="password" name="memeber_password"
									size="20" tabindex="2"></li>
							</ul>
							<ul class="button">
								<li class="button">
									<table>
										<tbody id="heddin_login">
										</tbody>
									</table>
								</li>
							</ul>
						</div>
					
						<div class="login_button">
							<ul>
								<li><a href="#this" name="findIdForm" id="findIdForm"><span
										class="bhs_button">아이디 찾기</span></a></li>
								<li><a href="#this" name="findPwForm" id="findPwForm"><span
										class="bhs_button">비밀번호 찾기</span></a></li>
								<li><a href="#this" id="join"><span class="bhs_button">회원가입</span></a></li>

							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var count = 0;

		$(document).ready(function() {

			first_button();
			loginfalse();

			$("#hidden_Type").on("click", function(e) {
				e.preventDefault();
				hiddenOpen();
			});

			$("#join").on("click", function(e) {
				e.preventDefault();
				joinFormOpen();
			});

			$("#findIdForm").on("click", function(e) {
				e.preventDefault();
				findIdForm();
			});
			
			$("#findPwForm").on("click", function(e) {
				e.preventDefault();
				findPwForm();
			});

		});
		
		
		function findIdForm() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/findIdForm.tea'/>");
			comSubmit.submit();
		}
		
		function findPwForm() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/findPwForm.tea'/>");
			comSubmit.submit();
		}

		
		function loginfalse() {
			var loginfalse=<c:out value="${loginfalse}"/>+"";
			if(loginfalse=="1"){
				alert("아이디 혹은 비밀번호가 없습니다.");
			}
		}

		function joinFormOpen() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/join/jointype.tea'/>");
			comSubmit.submit();
		}

		function first_button() {
			var body = $("table>tbody");
			body.empty();

			var str = "<input type='submit' value='회원 &nbsp; 로그인' class='bhs_button'"+
					"style='width: auto; padding: 20px 20px; height: 86px' tabindex='4'>"
			body.append(str);
		}

		function hiddenOpen() {
			count++;
			var body = $("table>tbody");
			body.empty();

			if (count % 5 == 0) {
				var form_login = document.getElementById("form_login");
				form_login.action = "loginAdmin.tea";
				var str = "<input type='submit' value='관리자 로그인' class='bhs_button'"
			+"style='width: auto; padding: 20px 20px; height: 86px' tabindex='4'>"
				body.append(str);
			} else {
				first_button();
				var form_login = document.getElementById("form_login");
				form_login.action = "login.tea";
			}

		}
	</script>
</body>
</html>