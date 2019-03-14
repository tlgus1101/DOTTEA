<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
<style type="text/css">
body {
	font-family: "Malgun Gothic";
	font-size: 0.8em;
}
/*TAB CSS*/
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>



<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//When page loads...
						$(".tab_content").hide(); //Hide all content
						$("ul.list li:first").addClass("active").show(); //Activate first tab
						$(".tab_content:first").show(); //Show first tab content

						//On Click Event
						$("ul.list li")
								.click(
										function() {

											$("ul.list li").removeClass(
													"active"); //Remove any "active" class
											$("ul.list li a").removeClass("on");
											$(this).find("a").addClass("on");
											$(this).addClass("active"); //Add "active" class to selected tab
											$(".tab_content").hide(); //Hide all tab content

											var count = $(this).find("a").attr(
													"name");
											var widthSize = 68;
											var size = 0;
											if (Number(count) == 2) {
												size = 68;
											} else if (Number(count) == 3) {
												size = 68 + 68;
											} else if (Number(count) == 4) {
												size = 68 + 68 + 68;
												widthSize += 20;
											}

											var body = document
													.getElementById("lineSetting");
											body.innerHTML = "<li class='bg' style='top: 46px; width: "
													+ widthSize
													+ "px; left: "
													+ (29 + size)
													+ "px; opacity: 1;'></li>";

											var activeTab = $(this).find("a")
													.attr("href"); //Find the href attribute value to identify the active tab + content
											$(activeTab).fadeIn(); //Fade in the active ID content
											return false;
										});

					});
</script>
</head>
<body>
	<br>
	<div id="wrapper">
		<!--탭 메뉴 영역 -->
		<div id="lnbMenu" class="lnb_menu">
			<div id="bnrCategory" class="bnr_category" style=""></div>
			<div class="inner_lnb">
				<div class="head_aticle">
					<h2 class="tit" align="center">주문/배송조회</h2>
				</div>
				<ul class="list">
					<li><a href="#tab" class="on" id="1" name="1">주문관리</a></li>
					<li><a href="#tab2" class="" id="2" name="2">신규주문</a></li>
					<li><a href="#tab3" class="" id="3" name="3">취소신청</a></li>
					<li><a href="#tab4" class="" id="4" name="4">교환/반품 신청</a></li>
					<div id="lineSetting">
						<li class="bg"
							style="top: 46px; width: 68px; left: 29px; opacity: 1;"></li>
					</div>
				</ul>

			</div>
		</div>

		<div class="tab_container">

			<div id="tab" class="tab_content">
				<!--Content-->
				<br> <br>
				<h1>주문 관리</h1>
				<br>
				<table class="board_list">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr style="background-color: #eee9f1; color: #532074">
							<th scope="col">주문번호</th>
							<th scope="col">상품번호</th>
							<th scope="col">이 름</th>
							<th scope="col">가 격</th>
							<th scope="col">전화번호</th>
							<th scope="col">비 고</th>
							<th scope="col">날 짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="row">
									<tr>
										<td>${row.OR_NO }</td>
										<td class="title"><a href="#this" name="title">${row.DEAL_NO }</a>
											<input type="hidden" id="OR_NO" value="${row.OR_NO }">
											<input type="hidden" id="DEAL_NO" value="${row.DEAL_NO}">
											<input type="hidden" id="ORDER_DETAIL_NO"
											value="${row.ORDER_DETAIL_NO}"> <input type="hidden"
											id="MEM_COM_NO" value="${row.MEM_COM_NO }"></td>
										<td>${row.OR_NAME }</td>
										<td>${row.DEAL_PRICE }</td>
										<td>${row.OR_PHON }</td>
										<td><c:if test="${row.OR_STATUS == 4}">
                           상품준비중</c:if> <c:if test="${row.OR_STATUS == 5}">
                           배송중</c:if> <c:if test="${row.OR_STATUS == 6}">
                           완 료</c:if></td>
										<td>${row.OR_DATE }</td>



									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />
				<!-- <a href="#this" class="btn" id="write">배송입력</a> -->

				<span><a href="#this" class=" bhs_button
					active"
					id="Month">월(매출)</a></span><span> <a href="#this"
					class=" bhs_button
					active" id="Day">일(매출)</a>
				</span>

			</div>
			<%@ include file="/WEB-INF/include/include-body.jspf"%>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#write").on("click", function(e) {
						e.preventDefault();
						fn_openBoardWrite();
					});

					$("#Month").on("click", function(e) { //월별
						e.preventDefault();
						fn_openBoardMonth();
					});

					$("#Day").on("click", function(e) { //일별
						e.preventDefault();
						fn_openBoardDay();
					});

					$("a[name='title']").on("click", function(e) { //제목 
						e.preventDefault();
						fn_openBoardDetail($(this));
					});
				});

				function fn_openBoardWrite() {
					var comSubmit = new ComSubmit();
					window
							.open(
									'http://localhost:8080/Dot_tea/com_or/orderBoardWrite.tea',
									'_blank');
					comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO")
							.val());
					comSubmit.submit();
				}

				function fn_openBoardDetail(obj) {
					var comSubmit = new ComSubmit();
					comSubmit
							.setUrl("<c:url value='/com_or/openBoardDetail.tea' />");
					comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO")
							.val());
					comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO")
							.val());
					comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
							"#ORDER_DETAIL_NO").val());
					comSubmit.addParam("MEM_COM_NO", obj.parent().find(
							"#MEM_COM_NO").val());
					comSubmit.submit();
				}

				function fn_openBoardMonth() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/com_or/com_Month.tea' />");
					/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
					comSubmit.submit();
				}

				function fn_openBoardDay() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/com_or/com_Day.tea' />");
					/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
					comSubmit.submit();
				}
			</script>

		</div>
</body>
</html>
<div id="tab2" class="tab_content">
	<!--Content-->
	<br> <br>
	<h1>신규 주문</h1>
	<br>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr style="background-color: #eee9f1; color: #532074">
				<th scope="col">주문번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">이 름</th>
				<th scope="col">가 격</th>
				<th scope="col">전화번호</th>
				<th scope="col">비 고</th>
				<th scope="col">날 짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list3) > 0}">
					<c:forEach items="${list3 }" var="row">
						<tr>
							<td>${row.OR_NO }</td>
							<td class="title"><a href="#this" name="title">${row.DEAL_NO }</a>
								<input type="hidden" id="OR_NO" value="${row.OR_NO }"> <input
								type="hidden" id="DEAL_NO" value="${row.DEAL_NO}"> <input
								type="hidden" id="ORDER_DETAIL_NO"
								value="${row.ORDER_DETAIL_NO}"> <input type="hidden"
								id="MEM_COM_NO" value="${row.MEM_COM_NO }"></td>
							<td>${row.OR_NAME }</td>
							<td>${row.DEAL_PRICE }</td>
							<td>${row.OR_PHON }</td>
							<td><c:if test="${row.OR_STATUS == 4}">
                           상품준비중</c:if></td>
							<td>${row.OR_DATE }</td>

						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />
	<!-- <a href="#this" class="btn" id="write">배송입력</a> -->

	<form name="searchForm1" id="searchForm1">
		<select class="slcte" name="searchOp" id="searchOp">
			<option value="0">이름</option>
			<option value="1">전화</option>
		</select> <input class="txte" type="text" name="tkeyword" id="tkeyword"
			value="${tkeyword}" /> <span> <input type="submit" value="검색"
			class="btn" name="searchKey1" id="searchKey1"
			style="font-size: 15px; font-color: #000000; background-color: #eee9f1; color: #000000; border: 0; outline: 0;" />
		</span>
	</form>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").on("click", function(e) { //배송입력 버튼
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		$("#searchKey1").on("click", function(e) {
			var searchOp = document.searchForm1.searchOp.value;
			var tkeyword = document.searchForm1.tkeyword.value;
			alert("들어와?" + searchOp + " 오냐구! " + tkeyword);
			e.preventDefault();
			fn_search1();
		});

	});

	function fn_search() {
		var comAjax = new ComAjax();
		var tkeyword = document.searchForm.tkeyword.value;
		comAjax.setUrl("<c:url value='/com_or/orderBoardWrite.tea' />");
		comAjax.addParam("tkeyword", tkeyword);
		comAjax.addParam("searchOp", searchOp);
		comAjax.ajax();
	}

	function fn_search1() {
		var comSubmit = new ComSubmit();
		var searchOp = document.searchForm1.searchOp.value;
		var tkeyword = document.searchForm1.tkeyword.value;
		alert("들어와222?" + searchOp + " 오냐구! " + tkeyword);
		comSubmit.setUrl("<c:url value='/com_or/orderBoardWrite.tea' />");
		comSubmit.addParam("tkeyword", tkeyword);
		comSubmit.addParam("searchOp", searchOp);
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/openBoardDetail.tea' />");
		comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
		comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
		comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
				"#ORDER_DETAIL_NO").val());
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();
	}
</script>

</div>
</body>
</html>

<div id="tab3" class="tab_content">
	<!--Content-->
	<br> <br>
	<h1>상품 취소</h1>
	<br>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr style="background-color: #eee9f1; color: #532074">
				<th scope="col">주문번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">이 름</th>
				<th scope="col">가 격</th>
				<th scope="col">전화번호</th>
				<th scope="col">비 고</th>
				<th scope="col">날 짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list1) > 0}">
					<c:forEach items="${list1 }" var="row">
						<tr>
							<td>${row.OR_NO }</td>
							<td class="title"><a href="#this" name="title">${row.DEAL_NO }</a>
								<input type="hidden" id="OR_NO" value="${row.OR_NO }"> <input
								type="hidden" id="DEAL_NO" value="${row.DEAL_NO}"> <input
								type="hidden" id="ORDER_DETAIL_NO"
								value="${row.ORDER_DETAIL_NO}"> <input type="hidden"
								id="MEM_COM_NO" value="${row.MEM_COM_NO }"></td>
							<td>${row.OR_NAME }</td>
							<td>${row.DEAL_PRICE }</td>
							<td>${row.OR_PHON }</td>
							<td><c:if test="${row.OR_STATUS == 1}">
                           취소 요청</c:if> <c:if test="${row.OR_STATUS == 7}">
                           취소 완료</c:if></td>
							<td>${row.OR_DATE }</td>



						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />
	<!-- <a href="#this" class="btn" id="write">배송입력</a> -->

	<form name="searchForm2" id="searchForm2">
		<select class="slcte" name="searchOp" id="searchOp">
			<option value="0">이름</option>
			<option value="1">전화</option>
		</select> <input class="txte" type="text" name="tkeyword" id="tkeyword"
			value="${tkeyword}" /> <span> <input type="submit" value="검색"
			class="btn" name="searchKey2" id="searchKey2"
			style="font-size: 15px; font-color: #000000; background-color: #eee9f1; color: #000000; border: 0; outline: 0;" />
		</span>
	</form>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").on("click", function(e) { //배송입력 버튼
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		$("#searchKey2").on("click", function(e) {

			var searchOp2 = document.searchForm2.searchOp.value;
			var tkeyword2 = document.searchForm2.tkeyword.value;
			e.preventDefault();
			fn_search2();
		});
	});

	function fn_search2() {
		var comSubmit = new ComSubmit();
		var searchOp2 = document.searchForm2.searchOp.value;
		var tkeyword2 = document.searchForm2.tkeyword.value;
		comSubmit.setUrl("<c:url value='/com_or/orderBoardWrite.tea' />");
		comSubmit.addParam("tkeyword2", tkeyword2);
		comSubmit.addParam("searchOp2", searchOp2);
		comSubmit.submit();
	}

	function fn_openBoardWrite() {
		var comSubmit = new ComSubmit();
		window.open('http://localhost:8080/Dot_tea/com_or/orderBoardWrite.tea',
				'_blank');
		comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/openBoardDetail.tea' />");
		comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
		comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
		comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
				"#ORDER_DETAIL_NO").val());
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();
	}
	/*    function fn_selectBoardList(pageNo) {
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

</div>
</body>
</html>

<div id="tab4" class="tab_content">
	<!--Content-->
	<br> <br>
	<h1>상품 반품/교환</h1>
	<br>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr style="background-color: #eee9f1; color: #532074">
				<th scope="col">주문번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">이 름</th>
				<th scope="col">가 격</th>
				<th scope="col">전화번호</th>
				<th scope="col">비 고</th>
				<th scope="col">날 짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list2) > 0}">
					<c:forEach items="${list2 }" var="row">
						<tr>
							<td>${row.OR_NO }</td>
							<td class="title"><a href="#this" name="title">${row.DEAL_NO }</a>
								<input type="hidden" id="OR_NO" value="${row.OR_NO }"> <input
								type="hidden" id="DEAL_NO" value="${row.DEAL_NO}"> <input
								type="hidden" id="ORDER_DETAIL_NO"
								value="${row.ORDER_DETAIL_NO}"> <input type="hidden"
								id="MEM_COM_NO" value="${row.MEM_COM_NO }"></td>
							<td>${row.OR_NAME }</td>
							<td>${row.DEAL_PRICE }</td>
							<td>${row.OR_PHON }</td>
							<td><c:if test="${row.OR_STATUS == 2}">
                           반품 요청</c:if> <c:if test="${row.OR_STATUS == 3}">
                           교환 요청</c:if> <c:if test="${row.OR_STATUS == 8}">
                           반품 완료</c:if> <c:if test="${row.OR_STATUS == 9}">
                           교환 완료</c:if></td>
							<td>${row.OR_DATE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />
	<!-- <a href="#this" class="btn" id="write">배송입력</a> -->

	<form name="searchForm3" id="searchForm3">
		<select class="slcte" name="searchOp" id="searchOp">
			<option value="0">이름</option>
			<option value="1">전화</option>
		</select> <input class="txte" type="text" name="tkeyword" id="tkeyword"
			value="${tkeyword}" /> <span> <input type="submit" value="검색"
			class="btn" name="searchKey3" id="searchKey3"
			style="font-size: 15px; font-color: #000000; background-color: #eee9f1; color: #000000; border: 0; outline: 0;" />
		</span>
	</form>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").on("click", function(e) { //배송입력 버튼
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		$("#searchKey3").on("click", function(e) {
			var searchOp3 = document.searchForm3.searchOp.value;
			var tkeyword3 = document.searchForm3.tkeyword.value;
			e.preventDefault();
			fn_search3();
		});
	});

	function fn_search3() {
		var comSubmit = new ComSubmit();
		var searchOp3 = document.searchForm3.searchOp.value;
		var tkeyword3 = document.searchForm3.tkeyword.value;
		comSubmit.setUrl("<c:url value='/com_or/orderBoardWrite.tea' />");
		comSubmit.addParam("tkeyword3", tkeyword3);
		comSubmit.addParam("searchOp3", searchOp3);
		comSubmit.submit();
	}

	function fn_openBoardWrite() {
		var comSubmit = new ComSubmit();
		window.open('http://localhost:8080/Dot_tea/com_or/orderBoardWrite.tea',
				'_blank');
		comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/openBoardDetail.tea' />");
		comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
		comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
				"#ORDER_DETAIL_NO").val());
		comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();
	}
	/*    function fn_selectBoardList(pageNo) {
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

</div>
</body>
</html>


