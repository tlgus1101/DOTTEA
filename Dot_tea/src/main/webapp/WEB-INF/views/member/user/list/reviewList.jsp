<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header-Umypage.jspf"%>
<meta charset="UTF-8">
</head>
<body>
	<h2 style="padding: 20px; font-weight: bold">전체 리뷰 목록</h2>
	<div>
		<form name="searchForm" id="searchForm">
			<span style="float: right"> <input type="text" name="tkeyword"
				id="tkeyword" style="text-align: left; width: 200px; height: 25px"
				value="${tkeyword}" placeholder="제품명을 입력해주세요."> <a
				href="#this" name="searchKey" id="searchKey"> <img
					src="../css/icon.jpg" style="width: 20px; height: 20px;" alt="검색" />
					검색
			</a>
			</span>
		</form>
	</div>
	<br>
	<br>
	<br>
	<table class="board_list">

		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="*" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">리뷰 번호</th>
				<th scope="col">제품 번호</th>
				<th scope="col">제품 이름</th>
				<th scope="col">리뷰 제목</th>
				<th scope="col">리뷰 별점</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>

	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_reviewBoardList(1);

			$("#searchKey").on("click", function(e) {
				var tkeyword = document.searchForm.tkeyword.value;
				e.preventDefault();
				fn_search();
			});
		});

		function fn_search() {
			var comAjax = new ComAjax();
			var tkeyword = document.searchForm.tkeyword.value;
			comAjax.setUrl("<c:url value='/member/reviewboard.tea' />");
			comAjax.setCallback("fn_reviewBoardListCallback");
			comAjax.addParam("tkeyword", tkeyword);
			comAjax.ajax();
		}

		function fn_reviewBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/reviewdetail.tea' />");
			comSubmit.addParam("RE_NO", obj.parent().find("#RE_NO").val());
			comSubmit.submit();
		}

		function fn_reviewBoardList(pageNo) {
			var comAjax = new ComAjax();
			//alert("나올래요?");
			var idSession = '${idSession}';
			comAjax.setUrl("<c:url value='/member/reviewboard.tea' />");
			comAjax.setCallback("fn_reviewBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 20);
			comAjax.addParam("idSession", idSession);
			comAjax.ajax();
		}

		function fn_reviewBoardListCallback(data) {
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
					eventName : "fn_reviewBoardList"
				};
				gfn_renderPaging(params);

				var str = "";
				$
						.each(
								data.review,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RE_NO
											+ "</td>"
											+ "<td>"
											+ value.DEAL_NO
											+ "</td>"
											+ "<td>"
											+ value.DEAL_TITLE
											+ "/td"
											+ "<td class='title'>"
											+ "<a href='#this' name='review'>"
											+ value.RE_SUBJECT
											+ "</a>"
											+ "<input type='hidden' name='RE_NO' id='RE_NO' value=" + value.RE_NO + ">"
											+ "</td>" + "<td>";
									for (var i = 0; i < value.RE_STAR; i++) {
										str += "<img src='${pageContext.request.contextPath}/images/star_1.png' width='30ox' height='30px'>";
									}

									str += "</td>" + "<td>" + value.RE_DATE
											+ "</td>" + "</tr>";
								});
				body.append(str);

				$("a[name='review']").on("click", function(e) { //제목
					e.preventDefault();
					fn_reviewBoardDetail($(this));
				});
			}
		}
	</script>
</body>
</html>