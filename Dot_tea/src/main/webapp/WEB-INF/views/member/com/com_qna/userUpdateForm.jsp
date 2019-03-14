<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보수정</title>
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
		<h2 class="tit" align="center">QnA 수정</h2>
	</div>
	<br>
	<form id="frm" enctype="multipart/form-data" method="post">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="25%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074;">글
						번호</th>
					<td colspan="3">${map.QA_NO }<input type="hidden" id="QA_NO"
						name="QA_NO" value="${map.QA_NO }">
					</td>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074;">제
						목</th>
					<td><input type="text" id="QA_SUBJECT" name="QA_SUBJECT"
						class="wdp_90" value="${map.QA_SUBJECT }" />
					<th scope="row" style="background-color: #eee9f1; color: #532074;">패스워드</th>
					<td><input type="password" id="QA_PASSWORD" name="QA_PASSWORD" /></td>
					</td>
				</tr>

				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="QA_CONTENT" name="QA_CONTENT">${map.QA_CONTENT }</textarea>
					</td>
				</tr>


			</tbody>
		</table>
	</form>
	<br />
	<br />
	<a href="#this" class="bhs_button active" id="list">목록으로</a>
	<a href="#this" class="bhs_button active" id="update">저장하기</a>


	<%@ include file="/WEB-INF/include/include-body2.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});

			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/openBoardList.tea' />");
			comSubmit.submit();
		}

		function fn_updateBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/com_qna/QnAupdateBoard.tea' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>