<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
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

			<div class="boardWrite">
				<table class="board_list">
					<colgroup>
						<col width="50px" />
						<col width="100px" />
						<col width="50px" />
						<col width="100px" />
					</colgroup>

					<tbody>
						<tr>
							<th scope="row" class="memberCols1"
								style="background-color: #eee9f1; color: #532074">글 번호</th>
							<td>${map.QA_NO }<input type="hidden" id="QA_NO"
								name="QA_NO" value="${map.QA_NO }"></td>
							<th scope="row" class="memberCols1"
								style="background-color: #eee9f1; color: #532074">작성자</th>
							<td>${map.MEM_USER_USERID }</td>
						</tr>
						<tr>
							<th scope="row" class="memberCols1"
								style="background-color: #eee9f1; color: #532074">조회수</th>
							<td>${map.QA_COUNT }</td>
							<th scope="row" class="memberCols1"
								style="background-color: #eee9f1; color: #532074">날 짜</th>
							<td>${map.QA_DATE }</td>
						</tr>
						<tr>
							<th scope="row" class="memberCols1"
								style="background-color: #eee9f1; color: #532074">제목</th>
							<td colspan="3">${map.QA_SUBJECT }</td>
						</tr>
						<tr>
							<td colspan="4">${map.QA_CONTENT }</td>
						</tr>

					</tbody>
				</table>
			</div>
		</form>

	</div>

	<br>
	<div>
		<span><a href="#this" id="list" name="return"> <span
				class="bhs_button active" style="float: center;">목록으로</span>
		</a></span> <span><a href="#this" id="update" name="return"> <span
				class="bhs_button active" style="float: center;">답변쓰기</span>
		</a></span>
	</div>

	<c:if test="${map.QA_TYPE != 1 }">
		<div>
			<span><a href="#this" id="update2" name="return"> <span
					class="bhs_button active" style="float: center;">수정하기</span>
			</a></span> <span><a href="#this" id="delete" name="return"> <span
					class="bhs_button active" style="float: center;">삭제하기</span>
			</a></span>
		</div>
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
					.setUrl("<c:url value='/com_qna/openQnAList.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_openBoardUpdate() {
			var QA_NO = "${map.QA_NO}";
			var DEAL_NO = "${map.DEAL_NO}";
			var QA_REF = "${map.QA_REF}";
			var QA_STEP = "${map.QA_STEP}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/openBoardWrite.tea' />");
			comSubmit.addParam("QA_NO", QA_NO);
			comSubmit.addParam("DEAL_NO", DEAL_NO);
			comSubmit.addParam("QA_REF", QA_REF);
			comSubmit.addParam("QA_STEP", QA_STEP);
			comSubmit.submit();
		}
		function fn_openBoardUpdate2() {
			var QA_NO = "${map.QA_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/QAUpdateForm.tea' />");
			comSubmit.addParam("QA_NO", QA_NO);
			comSubmit.submit();
		}

		function fn_deleteBoard() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/QAdelete.tea' />");
			comSubmit.addParam("QA_NO", $("#QA_NO").val());
			comSubmit.submit();

		}
	</script>
</body>
</html>