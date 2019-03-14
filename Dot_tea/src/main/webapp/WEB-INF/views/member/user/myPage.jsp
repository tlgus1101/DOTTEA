<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/include-header-Umypage.jspf"%>
<meta charset="UTF-8">
<style>
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 36px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 100px;
	height: 35px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid #eee;
	border-top: none;
	clear: both;
	float: left;
	width: 403px;
	hight: auto;
	background: #FFFFFF;
}

.tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	padding: 0px;
	margin-left: auto;
	margin-right: auto;
}

.tab_container .tab_content ul li {
	float: left;
	padding: 5px;
	list-style: none;
}

;
#container {
	width: 249px;
	margin: auto;
}

.contents {
	width: 800px;
	margin: 0 auto;
	height: auto;
	background-color: #e0e0e0;
	padding: 20px;
}

ul.second_tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 36px;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}

ul.second_tabs li {
	text-align: center;
	cursor: pointer;
	width: 500px;
	height: 40px;
	line-height: 31px;
	border: 1px groove #eee;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.second_tabs li.se_active {
	background: #FFFFFF;
	border: 1px inset #FFFFFF;
}

.se_tab_container {
	clear: both;
	float: left;
	width: 403px;
	hight: auto;
	background: #FFFFFF;
}

.se_tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}

.contents img {
	float: left;
	padding: 30px;
}

.innerTab2 {
	padding: 10px;
	display: inline-block;
	float: left;
	width: 50%;
	height: 100%;
}

.search a {
	font-size: 15px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="page_section section_myinfo">
		<br> <br>

		<div class="head_aticle">
			<h2 class="tit" align="center">마이페이지</h2>
		</div>
	</div>
	<div id="tab1" class="tab_content">
		<div>
			<table class="board_list">
				<h3 style="padding: 7px; font-weight: bold">최근 주문 조회</h3>
				<br>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">주문 번호</th>
						<th scope="col">상품명</th>
						<th scope="col">주문날짜</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(order) > 0}">
							<c:forEach items="${order }" var="row">
								<tr>
									<td>${row.OR_NO }</td>
									<td class="title"><a href="#this" name="order">${row.OR_NAME }</a>
										<input type="hidden" id="OR_NO" value="${row.OR_NO }"></td>
									<td>${row.OR_DATE }</td>
									<td>${row.OR_PRICE }</td>

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
		</div>
		<br> <br> <br> <br>
		<div>
			<table class="board_list">
				<h3 style="padding: 7px; font-weight: bold">최근 문의 사항</h3>
				<br>
				<colgroup>
					<col width="15%" />
					<col width="20%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">문의 번호</th>
						<th scope="col">문의 제품</th>
						<th scope="col">문의 제목</th>
						<th scope="col">문의 등록일</th>
						<th scope="col">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(qna) > 0}">
							<c:forEach items="${qna }" var="row">
								<tr>
									<td>${row.QA_NO }</td>
									<td>${row.DEAL_TITLE}</td>
									<td class="title"><a href="#this" name="qna">${row.QA_SUBJECT }</a>
										<input type="hidden" id="QA_NO" value="${row.QA_NO }"></td>
									<td>${row.QA_DATE }</td>
									<td><c:if test="${row.QA_COM_TYPE == 1}">미확인</c:if> <c:if
											test="${row.QA_COM_TYPE == 2}">확인</c:if></td>
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
		</div>
	</div>
	<div id="tab2" class="tab_content">
		<h3 style="padding: 7px; font-weight: bold">전체 주문 내역</h3>
		<div class="search" style="padding: 7px">
			<form name="search_form" id="search_form">
				<a href="#this" id="pre">&lt;이전</a> <input type="number" name="year"
					style="text-align: center; width: 60px; height: 16px">년 <a
					href="#this" id="next">다음&gt;</a> <select name="month">
					<c:forEach begin="1" end="12" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>&nbsp;월 <a href="#this" id="search" style="padding: 6px"> <img
					src="../css/icon.jpg" style="width: 20px; height: 20px;" alt="검색" />검색
				</a>
			</form>
		</div>
		<table class="board_list">
			<thead>
				<tr style="background-color: #eee9f1; color: #532074">
					<th scope="col">주문 번호</th>
					<th scope="col">상품명</th>
					<th scope="col">주문날짜</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(order) > 0}">
						<c:forEach items="${order }" var="row">
							<tr>
								<td>${row.OR_NO }</td>
								<td class="title"><a href="#this" name="order">${row.OR_NAME }</a>
									<input type="hidden" id="OR_NO" value="${row.OR_NO }"></td>
								<td>${row.OR_DATE }</td>
								<td>${row.OR_PRICE }</td>
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
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	</div>
	</div>
	<div id="tab3" class="tab_content">
		<h3 style="padding: 7px; font-weight: bold"">찜한상품</h3>
		<%-- <%= request.getSession() %> --%>
		<br>
		<div>
			<table class="board_list">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">제품 번호</th>
						<th scope="col">기업 이름</th>
						<th scope="col">제품명</th>
						<th scope="col">제품 가격</th>
						<th scope="col">제품 용량</th>
					</tr>
				</thead>
				<tbody class="basketlist">

				</tbody>
			</table>
			<div id="PAGE_LIKE"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</div>
	</div>

	<div id="tab4" class="tab_content">
		<div class="innerTab2">
			<h3 style="padding: 7px; font-weight: bold">QNA</h3>
			<a href="#this" id="qna" style="padding: 10px; font-weight: bold">전체보기</a>
			<!-- <div class="search" style="padding: 7px">
						<form name="Qsearch" id="Qsearch">
							<input type="text" name="key"
								style="text-align: left; width: 100px; height: 20px"
								placeholder="제품명 입력"> <a href="#this"
								id="Qsearch"><img src="../css/icon.jpg"
						style="width: 20px; height: 20px;" alt="검색" />검색</a>&nbsp;&nbsp;
						</form>
					</div> -->

			<table class="board_list">
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">문의 번호</th>
						<th scope="col">문의 제품</th>
						<th scope="col">문의 제목</th>
						<th scope="col">문의 등록일</th>
						<th scope="col">답변</th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<c:when test="${fn:length(qna) > 0}">
							<c:forEach items="${qna }" var="row">
								<tr>
									<td>${row.QA_NO }</td>
									<td>${row.DEAL_TITLE}</td>
									<td class="title"><a href="#this" name="qna">${row.QA_SUBJECT }</a>
										<input type="hidden" id="QA_NO" value="${row.QA_NO }"></td>
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
			<div id="PAGE_QNA"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</div>
		<div class="innerTab2">
			<h3 style="padding: 7px; font-weight: bold">리뷰</h3>
			<a href="#this" id="review" style="padding: 10px; font-weight: bold">전체보기</a>

			<table class="board_list">
				<thead>
					<tr style="background-color: #eee9f1; color: #532074">
						<th scope="col">리뷰 번호</th>
						<th scope="col">리뷰 제품</th>
						<th scope="col">리뷰 제목</th>
						<th scope="col">리뷰 점수</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.RE_NO }</td>
									<td>${row.DEAL_TITLE }</td>
									<td class="RE_SUBJECT"><a href="#this" name="RE_SUBJECT">${row.RE_SUBJECT }</a>
										<input type="hidden" id="RE_NO" value="${row.RE_NO }"></td>
									<td>${row.MEM_USER_USERID }</td>


									<td><c:if test="${row.RE_STAR==1}">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
										</c:if> <c:if test="${row.RE_STAR==2}">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
										</c:if> <c:if test="${row.RE_STAR==3}">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
										</c:if> <c:if test="${row.RE_STAR==4}">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
										</c:if> <c:if test="${row.RE_STAR==5}">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
											<img
												src="${pageContext.request.contextPath}/images/star_1.png"
												width="30ox" height="30px">
										</c:if></td>

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
			<div id="PAGE_RE"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</div>
	</div>
	<div id="tab5" class="tab_content"></div>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_year();

			$(function() {

				$(".tab_content").hide();
				$(".tab_content:first").show();

				$("ul.gnb li").click(function() {
					$("ul.gnb li").removeClass("active").css("color", "#333");
					$(this).addClass("active").css("color", "darkred");
					$(".tab_content").hide()
					var activeTab = $(this).attr("rel");
					$("#" + activeTab).fadeIn()
				});
			});

			$(function() {

				$(".se_tab_content").hide();

				$("ul.second_tabs li").click(function() {
					$("ul.second_tabs li").css("color", "#333");
					$(this).toggleClass("se_active").css("color", "darkred");
					var activeTab = $(this).attr("rel");
					/* if ($("#" + activeTab).is(":visible")) {
						$(".se_tab_content").slideUp()
					} else {
						$("#" + activeTab).slideDown()
					} */
				});
			});
			$("#NO2").click(function() {
				fn_orderBoardList(1);
			});

			$("#NO3").click(function() {
				fn_basketBoardList(1);
			});

			$("#se_NO1").click(function() {
				fn_qnaBoardList(1);
			});

			$("#se_NO2").click(function() {
				fn_reviewBoardList(1);
			});

			$(".search>a").click(function() {
				$(this).next("div").toggleClass("hide");
			});

			$("#pre").on("click", function(e) {
				e.preventDefault();
				fn_movePre();
			});

			$("#next").on("click", function(e) {
				e.preventDefault();
				fn_moveNext();
			});

			$("#search").on("click", function(e) {
				e.preventDefault();
				fn_search();
			});

			$("#Qsearch").on("click", function(e) {
				e.preventDefault();
				fn_Qsearch();
			});

			$("#Rsearch").on("click", function(e) {
				e.preventDefault();
				fn_Rsearch();
			});

			$("#qna").on("click", function(e) {
				e.preventDefault();
				fn_qnaList();
			});

			$("#review").on("click", function(e) {
				e.preventDefault();
				fn_reviewList();
			});

			$("a[name='order']").on("click", function(e) {
				e.preventDefault();
				fn_orderBoardDetail($(this));
			});

			$("a[name='basket']").on("click", function(e) {
				e.preventDefault();
				fn_basketBoardDetail($(this));
			});

			$("a[name='qna']").on("click", function(e) {
				e.preventDefault();
				fn_qnaBoardDetail($(this));
			});

			$("a[name='review']").on("click", function(e) {
				e.preventDefault();
				fn_reviewBoardDetail($(this));
			});

		});

		function openWin() {
			window
					.open("<c:url value='/member/checkU.tea' />", "비밀번호 확인",
							"width=auto, heigth=auto, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
		}

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

		function fn_search() {
			var comAjax = new ComAjax();
			var year = document.search_form.year.value;
			var month = document.search_form.month.value;
			comAjax.setUrl("<c:url value='/member/ordersearch.tea' />");
			comAjax.setCallback("fn_orderBoardListCallback");
			comAjax.addParam("YEAR", year);
			comAjax.addParam("MONTH", month);
			comAjax.ajax();
		}

		function fn_Qsearch() {
			var comAjax = new ComAjax();
			var key = document.Qsearch.key.value;
			comAjax.setUrl("<c:url value='/member/qnaboard.tea' />");
			comAjax.setCallback("fn_qnaBoardListCallback");
			comAjax.addParam("KEY", key);
			comAjax.ajax();
		}

		function fn_Rsearch() {
			var comAjax = new ComAjax();
			var key = document.Rsearch.key.value;
			comAjax.setUrl("<c:url value='/member/reviewboard.tea' />");
			comAjax.setCallback("fn_reviewBoardListCallback");
			comAjax.addParam("KEY", key);
			comAjax.ajax();
		}

		function fn_orderList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderlist.tea' />");
			comSubmit.submit();
		}

		function fn_qnaList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/qnalist.tea' />");
			comSubmit.submit();
		}

		function fn_reviewList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/reviewlist.tea' />");
			comSubmit.submit();
		}

		function fn_orderBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderdetail.tea' />");
			comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
			comSubmit.submit();
		}

		function fn_qnaBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/qnadetail.tea' />");
			comSubmit.addParam("QA_NO", obj.parent().find("#QA_NO").val());
			comSubmit.submit();
		}

		function fn_reviewBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/reviewdetail.tea' />");
			comSubmit.addParam("RE_NO", obj.parent().find("#RE_NO").val());
			comSubmit.submit();
		}

		function fn_orderBoardList(pageNo) {
			var comAjax = new ComAjax();
			var year = document.search_form.year.value;
			var month = document.search_form.month.value;
			comAjax.setUrl("<c:url value='/member/orderboard.tea' />");
			comAjax.setCallback("fn_orderBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 5);
			comAjax.addParam("YEAR", year);
			comAjax.addParam("MONTH", month);
			comAjax.ajax();
		}

		function fn_basketBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/member/myLikeList.tea' />");
			comAjax.setCallback("fn_basketBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 5);
			comAjax.addParam("NOSession", '${NOSession}');
			comAjax.ajax();
		}

		function fn_qnaBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/member/qnaboard.tea' />");
			comAjax.setCallback("fn_qnaBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 5);
			comAjax.ajax();
		}

		function fn_reviewBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/member/reviewboard.tea' />");
			comAjax.setCallback("fn_reviewBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 5);
			comAjax.ajax();
		}

		function fn_orderBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $(".orderlist");
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

			}
		}

		function fn_basketBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $(".basketlist");

			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {

				var str = "";
				$
						.each(
								data.likeList,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.DEAL_NO
											+ "</td>"
											+ "<td>"
											+ value.MEM_COM_NAME
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='like'>"
											+ "<input type='hidden' name='NO' id='NO' value=" + value.DEAL_NO + ">"
											+ value.DEAL_TITLE + "</a>"
											+ "</td>" + "<td>"
											+ value.DEAL_PRICE + "</td>"
											+ "<td>" + value.DEAL_ORG + "</td>"
											+ "</tr>";
								});
				body.append(str);
				$("a[name='like']").on("click", function(e) {
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

		function fn_qnaBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $(".qnalist");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_QNA",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_qnaBoardList"
				};
				gfn_renderPaging(params);

				var str = "";
				$
						.each(
								data.qna,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.QA_NO
											+ "</td>"
											+ "<td>"
											+ value.DEAL_NO
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='qna'>"
											+ value.QA_SUBJECT
											+ "</a>"
											+ "<input type='hidden' name='QA_NO' id='QA_NO' value=" + value.QA_NO + ">"
											+ "</td>" + "<td>" + value.QA_DATE
											+ "</td>" + "<td>"
											+ value.QA_COM_TYPE + "</td>"
											+ "</tr>";
								});
				body.append(str);

			}
		}

		function fn_reviewBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $(".reviewlist");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_RE",
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
											+ "<td class='title'>"
											+ "<a href='#this' name='review'>"
											+ value.RE_SUBJECT
											+ "</a>"
											+ "<input type='hidden' name='RE_NO' id='RE_NO' value=" + value.RE_NO + ">"
											+ "</td>" + "<td>" + value.RE_STAR
											+ "</td>" + "<td>" + value.RE_DATE
											+ "</td>" + "</tr>";
								});
				body.append(str);

			}
		}
	</script>

</body>
</html>
