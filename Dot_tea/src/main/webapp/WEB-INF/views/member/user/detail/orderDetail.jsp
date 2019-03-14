<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>
	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">게시글 상세</h2>
	</div>
	<br>
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
				<td>${map.OR_NO }</td>
				<th scope="row" style="background-color: #eee9f1; color: #532074">회원
					번호</th>
				<td>${map.MEM_USER_NO }</td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee9f1; color: #532074">주문자
					이름</th>
				<td>${map.OR_NAME }</td>
				<th scope="row" style="background-color: #eee9f1; color: #532074">연락처</th>
				<td>${map.OR_PHON }</td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee9f1; color: #532074">주소</th>
				<td>${map.OR_AD }</td>
				<th scope="row" style="background-color: #eee9f1; color: #532074">우편번호</th>
				<td>${map.OR_ADN }</td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee9f1; color: #532074">결제방법</th>
				<td>${map.OR_PAY }</td>
				<th scope="row" style="background-color: #eee9f1; color: #532074">가격</th>
				<td>${map.OR_PRICE }</td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee9f1; color: #532074">주문
					날짜</th>
				<td>${map.OR_DATE }</td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee9f1; color: #532074">주문
					상품 리스트</th>
				<td colspan="3"><table class="board_list">
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="15%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<thead>

							<tr>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">주문번호</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">상품번호</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">상품명</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">가 격</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">구매 갯수</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">배송상태</th>
								<th scope="col"
									style="background-color: #eee9f1; color: #532074">상태 설정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.OR_NO }</td>
									<td class="title"><a href="#this" name="title">${row.DEAL_NO }</a>
										<input type="hidden" id="OR_NO" value="${row.OR_NO }">
										<input type="hidden" id="DEAL_NO" value="${row.DEAL_NO}">
										<input type="hidden" id="MEM_COM_NO"
										value="${row.MEM_COM_NO }"></td>
									<td><a href="#this" name="title">${row.DEAL_TITLE }</a><input
										type="hidden" id="OR_NO" value="${row.OR_NO }"> <input
										type="hidden" id="DEAL_NO" value="${row.DEAL_NO}"> <input
										type="hidden" id="MEM_COM_NO" value="${row.MEM_COM_NO }"></td>
									<td>${row.DEAL_PRICE }</td>
									<td>${row.B_COUNT }</td>
									<c:if test="${row.OR_STATUS == 4 }">
										<td>배송준비중</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 5 }">
										<td>배송중</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 6 }">
										<td>완 료</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 1}">
										<td>취소대기중</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 7}">
										<td>취 소</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 2}">
										<td>반품 대기중</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 3}">
										<td>교환 대기중</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 8}">
										<td>반 품</td>
									</c:if>
									<c:if test="${row.OR_STATUS == 9}">
										<td>교 환</td>
									</c:if>

									<c:if test="${row.OR_STATUS == 4}">
										<td><a href="#this" class="bhs_button active"
											name="cancel">주문취소<input type="hidden"
												id="ORDER_DETAIL_NO" value="${row.ORDER_DETAIL_NO}"></a></td>
									</c:if>
									<c:if test="${row.OR_STATUS == 5}">
										<td><a href="#this" class="bhs_button active"
											name="cancel">주문취소<input type="hidden"
												id="ORDER_DETAIL_NO" value="${row.ORDER_DETAIL_NO }"></a></td>
									</c:if>
									<c:if test="${row.OR_STATUS == 6}">
										<td><a href="#this" class="bhs_button active"
											name="return">반품신청<input type="hidden"
												id="ORDER_DETAIL_NO" value="${row.ORDER_DETAIL_NO }"></a>
											<a href="#this" class="bhs_button active" name="change">교환신청<input
												type="hidden" id="OR_NO" value="${row.OR_NO }"></a></td>
									</c:if>
								</tr>
							</c:forEach>

						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
	<br>
	<span><a href="#this" class="bhs_button"
		style="background-color: #eee9f1; color: #532074" active" id="list">목록으로</a></span>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_orderBoardList();
			});

			$("a[name='return']").on("click", function(e) {
				e.preventDefault();
				fn_return($(this));
			});

			$("a[name='cancel']").on("click", function(e) {
				e.preventDefault();
				fn_cancel($(this));
			});

			$("a[name='change']").on("click", function(e) {
				e.preventDefault();
				fn_change($(this));
			});

			$("a[name=title]").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				teaDealDetail($(this));
			});

			/*  $("#cancel").on("click", function(e){
			     e.preventDefault();
			     fn_ordercancel();
			 }); */
		});

		function fn_cancel(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderCancel.tea' />");
			comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
					"#ORDER_DETAIL_NO").val());
			comSubmit.submit();
		}

		function fn_return(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderReturn.tea' />");
			comSubmit.addParam("ORDER_DETAIL_NO", obj.parent().find(
					"#ORDER_DETAIL_NO").val());
			comSubmit.submit();
		}

		function fn_change(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/orderChange.tea' />");
			comSubmit.addParam("OR_NO", obj.parent().find("#ORDER_DETAIL_NO")
					.val());
			comSubmit.submit();
		}

		function teaDealDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea'/>");
			comSubmit.addParam("NO", obj.parent().find("#DEAL_NO").val());
			comSubmit.submit();
		}

		function fn_orderBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/mypage.tea' />");
			comSubmit.submit();
		}

		/* function fn_ordercancel(){
		    var idx = "${map.OR_NO}";
		    var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
		    comSubmit.addParam("IDX", idx);
		    comSubmit.submit();
		} */
	</script>
</body>
</html>


