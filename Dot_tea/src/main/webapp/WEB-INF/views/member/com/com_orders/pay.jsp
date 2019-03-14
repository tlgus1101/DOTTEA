<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js"
	type="application/javascript"></script>
<script type="text/javascript" src="/Dot_tea/resources/jquery-3.js"></script>

</head>

<body>

	<script type="text/javascript">
		BootPay.request({
			price : '1000',
			application_id : '5c4ace09b6d49c227ee2a9ed',
			name : '블링블링 마스카라',
			pg : 'danal',
			show_agree_window : 0,
			items : [ {
				item_name : '나는 아이템',
				qty : 1,
				unique : '123',
				price : 1000,
				cat1 : 'TOP',
				cat2 : '티셔츠',
				cat3 : '라운드 티',
			} ],
			user_info : {
				username : '사용자 이름',
				email : '사용자 이메일',
				addr : '사용자 주소',
				phone : '010-1234-4567'
			},
			method : 'card',
			order_id : '고유order_id_1234',
			params : {
				callback1 : '그대로 콜백받을 변수 1',
				callback2 : '그대로 콜백받을 변수 2',
				customvar1234 : '변수명도 마음대로'
			},
		}).error(function(data) {
			console.log(data);
		}).cancel(function(data) {
			console.log(data);
		}).confirm(function(data) {
			console.log(data);
			if (somthing) {
				this.transactionConfirm(data);
			} else {
				this.removeWindow();
			}
		}).done(function(data) {
			console.log(data);
		});
	</script>

</body>
</html>