<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="goods-goods_search">
	<div id="main">
		<div id="content">
			<div class="page_aticle page_search">
				<div class="page_location">
					<a class="link" href="/">홈</a> &gt; <strong class="current">상품검색</strong>
				</div>
				<div class="head_section head_search">
					<h2 class="tit">상품검색</h2>
					<p class="desc">찾고 싶은 상품의 이름을 검색해주세요.</p>
				</div>
				<form name="frm" method="post">
					<input type="hidden" name="searched" value="Y">
					<div class="search_box">
						<div class="tit">
							<label for="sword">검색 조건</label>
						</div>
						<div class="desc">
							<input type="text" name="searchKeyword" id="searchKeyword"
								class="inp" value="${searchKeyword }"> <input
								type="button" class="styled-button btn_search" value="검색하기">
						</div>
					</div>
				</form>
				<div id="goodsList" class="page_section section_goodslist">
					<div id="totalCount"></div>

					<div class="list_goods">
						<div class="inner_listgoods">
							<ul class="list">
								<table>
									<tbody></tbody>
								</table>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="/WEB-INF/include/include-body.jspf"%>
			<div class="layout-pagination">
				<div class="pagediv" id="PAGE_NAVI"></div>
			</div>

		</div>
	</div>


	<script src="<c:url value='/js/teaDeal.js' />"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			TeaSearchAjax(1, "${searchKeyword}");
		});

		$('.btn_search').click(
				function() {
					var searchKeyword = TeaSearchAjax(1,
							document.frm.searchKeyword.value);

				});

		var count = 9;
		var types = 1;
		function TeaSearchAjax(pageNo, searchKeyword) {

			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/teaDeal/searchTeaDealAjax.tea'/>");
			comAjax.setCallback("TeaSearchAjaxCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", count);
			comAjax.addParam("searchKeyword", searchKeyword);
			comAjax.ajax();
		}

		function TeaSearchAjaxCallback(data) {
			var total = data.TOTAL;
			var countBody = document.getElementById("totalCount");
			countBody.innerHTML = "<p class='search_result'>"
					+ "<strong class='emph'>총 <span>" + total + "</span> 개"
					+ "</strong>의 상품이 검색되었습니다.</p>";

			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<li><div class='item'><span class='name'>"
						+ "검색된 상품이 없습니다.</span>";
				body.append(str);

			} else {

				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "TeaSearchAjax",
					recordCount : count,

				};
				teaDealListPaging(params);

				var str = "";

				$
						.each(
								data.list,
								function(key, value) {
									str += "<li><div class='item'>"
											+ "<div class='thumb'><input type='hidden' name='NO' id='NO' value='"+value.DEAL_NO+"'>"
											+ "<a class='img'  name='title'>"
											+ "<img src='../images/"+value.DEAL_IMGSV+"' width='308' height='396'>"
											+ "</a></div>"
											+ "<a class='info'  name='title'><span class='name'>"
											+ "["
											+ value.MEM_COM_NAME
											+ "]"
											+ value.DEAL_TITLE
											+ "</span>"
											+ "<span class='cost'><span class='price'>"
											+ value.DEAL_PRICE + "</span>"
											+ "</span>" + "</div></li>"
								});

				body.append(str);

				$("a[name='title']").on("click", function(e) {
					e.preventDefault();
					teaDealDetail($(this));
				});
			}
		}

		function teaDealDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea'/>");
			comSubmit.addParam("NO", obj.parent().find("#NO").val());
			comSubmit.submit();
		}
	</script>




</body>
</html>