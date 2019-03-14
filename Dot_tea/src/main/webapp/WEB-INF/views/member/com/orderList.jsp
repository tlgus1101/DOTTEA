<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Dot_tea</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<h2>전체 주문 현황</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">주문 번호</th>
				<th scope="col">상품명</th>
				<th scope="col">주문날짜</th>
				<th scope="col">가격</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>

	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	<br />
	<a href="#this" class="btn" id="write">글쓰기</a>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);

			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/sample/selectBoardList.do'/>");
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

				var str = "";
				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.IDX
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.TITLE
											+ "</a>"
											+ "<input type='hidden' name='title' id='IDX' value=" + value.IDX + ">"
											+ "</td>" + "<td>" + value.HIT_CNT
											+ "</td>" + "<td>" + value.CREA_DTM
											+ "</td>" + "</tr>";
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) {
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
	</script>
</body>
</html>