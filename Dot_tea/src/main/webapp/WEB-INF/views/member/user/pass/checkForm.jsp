<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/include/include-header.jspf"%> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true);
	String id = request.getParameter("id");
	request.getSession().setAttribute("id", id);
%>
</head>
<body>
	<center>
		<img src="${pageContext.request.contextPath}/images/DOTTEALogo.png"
			width="500" height="105" />
	</center>
	<div class="page_section section_myinfo">
		<br> <br> <br>
		<div class="head_aticle">
			<c:if test="${typeSession ==1 }">
				<h2 class="tit" align="center">개인 정보 수정</h2>
			</c:if>
			<c:if test="${typeSession ==2 }">
				<h2 class="tit" align="center">기업 정보 수정</h2>
			</c:if>
		</div>
		<div class="conf_pw">
			<form name="checkform" id="checkform">
				<div class="tit">
					<img
						src="${pageContext.request.contextPath}/images/checkPwUser.PNG">
				</div>
				<div class="field_pw">
					<div class="tit_pw">비밀번호</div>
					<div>
						<input type="password" name="password" id="password"
							class="inp_pw" placeholder="●●●●●●●●●">
					</div>
				</div>
				<div class="group_btn">
					<span class="inner_groupbtn"> <a href="#this"
						class="btn btn_positive" id="check"> 확인 </a>
					</span>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#check").on("click", function(e) {
				e.preventDefault();
				if ("${typeSession}" == 1)
					fn_check();
				else {
					fn_Com_check();
				}
			});
		});

		function fn_check() {
			var comSubmit = new ComSubmit();
			var password = document.checkform.password.value;
			if (window.opener && !window.opener.closed)
				comSubmit.setUrl("<c:url value='/member/info.tea' />");
			comSubmit.addParam("password", password);
			comSubmit.submit();
		}

		function fn_Com_check() {
			var comSubmit = new ComSubmit();
			var password = document.checkform.password.value;
			comSubmit
					.setUrl("<c:url value='/com_setting/ck_Com_Password.tea' />");
			comSubmit.addParam("password", password);
			comSubmit.submit();
		}
	</script>
</body>
</html>
