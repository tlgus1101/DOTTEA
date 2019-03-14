<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>

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
	<div class="page_section section_myinfo">
		<br> <br>

		<div class="head_aticle">
			<br> <br> <br>
			<h2 class="tit" align="center">Q/A 상세보기</h2>
			<br> <br> <br>
		</div>
		<form id="frm" name="frm">
			<table class="board_list">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" style="background-color: #eee9f1; color: #532074">글
							번호</th>
						<td>${map.QA_NO }<input type="hidden" id="QA_NO" name="QA_NO"
							value="${map.QA_NO }"></td>
						<th scope="row" style="background-color: #eee9f1; color: #532074">작성자</th>
						<td>${map.MEM_USER_USERID }</td>
					</tr>
					<tr>
						<th scope="row" style="background-color: #eee9f1; color: #532074">조회수</th>
						<td>${map.QA_COUNT }</td>
						<th scope="row" style="background-color: #eee9f1; color: #532074">날
							짜</th>
						<td>${map.QA_DATE }</td>
					</tr>
					<tr>
						<th scope="row" style="background-color: #eee9f1; color: #532074">제목</th>
						<td colspan="3">${map.QA_SUBJECT }</td>
					</tr>
					<tr>
						<td colspan="4">${map.QA_CONTENT }</td>
					</tr>

				</tbody>
			</table>


			<a href="#this" class="bhs_button active" id="list">목록으로</a>
			<c:if test="${typeSession == 2}">
				<a href="#this" class="bhs_button active" id="update">답변쓰기</a>
			</c:if>
			<c:if test="${map.QA_TYPE != 2 }">
				<a href="#this" class="bhs_button active" id="update2">수정하기</a>
				<a href="#this" class="bhs_button active" id="delete">삭제하기</a>
			</c:if>


			<%@ include file="/WEB-INF/include/include-body.jspf"%>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#list").on("click", function(e) { //목록으로 버튼
						e.preventDefault();
						fn_openBoardList();
					});

					$("#update").on("click", function(e) { //답변하기 버튼
						e.preventDefault();
						fn_openBoardUpdate();
					});
					$("#update2").on("click", function(e) {
						e.preventDefault();
						fn_openBoardUpdate2();
					});

					$("#delete").on("click", function(e) { //삭제하기 버튼
						e.preventDefault();
						fn_deleteBoard();
					});
				});

				function fn_openBoardList() {
					var comSubmit = new ComSubmit();
					comSubmit
							.setUrl("<c:url value='/com_qna/openBoardList.tea' />");
					comSubmit.submit();
				}

				function fn_openBoardUpdate() {
					var QA_NO = "${map.QA_NO}";
					var DEAL_NO = "${map.DEAL_NO}";
					var QA_REF = "${map.QA_REF}";
					var QA_STEP = "${map.QA_STEP}";
					var comSubmit = new ComSubmit();
					comSubmit
							.setUrl("<c:url value='/com_qna/openBoardWrite.tea' />");
					comSubmit.addParam("QA_NO", QA_NO);
					comSubmit.addParam("DEAL_NO", DEAL_NO);
					comSubmit.addParam("QA_REF", QA_REF);
					comSubmit.addParam("QA_STEP", QA_STEP);
					comSubmit.submit();
				}
				function fn_openBoardUpdate2() {
					var QA_NO = "${map.QA_NO}";
					var comSubmit = new ComSubmit("frm");
					comSubmit
							.setUrl("<c:url value='/com_qna/QnAUpdate.tea' />");
					comSubmit.addParam("DEAL_NO", ${map.DEAL_NO});
					comSubmit.submit();
				}

				function fn_deleteBoard() {
					var QA_NO = "${map.QA_NO}";
					var comSubmit = new ComSubmit("frm");
					comSubmit
							.setUrl("<c:url value='/com_qna/QnAdelete.tea' />");
					//comSubmit.addParam("QA_NO", ${map.QA_NO});
					//comSubmit.addParam("QA_STEP", ${map.QA_NO});
					comSubmit.addParam("DEAL_NO", ${map.DEAL_NO});
					comSubmit.submit();

				}
			</script>
</body>
</html>