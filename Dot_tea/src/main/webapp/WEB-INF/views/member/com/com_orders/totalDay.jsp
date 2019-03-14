<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>
	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">일자별 매출</h2>
	</div>
	<br>
	<table class="board_list">
		<%-- 		<colgroup>
			<col width="5%" />
			<col width="5" />
			<col width="5%" />
		</colgroup> --%>
		<thead>
			<tr style="background-color: #eee9f1; color: #532074">
				<th>월/일</th>
				<th>기업명</th>
				<th>일 매출액</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>

							<td>${row.OR_DATE}</td>
							<td>${row.MEM_COM_NAME }</td>
							<td>${row.CALCULATION }</td>



						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>
	<span><a href="#this" class=" bhs_button active" id="List">주문목록</a></span>
	<span> <a href="#this" class=" bhs_button
					active"
		id="Month">월(매출)</a>
	</span>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#List").on("click", function(e) {
				e.preventDefault();
				fn_openBoardList();
			});

			$("#Month").on("click", function(e) { //일별
				e.preventDefault();
				fn_openBoardMonth();
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/com_or/openBoardList.tea?MEM_COM_NO=${NOSession}' />");
			/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
			comSubmit.submit();
		}

		function fn_openBoardMonth() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_or/com_Month.tea' />");
			/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
			comSubmit.submit();
		}
	</script>
</body>
</html>