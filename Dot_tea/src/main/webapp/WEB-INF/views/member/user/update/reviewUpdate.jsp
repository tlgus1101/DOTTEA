<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.RE_NO }</td>
					<input type="hidden" id="RE_NO" name="RE_NO" value="${map.RE_NO }">
					<th scope="row">제품 번호</th>
					<td>${map.DEAL_NO }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.MEM_USER_USERID }</td>
					<th scope="row">별점</th>
					<td>${map.RE_STAR }</td>
					<th scope="row">작성일</th>
					<td>${map.RE_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="RE_SUBJECT"
						name="RE_SUBJECT" value="${map.RE_SUBJECT }" /></td>
				</tr>
				<tr>
					<td colspan="4" class="view text"><textarea rows="20"
							cols="100" title="내용" id="RE_CONTENT" name="RE_CONTENT">${map.RE_CONTENT }</textarea>
					</td>
				</tr>
				<%-- <tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<p>
							<input type="hidden" id="IDX" value="${row.IDX }">
							<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
							(${row.FILE_SIZE }kb)
						</p>
					</c:forEach>
				</td>
			</tr> --%>
			</tbody>
		</table>
	</form>

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정완료</a>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_reviewBoardList();
			});

			$("#update").on("click", function(e) {
				e.preventDefault();
				fn_reviewBoardUpdate();
			});
		});

		function fn_reviewBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/reviewlist.tea' />");
			comSubmit.submit();
		}

		function fn_reviewBoardUpdate() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/member/updatefinR.tea' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>


