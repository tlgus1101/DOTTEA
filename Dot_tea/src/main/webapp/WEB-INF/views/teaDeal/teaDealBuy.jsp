<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
		$(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp44739730'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용 https://admin.iamport.kr/payments

			IMP
					.request_pay(
							{
								pg : 'inicis', // version 1.1.0부터 지원.
								pay_method : 'card',
								merchant_uid : 'merchant_'
										+ new Date().getTime(),
								name : '주문명:${buyDealNameSession}',
								amount : '${buyDealPriceSession}',
								buyer_email : '${member.MEM_USER_USEREMAIL}',
								buyer_name : '${member.MEM_USER_USERNAME}',
								buyer_tel : '${member.MEM_USER_PHONE}',
								buyer_addr : '${member.MEM_USER_ZIBUNADDR}'
										+ '${member.MEM_USER_DETAILADDR}',
								buyer_postcode : '${member.MEM_USER_ZIPCODE}',
								m_redirect_url : 'https://www.yourdomain.com/payments/complete'
							},
							function(rsp) {
								if (rsp.success) {
									var msg = '결제가 완료되었습니다.';
									msg += '고유ID : ' + rsp.imp_uid;
									msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '결제 금액 : ' + rsp.paid_amount;
									msg += '카드 승인번호 : ' + rsp.apply_num;

									document.frm.rsp.value = rsp.paid_amount;

									document.frm.submit();

								} else {
									var msg = '결제에 실패하였습니다.';
									msg += '에러내용 : ' + rsp.error_msg;
									location.href = "${pageContext.request.contextPath}/member/teaBasketList.tea";
								}
							});
		});
	</script>

	<form
		action="${pageContext.request.contextPath}/member/teaDealBuyInsert.tea"
		method="POST" name="frm">
		<input type="hidden" value="${B_NOList }" name="B_NOList"
			id="B_NOList"> <input type="hidden" value="${rsp }"
			name="rsp" id="rsp"> <input type="hidden" value="${IMP }"
			name="IMP" id="IMP">
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<strong>고객님의 상품이 결제되고 있습니다.</strong>
	</center>
	<center>
		<p>
			<img alt=""
				src="${pageContext.request.contextPath}/images/market/Dot_tea.png">
		</p>
	</center>
	<center>
		<p>
			<img alt=""
				src="${pageContext.request.contextPath}/images/market/img_loading.gif">
		</p>
	</center>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>