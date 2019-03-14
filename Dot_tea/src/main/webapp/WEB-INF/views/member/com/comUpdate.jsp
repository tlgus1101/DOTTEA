<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보수정</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>

	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">상품 수정</h2>
	</div>
	<br>
	<form id="frm" enctype="multipart/form-data" method="post">
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
					<td colspan="3">${map.DEAL_NO }<input type="hidden"
						id="DEAL_NO" name="DEAL_NO" value="${map.DEAL_NO }">
					</td>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">상품명</th>
					<td><input type="text" id="DEAL_TITLE" name="DEAL_TITLE"
						class="wdp_90" value="${map.DEAL_TITLE }" /></td>

					<th scope="row" style="background-color: #eee9f1; color: #532074">가
						격</th>
					<td><input type="text" id="DEAL_PRICE" name="DEAL_PRICE"
						class="wdp_90" value="${map.DEAL_PRICE }" /></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">용량/중량</th>
					<td><input type="text" id="DEAL_VOL" name="DEAL_VOL"
						class="wdp_90" value="${map.DEAL_VOL }" /></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">단위</th>
					<td><input type="text" id="DEAL_UNIT" name="DEAL_UNIT"
						class="wdp_90" value="${map.DEAL_UNIT }" /></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">원산지</th>
					<td><input type="text" id="DEAL_ORG" name="DEAL_ORG"
						class="wdp_90" value="${map.DEAL_UNIT }" /></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">재고
						수량</th>
					<td><input type="text" id="DEAL_COUNT" name="DEAL_COUNT"
						class="wdp_90" value="${map.DEAL_COUNT}" /></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">상품
						종류</th>
					<td><c:if test="${map.DEAL_TYPE == 1}">
							<input type="text" id="DEAL_TYPE" name="DEAL_TYPE" class="wdp_90"
								placeholder="찻잎 (숫자로 표기하세요 ex. 1 찻잎 2 티팟 3 악세서리 4 이벤트)"
								value="${map.DEAL_TYPE }" /></td>
					</c:if>
					<c:if test="${map.DEAL_TYPE == 2}">
						<input type="text" id="DEAL_TYPE" name="DEAL_TYPE" class="wdp_90"
							placeholder="티팟 (숫자로 표기하세요 ex. 1 찻잎 2 티팟 3 악세서리 4 이벤트)"
							value="${map.DEAL_TYPE }" />
						</td>
					</c:if>
					<c:if test="${map.DEAL_TYPE == 3}">
						<input type="text" id="DEAL_TYPE" name="DEAL_TYPE" class="wdp_90"
							placeholder="악세서리 (숫자로 표기하세요 ex. 1 찻잎 2 티팟 3 악세서리 4 이벤트)"
							value="${map.DEAL_TYPE }" />
						</td>
					</c:if>
					<c:if test="${map.DEAL_TYPE == 4}">
						<input type="text" id="DEAL_TYPE" name="DEAL_TYPE" class="wdp_90"
							placeholder="이벤트 (숫자로 표기하세요 ex. 1 찻잎 2 티팟 3 악세서리 4 이벤트)"
							value="${map.DEAL_TYPE }" />
						</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="DEAL_CONTENT" name="DEAL_CONTENT">${map.DEAL_CONTENT }</textarea>
					</td>
				</tr>

				<tr>
					<td>상품이미지</td>
					<td colspan="4" align="left"><input type="file"
						name="DEAL_IMGSV" id="DEAL_IMGSV"></td>
				</tr>

			</tbody>
		</table>
	</form>
	<br>
	<span><a href="#this" class="bhs_button
					active" id="list">목록으로</a></span>
	<span><a href="#this" class="bhs_button
					active"
		id="update">저장하기</a></span>
	<span><a href="#this" class="bhs_button
					active"
		id="delete">삭제하기</a></span>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
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
			comSubmit
					.setUrl("<c:url value='/shop/openBoardList.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_updateBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit
					.setUrl("<c:url value='/shop/updateBoard.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_deleteBoard() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/shop/deleteBoard.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.addParam("DEAL_NO", $("#DEAL_NO").val());
			comSubmit.submit();

		}
	</script>
</body>
</html>