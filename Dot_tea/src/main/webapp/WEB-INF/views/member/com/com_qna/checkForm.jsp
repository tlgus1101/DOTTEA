<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
	$(window).scroll(function() {
		$('#banner').animate({
			top : $(window).scrollTop() + "px"
		}, {
			queue : false,
			duration : 500
		});
	});
</script>
</head>
<body>

	<br>
	<br>
	<div class="head_aticle">
		<br> <br> <br>
		<h2 class="tit" align="center">비밀번호 확인</h2>
		<br> <br> <br>
	</div>
	<form id="frm" name="frm">
		<table class="board_list">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>

			<tbody>
				<tr>
				<tr>

					<th style="background-color: #eee9f1; color: #532074;">비밀번호</th>
					<td><input type="password" id="QA_PASSWORD" name="QA_PASSWORD"
						class="wdp_90"></input></td>

				</tr>

			</tbody>
		</table>

		<br /> <br /> <a href="#this" class="bhs_button active" id="write">확인</a>

	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});

		function fn_insertBoard() {
			var QA_NO = "${map.QA_NO}";
			var QA_PASS = "${map.QA_PASSWORD}"
			var QA_PASSC = $("#QA_PASSWORD").val();
			var comSubmit = new ComSubmit("frm");

			if (QA_PASS != QA_PASSC) {
				alert("비밀번호 틀림");
			} else {
				comSubmit
						.setUrl("<c:url value='/com_qna/checkPassword.tea' />");
				comSubmit.addParam("QA_NO", QA_NO);
				comSubmit.submit();
			}
		}
	</script>
</body>
</html>