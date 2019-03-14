<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>아이디 찾기</title>
</head>
<body>
	<!-- <div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form id="form" action="findId.tea" name=""
				method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<ul>

					<li></li>
				</ul>
			</form>
		</div>
	</div> -->

	<div class="layout-bg">
		<div class="layout-wrapper">
			<div class="login_wrap_outer">

				<form action="findId.tea" method="post" id="form_findId">
					<div
						class="xans-element- xans-member xans-member-login login_wrap ">
						<h2 class="layout-page-title">아이디 찾기</h2>
						<div class="login">
							<div>
								<input type="radio" name="memberType" value="1" checked="checked">
								개인 아이디 &nbsp;<input type="radio" name="memberType" value="2">
								기업 아이디
							</div>
							<ul class="text">
								<li></li>
								<li><span>Email</span></li>
							</ul>
							<ul>
								<li></li>
								<li><input style="max-width: none; width: 380px"
									type="text" tabindex="1" id="member_email"
									name="member_email" size="100" required
									placeholder="예: teamarket@teamarket.tea"></li>
							</ul>
						</div>
						<div class="login_button">
							<ul>
								<li><button type="submit" id="findBtn" 
										class="bhs_button">찾기</button>
								</li>
								<li>
									<button type="button" onclick="history.go(-1);"
										class="bhs_button">취소</button>
								</li>
							</ul>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).ready(function(e) {
				fn_alertF();
			});
	 		
	 		function fn_alertF() {
				var NoOne = <c:out value="${NoOne}"/>;
				if(NoOne == 1){
					alert("가입 정보가 없습니다.");
				}
			}

		function find_id(inputEmail) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/login/findId.tea'/>");
			comAjax.setCallback("find_id_Callback");
			comAjax.addParam("inputEmail", inputEmail);
			comAjax.ajax();
		}

		function ck_Email_Callback(data) {
			if (data == null) {
				alert("이메일을 입력해 주세요.");
			} else {
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if (exptext
						.test(document.MemberUserJoin.MEM_USER_USEREMAIL.value) == false) {
					alert("이메일 형식이 올바르지 않습니다.");
				}
			}
		}
	</script>
</body>