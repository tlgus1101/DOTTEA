<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
</head>
<body>
	<h2>주문내역</h2>
	<table class="board_list">
		<h3>전체 주문 조회</h3>
		<div class="DATE_BOX">
			<form name="search_form" id="search_form">
				<p class="title">주문 시기</p>
				<a href="#this" id="pre">&lt;이전</a> 
				<input type="number" name="year" value="year" style="text-align:center; width:60px; height:16px">년
				<a href="#this" id="next">다음&gt;</a> 
				<select name="month">
					<option value="1" selected="selected">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				</strong> 월
				<a href="#this" class="btn" id="search">검색</a>
			</form>
		</div>
		<br />
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

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_orderBoardList(1);
			fn_year();

			$("#pre").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_movePre();
			});
			
			$("#next").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_moveNext();
			});
			
			$("#search").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_search();
			});
		});

		function fn_year() {
			var today = new Date();
			var year_today = today.getFullYear();
			document.search_form.year.value = (year_today);
		}

		function fn_movePre() {
			var year_today = document.search_form.year.value
			document.search_form.year.value = (--year_today);
		}
		
		function fn_moveNext() {
			var year_today = document.search_form.year.value
			document.search_form.year.value = (++year_today);
		}
		
		function fn_search(){
			var comAjax = new ComAjax();
			var year = document.search_form.year.value;
			var month = document.search_form.month.value;
			comAjax.setUrl("<c:url value='/member/ordersearch.tea' />");
			comAjax.setCallback("fn_orderBoardListCallback");
			comAjax.addParam("YEAR", year);
			comAjax.addParam("MONTH", month);
			comAjax.ajax();
		}
		
		function fn_orderBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderdetail.tea' />");
			comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
			comSubmit.submit();
		}

		function fn_orderBoardList(pageNo) {
			var comAjax = new ComAjax();
			var year = document.search_form.year.value;
			var month = document.search_form.month.value;
			comAjax.setUrl("<c:url value='/member/orderboard.tea' />");
			comAjax.setCallback("fn_orderBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 20);
			comAjax.addParam("YEAR", year);
			comAjax.addParam("MONTH", month);
			comAjax.ajax();
		}

		function fn_orderBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_orderBoardList"
				};
				gfn_renderPaging(params);

				var str = "";
				$
						.each(
								data.order,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.OR_NO
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='order'>"
											+ value.OR_NAME
											+ "</a>"
											+ "<input type='hidden' name='OR_NO' id='OR_NO' value=" + value.OR_NO + ">"
											+ "</td>" + "<td>" + value.OR_DATE
											+ "</td>" + "<td>" + value.OR_PRICE
											+ "</td>" + "<td>"
											+ value.OR_STATUS + "</td>"
											+ "</tr>";
								});
				body.append(str);

				/* $("a[name='order']").on("click", function(e) { //제목
					e.preventDefault();
					fn_qnaBoardDetail($(this));
				}); */
			}
		}
	</script>
</body>
</html>
