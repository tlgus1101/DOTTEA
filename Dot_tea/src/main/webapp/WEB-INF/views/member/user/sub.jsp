<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
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

.contents img {
	float: left;
	padding: 30px;
}

#banner {
	position: absolute;
	font-size: 8pt;
	top: 5px;
	left: 0;
	z-index: 10;
	background: #f1f1f1;
	padding: 5px;
	border: 1px solid #CCCCCC;
	text-align: center;
}

#banner>span {
	margin-bottom: 10px;
	display: block;
}

.banner_contents {
	min-height: 200px;
	background-color: #c0c0c0;
	padding: 5px;
}
</style>

</head>
<body>
	<h2>마이 페이지</h2>
	<div id="container">
		<ul class="tabs">
			<li class="active" rel="tab1">Main</li>
			<li rel="tab2">주문내역</li>
			<li rel="tab3">내글관리</li>
			<li rel="tab4">개인정보</li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<ul class="subtabs">
					<li><a href="#">home~ sweet home~</a></li>
				</ul>
			</div>
			<div id="tab2" class="tab_content">
				<ul class="subtabs">
					<li><a href="#">전체 주문 내역</a></li>
					<li><a href="#">최근 주문 내역</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">배송조회</a></li>
				</ul>
			</div>
			<div id="tab3" class="tab_content">
				<ul class="subtabs">
					<li><a href="#">문의사항</a></li>
					<li><a href="#">리뷰</a></li>
				</ul>
			</div>
			<div id="tab4" class="tab_content">
				<ul class="subtabs">
					<li><a href="#">개인정보 수정</a></li>
					<li><a href="#">비밀번호 변경</a></li>
					<li><a href="#">회원 탈퇴</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />

	<div>

		<div
			style="position: relative; float: right; width: 90px; top: -15px; right: -115px;">
			<div id="banner">
				<span>최근에 본 상품</span>
				<div id="" class="banner_contents">썸네일</div>
			</div>

		</div>
		<table class="board_list">
			<h3>최근 주문 조회</h3>
			<span style="float: right"><a href="#this" class="btn"
				id="order">전체보기</a></span>
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
				<c:choose>
					<c:when test="${fn:length(order) > 0}">
						<c:forEach items="${order }" var="row">
							<tr>
								<td>${row.OR_NO }</td>
								<td class="title"><a href="#this" name="order">${row.OR_NAME }</a>
									<input type="hidden" id="OR_NO" value="${row.OR_NO }"></td>
								<td>${row.OR_DATE }</td>
								<td>${row.OR_PRICE }</td>
								<td>${row.OR_STATUS }</td>
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

	<br />
	<hr>

	<div>
		<table class="board_list">
			<h3>문의 사항</h3>
			<span style="float: right"><a href="#this" class="btn"
				id="qna">전체보기</a></span>
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">문의 번호</th>
					<th scope="col">문의 제품</th>
					<th scope="col">문의 제목</th>
					<th scope="col">문의 등록일</th>
					<th scope="col">문의 답변 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(qna) > 0}">
						<c:forEach items="${qna }" var="row">
							<tr>
								<td>${row.QA_NO }</td>
								<td>${row.DAEL_NO }</td>
								<td class="title"><a href="#this" name="qna">${row.QA_SUBJECT }</a>
									<input type="hidden" id="QA_NO" value="${row.QA_NO }"></td>
								<td>${row.QA_DATE }</td>
								<td>${row.QA_COM_TYPE }
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
	
	
	
	<div id="tab2" class="tab_content">
			<div class="innerTab2">
				<h3 style="padding: 7px; font-weight: bold">전체 주문 내역</h3>
				<div class="search" style="padding: 7px">
					<a><img src="../css/icon.jpg"
						style="width: 20px; height: 20px;" alt="검색" />검색</a>
						<form name="search_form" id="search_form">
							<a href="#this" id="pre">&lt;이전</a> <input type="number"
								name="year"
								style="text-align: center; width: 60px; height: 16px">년
							<a href="#this" id="next">다음&gt;</a> 
							<select name="month">
								<c:forEach begin="1" end="12" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>&nbsp;월 
							<a href="#this" id="search" style="padding: 6px"> <input type="image"
								src="https://res.kurly.com/pc/ico/1221/ico_gnb_search.png"
								class="btn_search" width="20s" height="20"></a>
						</form>
				</div>
				
				<table class="board_list">
					<thead>
						<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="20%" />
						</colgroup>
						
						<tr style="background-color: #eee9f1; color: #532074">
							<th scope="col">주문 번호</th>
							<th scope="col">상품명</th>
							<th scope="col">주문날짜</th>
							<th scope="col">가격</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody class="orderlist">

					</tbody>
				</table>
				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</div>
			<div class="innerTab2">
				<h3 style="padding: 7px; font-weight: bold">최근 주문 내역</h3>
				<br>
				<br />
				<table class="board_list">
					<thead>
						<tr style="background-color: #eee9f1; color: #532074">
							<th scope="col">주문 번호</th>
							<th scope="col">상품명</th>
							<th scope="col">주문날짜</th>
							<th scope="col">가격</th>
							<th scope="col">상태</th>
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
										<td>${row.OR_STATUS }</td>
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

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$(function() {

				$(".tab_content").hide();

				$("ul.tabs li").mouseover(function() {
					$("ul.tabs li").removeClass("active").css("color", "#333");
					$(this).addClass("active").css("color", "darkred");
					$(".tab_content").hide()
					var activeTab = $(this).attr("rel");
					$("#" + activeTab).fadeIn()
				});
				
				$(".subtabs li>a" || ".tab_container .tab_content>ul").mouseout(function() {
					$("ul.tabs li").removeClass("active").css("color", "#333");
					$(".tab_content").hide()
					var activeTab = $(this).attr("rel");
					$("#" + activeTab).fadeOut()
				});
				
			});

			$(window).scroll(function() {
				$('#banner').animate({
					top : $(window).scrollTop() + "px"
				}, {
					queue : false,
					duration : 500
				});
			});

			$("#order").on("click", function(e) {
				e.preventDefault();
				fn_orderBoardList();
			});

			$("#qna").on("click", function(e) {
				e.preventDefault();
				fn_qnaBoardList();
			});

			$("a[name='order']").on("click", function(e) {
				e.preventDefault();
				fn_orderBoardDetail($(this));
			});

			$("a[name='qna']").on("click", function(e) {
				e.preventDefault();
				fn_qnaBoardDetail($(this));
			});
		});

		function fn_orderBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderlist.tea' />");
			comSubmit.submit();
		}

		function fn_qnaBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/qnalist.tea' />");
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
	</script>
</body>
</html>
