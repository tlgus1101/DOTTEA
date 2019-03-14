<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
</head>
<body>
	<h2>상품 Q/A</h2>
	<c:if test="${idSession != null}">
		<a href="#this" class="bhs_button active" id="write"> <input
			type="hidden" id="DEAL_NO" value="${DEAL_NO}"> 글 작성

		</a>
	</c:if>
	<div id="tab2" class="tab_content">
		<div class="innerTab2">
			<table class="board_list">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="15%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">글 번호</th>
						<th scope="col">제 목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">날 짜</th>
						<th scope="col">답변 상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.QA_NO }</td>
									<td><a href="#this" name="title">${row.QA_SUBJECT}</a> <input
										type="hidden" id="QA_NO" value="${row.QA_NO}"> <%-- <input type="hidden" id="QA_PASSWORD" value="${row.QA_PASSOWRD }"> --%></td>
									<td><c:if test="${row.QA_LEVEL == 0}">
								${row.MEM_USER_USERID }
								</c:if> <c:if test="${row.QA_LEVEL == null}">	
								상품관리자
							</c:if></td>
									<td>${row.QA_COUNT }</td>
									<td>${row.QA_DATE }</td>
									<td><c:if test="${row.QA_COM_TYPE == 1}">
							미확인</c:if> <c:if test="${row.QA_COM_TYPE == 2}">
							확인</c:if></td>



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
			<c:if test="${not empty paginationInfo}">
				<ui:pagination paginationInfo="${paginationInfo}" type="text"
					jsFunction="fn_search" />
			</c:if>
			<input type="hidden" id="currentPageNo" name="currentPageNo" /> <br />
			<!-- 	<form action="">
						<select class="slcte" name="searchNum" id="searchNum">

							<option value="0">제목</option>
							<option value="1">내용</option>
						</select> <input class="txte" type="text" name="isSearch" id="isSearch" />
						<span class="btn btnC_03 btnP_04 mr10"> <input
							type="submit" value="검색"
							style="font-size: 11px; padding-bottom: 20; vertical-align: middle;" />
						</span>
					</form> -->
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body2.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e) {
				e.preventDefault();
				fn_openBoardWrite($(this));
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});

		function fn_openBoardWrite(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/useropenWrite.tea'/>");
			comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
			/* comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val()); */
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_qna/checkForm.tea'/>");
			comSubmit.addParam("QA_NO", obj.parent().find("#QA_NO").val());
			comSubmit.submit();
		}
		function fn_search(pageNo) {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/com_qna/openBoardList.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
		/* 	function fn_selectBoardList(pageNo) {
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/com_re/selectBoardList.tea' />");
				comAjax.setCallback("fn_selectBoardListCallback");
				comAjax.addParam("PAGE_INDEX", pageNo);
				comAjax.addParam("PAGE_ROW", 15);
				comAjax.ajax();
			}

			function fn_selectBoardListCallback(data) {
				var total = data.TOTAL;
				var body = $("table>tbody");
				body.empty();
				if (total == 0) {
					var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
							+ "</tr>";
					body.append(str);
				} else {
					var params = {
						divId : "PAGE_NAVI",
						pageIndex : "PAGE_INDEX",
						totalCount : total,
						recordCount : 15,
						eventName : "fn_selectBoardList"
						
					};
					gfn_renderPaging(params);
		/* 
					var str = "";
					$.each(
									data.list,
									function(key, value) {
										str += "<tr>"
												+ "<td>"
												+ value.RE_NO
												+ "</td>"
												+ "<td class='RE_SUBJECT'>"
												+ "<a href='#this' name='RE_SUBJECT'>"
												+ value.RE_SUBJECT
												+ "</a>"
												+ "<input type='hidden' id='RE_NO' value=" + value.RE_NO + ">"
												+ "</td>" + "<td>" + value.MEM_USER_USERID
												+ "</td>" + "<td>" + value.RE_COUNT
												+ "</td>" + "<td>" + value.RE_STAR
												+ "</td>" + "</tr>";
									});
					body.append(str); */
		/* 
		 $("a[name='DEAL_NO']").on("click", function(e) { //제목
		 e.preventDefault();
		 fn_openBoardDetail($(this));
		 });
		
		 } */
	</script>
</body>
</html>

</body>
</html>