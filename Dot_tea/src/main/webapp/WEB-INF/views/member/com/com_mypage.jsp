<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
<script type="text/javascript" src="/Dot_tea/resources/jquery-3.js"></script>
<script type="text/javascript">
	function openWin() {

		var url = '${pageContext.request.contextPath}'
				+ "/com_setting/settingDetail.tea?MEM_COM_NO=" + '${NOSession}';
		window
				.open(url, "비밀번호 확인",
						"width=auto, heigth=auto, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>
</head>
<body>
	<h2 class="tit_snb">마이페이지</h2>
	<!-- 	<div class="inner_snb">
		<ul class="list_menu">
			<li class="on"><a href="/shop/mypage/mypage_orderlist.php">주문
					내역</a></li>
			<li><a href="/shop/mypage/mypage_wishlist.php">늘 사는 것</a></li>
			<li><a href="/shop/mypage/mypage_review.php">상품후기</a></li>
			<li><a href="/shop/mypage/mypage_emoney.php">적립금</a></li>
			<li><a href="/shop/mypage/mypage_coupon.php">쿠폰</a></li>
			<li><a href="/shop/member/myinfo.php">개인 정보 수정</a></li>
		</ul>
	</div>

	<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna"
		class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1
		문의하기</a>

	<div id="viewOrderList" class="page_section section_orderlist">
		<div class="head_aticle">
			<h2 class="tit">
				주문 내역 <span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
			</h2>
		</div>
	
		<ul class="list_order">
			<li class="no_data">주문내역이 없습니다.</li>
		</ul>
		
	</div> -->

	<table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="*" />
		</colgroup>
		<tbody>
			<br>

			<li class="on"><a
				href="${path}/Dot_tea/shop/openBoardList.tea?MEM_COM_ID=${idSession}">상품
					관리</a></li>
			<br>
			<li><a
				href="${path}/Dot_tea/com_or/openBoardList.tea?MEM_COM_NO=${NOSession}">주문/배송조회</a></li>
			<br>

			<li><a
				href="${path}/Dot_tea/com_re/openBoardList.tea?MEM_COM_ID=${idSession}">후기
					관리</a></li>
			<br>
			<li><a
				href="${path}/Dot_tea/com_qna/openQnAList.tea?MEM_COM_ID=${idSession}">Q/A
					관리</a></li>
			<br>

			<li><a href="javascript:openWin();">설 정</a></li>
</body>
</html>