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
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true);
	String id = request.getParameter("id");
	request.getSession().setAttribute("id", id);
			
%>
<title>회원 정보 수정</title>
</head>
<body>

<div class="page_section section_myinfo">
<div class="head_aticle">
<br><br><br>
<h2 class="tit" align="center">개인 정보 수정</h2>
</div>
<style>
	/* 회원정보수정일때 */
	.member_join .reg_agree,
	.member_join .boardWrite{padding:0 20px 12px;border-top:2px solid #6a3664;border-bottom:1px solid #dddfe1;font-size:11px;color:#747474;line-height:20px}
	.member_join .field_head.head_type1{margin-top:-3px;padding-top:0}
	.member_join .mobile td.memberCols2{padding-bottom:10px} 
</style>
<div class="member_join">
<div class="">
<form id="formInfo" name="formInfo" method="post" action="infoupdate.tea">

<div class="field_head head_type1">
<h3 class="tit">기본정보</h3>
<p class="sub"></p>
</div>
<div class="boardWrite">
<table class="tbl_comm">
<tbody>
<input type="hidden" id="Id" name="Id"
					value="${sessionScope.Id }" >
<tr>
<td scope="row" class="memberCols1">아이디</td>
<td class="memberCols2">
<input type="text" value="${map.MEM_USER_USERID }" readonly >
<input type="hidden" value="${NOSession}" id="MEM_USER_NO" name="MEM_USER_NO">
</td>
</tr>
<tr>
<td scope="row" class="memberCols1">새 비밀번호</td> 
<td class="memberCols2">
<input type="password" name="MEM_USER_PASSWORD" id="MEM_USER_PASSWORD" value="${map.MEM_USER_PASSWORD}" label="새 비밀번호" option="regPass" maxlength="16" class="reg_pw">
<p class="txt_guide">
<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span>
<span class="txt txt_case1">10자 이상 입력</span>
<span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
<span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
</p>
</td>
</tr>
<tr>
<td scope="row" class="memberCols1">새 비밀번호 확인</td>
<td class="memberCols2">
<input type="password" name="MEM_USER_PASSWORD2" id="MEM_USER_PASSWORD2"
 oninput="value=value.slice(0,20);$(this).val($(this).val().replace(/[^0-9,a-z,!-@]]/g,''));"
 label="새 비밀번호" option="regPass" maxlength="16" onkeyup="pwPress()" class="confirm_pw">
</td>

</tr>
<tr>
<td> </td>
<td><div name="ch_pw_div" id="ch_pw_div"></div></td>
</tr>
<tr>
<td scope="row" class="memberCols1">이름</td>
<td class="memberCols2">
<input type="text" name="MEM_USER_USERNAME" id="MEM_USER_USERNAME" value="${map.MEM_USER_USERNAME}" placeholder="예: 김닷티">
</td>
</tr>
<tr>
<td scope="row" class="memberCols1"> 이메일</td>
<td class="memberCols2">
<input type="text" name="MEM_USER_USEREMAIL" id="MEM_USER_USEREMAIL" value="${map.MEM_USER_USEREMAIL }" placeholder="예: dot_tea@dattea.tea">
<a href="#this" onclick="chk_user_email()" id="chk_user_email"><span class="bhs_button">이메일 중복확인</span></a>
</td>
</tr>
<tr>
<td></td><td><div id="ch_email_div"></div></td>
</tr>
<tr class="mobile">
<td scope="row" class="memberCols1"> 휴대폰</td>
<td class="memberCols2">
<div class="phone_num">
<input type="text" name="MEM_USER_PHONE" id="MEM_USER_PHONE" value="${map.MEM_USER_PHONE}" pattern="[0-9]*" oninput="if(value.length>11)value=value.slice(0,11);$(this).val($(this).val().replace(/[^0-9]/g,''));" placeholder="'-' 없이 숫자만 입력해주세요.">
</div>
</td>
</tr>

<tr>
<td scope="row" class="memberCols1"> 우편번호</td>
<td class="memberCols2">
<input type="text" name="MEM_USER_ZIPCODE" id="MEM_USER_ZIPCODE" value="${map.MEM_USER_ZIPCODE}" >
<a href="#this" id="btnAddressSearch" name="btnAddressSearch">
<span class="bhs_button">주소 검색</span></a>
</td>
</tr>

<tr>
<td scope="row" class="memberCols1"> 지번주소</td>
<td>
<input type="text" name="MEM_USER_ZIBUNADDR" id="MEM_USER_ZIBUNADDR" value="${map.MEM_USER_ZIBUNADDR}">
</td>
</tr>

<tr>
<td scope="row" class="memberCols1"> 도로명주소</td>
<td>
<input type="text" name="MEM_USER_LOADADDR" id="MEM_USER_LOADADDR" value="${map.MEM_USER_LOADADDR}">
</td>
</tr>

<tr>
<td scope="row" class="memberCols1"> 상세주소</td>
<td>
<input type="text" name="MEM_USER_DETAILADDR" id="MEM_USER_DETAILADDR" value="${map.MEM_USER_DETAILADDR}">
</td>
</tr>
<tr class="birth">
<td class="memberCols1">생년월일</td>
<td class="memberCols2">
<div class="birth_day">
<input type="text" name="birth_year" id="birth_year" value="${birth_year}" size="4" maxlength="4">
<span class="bar"><span>/</span></span>
<input type="text" name="birth_month" id="birth_month" value="${birth_month}" size="2" maxlength="2">
<span class="bar"><span>/</span></span>
<input type="text" name="birth_day" id="birth_day" value="${birth_day}" size="2" maxlength="2">
<input type="hidden" name="MEM_USER_BIRTH" id="MEM_USER_BIRTH">
</div>
</td>
</tr>
</tbody></table>
</div>
<div id="avoidDbl" class="after" style="text-align:center; float:left; margin-top:20px; margin-left:20%;">
<span><a href="#this" id="return" name="return">
<span class="bhs_button active" style="float:left;">취 소</span>
</a></span>
<span><a href="javascript:fn_infodelete('<c:url value="/member/infodelete.tea" />');" >
<span class="bhs_button active" style="float:none;">탈퇴하기</span>
</a></span>
<span>
<input type="submit" class="bhs_button" value="회원정보수정" style="float:none; max-width:none;"></span>
<br><br><br><br><br>
</div>
<br><br><br><br><br>
</form>
</div>
</div>
<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display:none;"></iframe>
<iframe id="ifrmHpauth" name="ifrmHpauth" style="display:none;"></iframe>
</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js">
   </script>
	<script type="text/javascript">
		$(document).ready(function() {
			var addCk = 0;
			
/* 			alert("hi : "+${sessionScope.Id}) */
			$("#return").click(function() {
				window.close();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
				e.preventDefault();
				fn_infoBoardUpdate();
			});
			
			// 주소 검색
			$("#btnAddressSearch").on("click", function(e) {
                e.preventDefault();
                addCk = 0;
                zipCheck();
             });
			
			// 이메일 확인
            $("#chk_user_email")
            .on(
                  "click",
                  function(e) {
                     e.preventDefault();
                     var inputUserEmail = document.formInfo.MEM_USER_USEREMAIL.value;
                     u_email = 0;
                     if (inputUserEmail.length > 2) {
                    	 alert(inputUserEmail);
                        chk_user_email(inputUserEmail);
                     } else {
                        ck_Email_Callback();
                     }
                  });

		});

		function fn_infoBoardUpdate() {
			var idx = "${NOSession}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/infoupdate.tea' />");
			comSubmit.addParam("MEM_USER_NO", idx);
			comSubmit.submit();
		}

		function fn_infodelete(URL){
			if (window.opener && !window.opener.closed)
				{
				alert("회원 탈퇴 완료");
				}
			window.opener.location = URL;
			window.close();
		}
		
		function zipCheck() {
	         var body = document.getElementById("ch_zip_div");
	         var str = "";
	         addCk = 0;
	         new daum.Postcode(
	               {
	                  oncomplete : function(data) {
	         	         document.formInfo.MEM_USER_ZIBUNADDR.value = data.jibunAddress;
	         	         document.formInfo.MEM_USER_ZIPCODE.value= data.zonecode;
	         	         document.formInfo.MEM_USER_LOADADDR.value = data.roadAddress;

	                     str += "<tr><td class='memberCols1'>우편 번호</td><td class='memberCols2'><input type='text'"
	               +"name='MEM_USER_ZIPCODE' id='MEM_USER_ZIPCODE' option='regId' value='"+data.zonecode+"'/></td></tr>";
	                     str += "<tr><td class='memberCols1'> 지번 주소 </td><td class='memberCols2'><input type='text'"
	               +"name='MEM_USER_ZIBUNADDR' id='MEM_USER_ZIBUNADDR' option='regId' value='"+data.jibunAddress+"'/></td></tr>";
	                     str += "<tr><td class='memberCols1'>도로명 주소 </td><td class='memberCols2'><input type='text'"
	               +"name='MEM_USER_LOADADDR' id='MEM_USER_LOADADDR' option='regId' value='"+data.roadAddress+"'/></td></tr>";
	                     str += "<tr><td class='memberCols1'>상세 주소 </td><td class='memberCols2'><input type='text'"
	                  +"name='MEM_USER_DETAILADDR' id='MEM_USER_DETAILADDR' option='regId' value=''/></td></tr>";

	                  }
	               }).open();
	      }
		
	      function pwPress() {
	          var body = document.getElementById("ch_pw_div");
	          var pw1 = document.formInfo.MEM_USER_PASSWORD.value;
	          var pw2 = document.formInfo.MEM_USER_PASSWORD2.value;
	          body.innerHTML = "";
	          if (pw1 == pw2 && pw1.length != 0) {
	             var str = "<tr><td>*비밀번호가 일치합니다.</td></tr>";
	             pwCk = 1;
	             body.innerHTML = str;
	          } else if (pw2.length == 0) {
	             var str = "<tr><td> </td></tr>";
	             pwCk = 0;
	             body.innerHTML = str;
	          } else {
	             var str = "<tr><td>*입력하신 비밀번호가 일치하지 않습니다. </td></tr>";
	             pwCk = 0;
	             body.innerHTML = str;
	          }
	       }
	      
	      
	      function chk_user_email(inputUserEmail) {
	          var comAjax = new ComAjax();
	          comAjax.setUrl("<c:url value='/member/chekEmail.tea'/>");
	          comAjax.setCallback("ck_Email_Callback");
	          comAjax.addParam("inputUserEmail", inputUserEmail);
	          comAjax.ajax();
	       }
	      
	      var aaa = "";
	      function ck_Email_Callback(data2) {
	         var body = document.getElementById("ch_email_div");
	         body.innerHTML = "";
	         if (data2 == null) {
	            var str = "<tr><td>*이메일을 입력해주세요.</tr></td>";
	            body.innerHTML = str;
	         } else {
	            var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	            if (exptext
	                  .test(document.formInfo.MEM_USER_USEREMAIL.value) == false) {
	               var str = "<tr><td>*이메일 형식이 올바르지 않습니다.<tr><td>";
	               u_email = 0;
	               body.innerHTML = str;
	            } else {
	               var total = data2.TOTAL5;
	               if (total == 1) {
	                  var str = "<tr><td>*이미 사용 중인 이메일입니다.</tr></td>";
	                  u_email = 0;
	                  body.innerHTML = str;
	               } else {
	                  var cf_em = data2.keySet;
	                  aaa = cf_em;
	                  var str = "<tr><td><input type='text'"
	                     +"name='comfirm_em_input' id='comfirm_em_input' maxlength='16'"
	                     +"placeholder='인증 번호를 입력하세요.' /> <a href='#this'"
	                           + " id='comfirm_e' name = 'comfirm_e' "
	                           + "'><span class='bhs_button'>인증확인</span></a></td></tr>";
	                  body.innerHTML = str;
	                  
	                  $("#comfirm_e").on(
	                        "click",
	                        function(e) {
	                           e.preventDefault();
	                           var body = document
	                                 .getElementById("ch_email_div");
	                           var temp = document.formInfo.comfirm_em_input.value;
	                           alert("인증 번호가 일치 하지 않습니다." + aaa);
	                           if (temp == aaa) {
	                        	   u_email = 1;
	                              alert("인증 번호가 일치 합니다.");
	                              body.innerHTML = "";
	                           } else {
	                              alert("인증 번호가 일치 하지 않습니다.");
	                           }
	                        });

	               }
	            }
	         }
	      }

	</script>
</body>
</html>
