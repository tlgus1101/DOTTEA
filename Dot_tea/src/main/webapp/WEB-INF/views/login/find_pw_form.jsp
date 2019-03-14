<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 찾기</title>
</head>
<body>
	<!-- 
	
	submit을 눌렀을 때!!!!!!
		1. NoOne의 값이 1이다 -> 해당하는 정보가 없습니다.
			(기준 입력한 email & Id를 한 번에 만족시키는 email 값이 null인지 리턴되었는지)
		2. 기업이메일 발송했으면 Success화면으로 넘어가도록 만들기
	
	-->

	<div class="layout-bg">
		<div class="layout-wrapper">
			<div class="login_wrap_outer">

				<form action="findPw.tea" method="post" id="form_findPw" name="form_findPw">
					<div
						class="xans-element- xans-member xans-member-login login_wrap ">
						<h2 class="layout-page-title">비밀번호 찾기</h2>
						<div class="login">
							<div>
								<input type="radio" name="memberType" value="1" checked="checked">
								개인 회원 비밀번호&nbsp;<input type="radio" name="memberType" value="2">
								기업 회원 비밀번호
							</div>
							<ul class="text">
								<li></li>
								<li><span>ID</span></li>
							</ul>
							<ul>
								<li></li>
								<li><input style="max-width: none; width: 380px"
									type="text" tabindex="1" id="inputID"
									name="inputID" size="100" required
									placeholder="ID를 입력해주세요."></li>
							</ul>
							<br />
							<ul class="text">
								<li></li>
								<li><span>Email</span></li>
							</ul>
							<ul>
								<li></li>
								<li><input style="max-width: none; width: 380px"
									type="text" tabindex="1" id="inputEmail"
									name="inputEmail" size="100" required
									placeholder="예: teamarket@teamarket.tea"></li>
							</ul>
						</div>
						<div class="login_button">
							<ul>
								<li><button type="submit" id="findBtn" 
										class="bhs_button">임시비밀번호 발급</button>
								</li>
								<li>
									<button type="button" onclick="history.go(-1);"
										class="bhs_button">취소</button>
								</li>
							</ul>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js">
	</script>
	
	<script type="text/javascript">
	
	var inputID = document.form_findPw.inputID.value;
	var inputEmail = document.form_findPw.inputEmail.value;
	

 	$(document).ready(function() {
 		$(document).ready(function(e) {
			fn_alertF();
		});
 		
 		function fn_alertF() {
			var NoOne = <c:out value="${NoOne}"/>;
			if(NoOne == 1){
				alert("가입 정보가 없습니다.");
			}
		}
 		
		$("findBtn").on("click",
				function(e) {
				e.preventDefault();
				var inputID = document.form_findPw.member_id.value;
				var inputEmail = document.form_findPw.member_email.value;
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
								
				if(inputID.length > 2){
					alert("2보다 큼");
					temp(inputID, inputEmail);
				}else{	
					chk_id_Callback();
				}
			});
			

		});
	
	function buttonS() {
		alert("버튼눌림!!"+document.form_findPw.member_id.value);
		temp();
		if(inputID.length > 2){
		//	temp();
		}else{	
		//	chk_id_Callback();
		}
	}
	
	
    function temp() {
    	var memberType = document.form_findPw.memberType.value;
		var inputID = document.form_findPw.member_id.value;
		var inputEmail = document.form_findPw.member_email.value;
		alert(inputEmail);
		
        var comAjax = new ComAjax();
        comAjax.setUrl("<c:url value='/login/findPw.tea'/>");
        comAjax.setCallback("ck_user_Id_Callback");
        comAjax.addParam("inputID", inputID);
        comAjax.addParam("inputEmail", inputEmail);
        comAjax.addParam("memberType", memberType);
        comAjax.ajax();
     }
	
	
    function chk_id_Callback(data) {
        var body = document.getElementById("ch_id_div");
        body.innerHTML = "";
        if (data == null) {
           var str = "<tr><td>*아이디는 3자 이상 가능 합니다.</td></tr>";
           idCk = 0;
           body.innerHTML = str;
        } else {
           var total = data.TOTAL4;
           if (total == 0) {
              var str = "<tr><td>*사용 가능한 아이디 입니다.</td></tr>";
              idCk = 1;
              body.innerHTML = str;
           } else {
              var str = "<tr><td>*이미 사용 중인 아이디 입니다.</td></tr>";
              idCk = 0;
              body.innerHTML = str;
           }
        }  
     }
 
		
	</script>
</body>