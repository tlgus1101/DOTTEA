<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<form id="frm">
	<br> <br>
	<div class="head_aticle">
		<h2 class="tit" align="center">주문서 상세</h2>
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
			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">주문번호</td>
				<td>${map.OR_NO}</td>
			</tr>
			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">기업ID</td>
				<td>${map1.MEM_COM_ID}</td>
			</tr>
			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">회원번호</td>
				<td>${map.MEM_USER_NO}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">제품번호</td>
				<td>${map.DEAL_NO}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">이 름</td>
				<td>${map.OR_NAME}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">주소</td>
				<td>${map.OR_AD}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">우편번호</td>
				<td>${map.OR_ADN}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">결제방법</td>
				<td>${map.OR_PAY}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">상품 이름</td>
				<td>${map1.DEAL_TITLE}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">상품 가격</td>
				<td>${map1.DEAL_PRICE}</td>
			</tr>
			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">상품 갯수</td>
				<td>${map1.B_COUNT}</td>
			</tr>

			<tr align="center">
				<td style="background-color: #eee9f1; color: #532074">비 고</td>
				<td><c:if test="${map.OR_STATUS == 1}">
									취소 요청</c:if> <c:if test="${map.OR_STATUS == 2}">
									반품 신청</c:if> <c:if test="${map.OR_STATUS == 3}">
									교환 신청</c:if> <c:if test="${map.OR_STATUS == 4}">
									상품준비중</c:if> <c:if test="${map.OR_STATUS == 5}">
									배송중</c:if> <c:if test="${map.OR_STATUS == 6}">
									완 료</c:if> <c:if test="${map.OR_STATUS == 7}">
									취 소</c:if> <c:if test="${map.OR_STATUS == 8}">
									반 품</c:if> <c:if test="${map.OR_STATUS == 9}">
									교 환</c:if></td>
			</tr>
	</table>
</form>

<br>
<c:if test="${map.OR_STATUS == 1}">
	<a href="#this" class=" bhs_button
					active" id="list">목록으로</a>
	<a href="#this" class=" bhs_button
					active" id="delete">취소확인</a>
</c:if>
<c:if test="${map.OR_STATUS == 7}">
	<a href="#this" class=" bhs_button
					active" id="list">목록으로</a>
</c:if>
<c:if test="${map.OR_STATUS == 2}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
	<a href="#this" class="bhs_button
					active" id="return">반품확인</a>
</c:if>
<c:if test="${map.OR_STATUS == 8}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
</c:if>

<c:if test="${map.OR_STATUS == 3}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
	<a href="#this" class="bhs_button
					active" id="change">교환확인</a>
</c:if>

<c:if test="${map.OR_STATUS == 9}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
</c:if>

<c:if test="${map.OR_STATUS == 4}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
	<a href="#this" class="bhs_button
					active" id="write">배송입력</a>
</c:if>

<c:if test="${map.OR_STATUS == 5}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
	<a href="#this" class="bhs_button
					active" id="update">배송완료</a>
</c:if>
<c:if test="${map.OR_STATUS == 6}">
	<a href="#this" class="bhs_button
					active" id="list">목록으로</a>
</c:if>




<!--        
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="write">배송입력</a>
    <a href="#this" class="btn" id="update">배송확정</a>
     <a href="#this" class="btn" id="delete">취소확인</a>
      <a href="#this" class="btn" id="change">교환확인</a>
       <a href="#this" class="btn" id="return">반품확인</a>  -->

<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) {
			e.preventDefault();
			fn_openBoardList();
		});

		$("#update").on("click", function(e) {
			e.preventDefault();
			fn_updateBoard();
		});
		$("#write").on("click", function(e) { //배송입력 버튼
			e.preventDefault();
			fn_openBoardWrite();
		});
		$("#delete").on("click", function(e) { //주문취소 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
		$("#change").on("click", function(e) { //교환확인 버튼
			e.preventDefault();
			fn_changeBoard();
		});
		$("#return").on("click", function(e) { //반품확인 버튼
			e.preventDefault();
			fn_returnBoard();
		});
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit
				.setUrl("<c:url value='/com_or/openBoardList.tea?MEM_COM_NO=${NOSession}' />");
		comSubmit.submit();
	}

	function fn_updateBoard() {
		var OR_NO = "${map.OR_NO}";
		var DEAL_NO = "${map.DEAL_NO}";
		var ORDER_DETAIL_NO = "${map.ORDER_DETAIL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/updateBoard.tea' />");
		comSubmit.addParam("OR_NO", OR_NO);
		comSubmit.addParam("DEAL_NO", DEAL_NO);
		comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
		comSubmit.submit();
	}
	function fn_openBoardWrite() {
		var OR_NO = "${map.OR_NO}";
		var ORDER_DETAIL_NO = "${map.ORDER_DETAIL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/orderBoardWrite.tea' />");
		comSubmit.addParam("OR_NO", OR_NO);
		comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
		/* comSubmit.addParam("DEAL_NO", DEAL_NO); */
		/* 	comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val());
			comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val()); */
		comSubmit.submit();
	}

	function fn_deleteBoard() {
		var OR_NO = "${map.OR_NO}";
		var DEAL_NO = "${map.DEAL_NO}";
		var ORDER_DETAIL_NO = "${map.ORDER_DETAIL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/updateBoard7.tea' />");
		comSubmit.addParam("OR_NO", OR_NO);
		comSubmit.addParam("DEAL_NO", DEAL_NO);
		comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
		comSubmit.submit();
	}

	function fn_changeBoard() {
		var OR_NO = "${map.OR_NO}";
		var DEAL_NO = "${map.DEAL_NO}";
		var ORDER_DETAIL_NO = "${map.ORDER_DETAIL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/updateBoard9.tea' />");
		comSubmit.addParam("OR_NO", OR_NO);
		comSubmit.addParam("DEAL_NO", DEAL_NO);
		comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
		comSubmit.submit();
	}

	function fn_returnBoard() {
		var OR_NO = "${map.OR_NO}";
		var DEAL_NO = "${map.DEAL_NO}";
		var ORDER_DETAIL_NO = "${map.ORDER_DETAIL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/com_or/updateBoard8.tea' />");
		comSubmit.addParam("OR_NO", OR_NO);
		comSubmit.addParam("DEAL_NO", DEAL_NO);
		comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
		comSubmit.submit();
	}
</script>
</body>
</html>