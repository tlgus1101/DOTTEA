<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
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
			<br> <br> <br>
			<h2 class="tit" align="center">개인 정보 수정</h2>
		</div>
		<style>
/* 회원정보수정일때 */
.member_join .reg_agree, .member_join .boardWrite {
	padding: 0 20px 12px;
	border-top: 2px solid #6a3664;
	border-bottom: 1px solid #dddfe1;
	font-size: 11px;
	color: #747474;
	line-height: 20px
}

.member_join .field_head.head_type1 {
	margin-top: -3px;
	padding-top: 0
}

.member_join .mobile td.memberCols2 {
	padding-bottom: 10px
}
</style>
		<form id="formInfo" name="formInfo" method="post"
			action="${pageContext.request.contextPath}/com_setting/updateSetting.tea"
			onsubmit="return fn_updateBoard();">

			<div class="member_join">
				<div class="">

					<div class="field_head head_type1">
						<h3 class="tit">기본정보</h3>
						<p class="sub"></p>
					</div>
					<div class="boardWrite">
						<table class="tbl_comm">
							<tbody>
								<input type="hidden" id="Id" name="Id"
									value="${sessionScope.Id }">
								<input type="hidden" id="MEM_COM_NO" name="MEM_COM_NO"
									value="${map.MEM_COM_NO}">
								<tr>
									<td scope="row" class="memberCols1">기업 ID</td>
									<td class="memberCols2"><input type="text"
										value="${map.MEM_COM_ID }" readonly> <input
										type="hidden" value="${NOSession}" id="MEM_COM_ID"
										name="MEM_COM_ID"></td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">PASSWORD</td>
									<td class="memberCols2"><input type="password"
										name="MEM_COM_PASSWORD" id="MEM_COM_PASSWORD"
										value="${map.MEM_COM_PASSWORD }" label="새 비밀번호"
										option="regPass" maxlength="16" class="reg_pw">
										<p class="txt_guide">
											<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span> <span
												class="txt txt_case1">10자 이상 입력</span> <span
												class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상
												조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
										</p></td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">PASSWORD 확인</td>
									<td class="memberCols2"><input type="password"
										name="MEM_COM_PASSWORDC" id="MEM_COM_PASSWORDC"
										oninput="value=value.slice(0,20);$(this).val($(this).val().replace(/[^0-9,a-z,!-@]]/g,''));"
										label="새 비밀번호" option="regPass" maxlength="16"
										onkeyup="pwPress()" class="confirm_pw"></td>

								</tr>
								<tr>
									<td></td>
									<td><div name="ch_pw_div" id="ch_pw_div"></div></td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">대표자</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_OWNER" id="MEM_COM_OWNER"
										value="${map.MEM_COM_OWNER }"></td>
								</tr>


								<tr class="mobile">
									<td scope="row" class="memberCols1">담당자 담당자</td>
									<td class="memberCols2">
										<div class="phone_num">
											<input type="text" name="MEM_COM_MANAGER_PHONE"
												id="MEM_COM_MANAGER_PHONE"
												value="${map.MEM_COM_MANAGER_PHONE}" pattern="[0-9]*"
												oninput="if(value.length>11)value=value.slice(0,11);$(this).val($(this).val().replace(/[^0-9]/g,''));"
												placeholder="'-' 없이 숫자만 입력해주세요.">
										</div>
									</td>
								</tr>

								<tr>
									<td class="memberCols1">담당자 이메일</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_MANAGER_EMAIL"
										value="${map.MEM_COM_MANAGER_EMAIL }"
										id="MEM_COM_MANAGER_EMAIL" value="" size="30"
										option="regEmail" label="이메일"
										placeholder="예: marketkurly@kurly.com"> <a
										href="#this" id="chk_email"><span class="bhs_button">이메일
												중복확인</span></a></td>
								</tr>


								<tr>
									<td colspan="1"></td>
									<td colspan="2"><div name="ch_email_div" id="ch_email_div"></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div class="field_head head_type1">
						<h3 class="tit">사업자 정보</h3>
						<p class="sub"></p>
					</div>

					<div class="boardWrite">
						<table class="tbl_comm">
							<tbody>
								<input type="hidden" id="Id" name="Id"
									value="${sessionScope.Id }">

								<tr>
									<td scope="row" class="memberCols1">대표자</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_NAME" id="MEM_COM_NAME"
										value="${map.MEM_COM_NAME }"></td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">사업자번호</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_RESI" id="MEM_COM_RESI"
										value="${map.MEM_COM_RESI }" readonly></td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">통신판매번호</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_COMNUM" id="MEM_COM_COMNUM"
										value="${map.MEM_COM_COMNUM }" readonly></td>
								</tr>

								<tr class="mobile">
									<td scope="row" class="memberCols1">기업 전화번호</td>
									<td class="memberCols2">
										<div class="phone_num">
											<input type="text" name="MEM_COM_COMPANY_PHONE"
												id=MEM_COM_COMPANY_PHONE
												value="${map.MEM_COM_COMPANY_PHONE}" pattern="[0-9]*"
												oninput="if(value.length>11)value=value.slice(0,11);$(this).val($(this).val().replace(/[^0-9]/g,''));"
												placeholder="'-' 없이 숫자만 입력해주세요.">
										</div>
									</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">팩스</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_FAX" id="MEM_COM_FAX"
										value="${map.MEM_COM_FAX }"></td>
								</tr>


								<tr>
									<td class="memberCols1">사업장 이메일*</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_COMPANY_EMAIL" id="MEM_COM_COMPANY_EMAIL"
										value="${map.MEM_COM_COMPANY_EMAIL }" size="30"
										placeholder="예: marketkurly@kurly.com"> <a
										href="#this" id="chk_com_email"> <span class="bhs_button">이메일
												중복확인</span></a></td>
								</tr>

								<tr>
									<td colspan="1"></td>
									<td colspan="2"><div name="ch_email_div2"
											id="ch_email_div2"></div></td>
								</tr>


								<tr>
									<td scope="row" class="memberCols1">우편번호</td>
									<td class="memberCols2"><input type="text"
										name="MEM_COM_ZIPCODE" id="MEM_COM_ZIPCODE"
										value="${map.MEM_COM_ZIPCODE}"> <a href="#this"
										id="btnAddressSearch" name="btnAddressSearch"> <span
											class="bhs_button">주소 검색</span></a></td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">지번주소</td>
									<td><input type="text" name="MEM_COM_ZIBUNADDR"
										id="MEM_COM_ZIBUNADDR" value="${map.MEM_COM_ZIBUNADDR}">
									</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">도로명주소</td>
									<td><input type="text" name="MEM_COM_LOADADDR"
										id="MEM_COM_LOADADDR" value="${map.MEM_COM_LOADADDR}">
									</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">상세주소</td>
									<td><input type="text" name="MEM_COM_DETAILADDR"
										id="MEM_COM_DETAILADDR" value="${map.MEM_COM_DETAILADDR}">
									</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">배송비 커트라인</td>
									<td><input type="text" name="MEM_COM_DELIVERYFREE"
										id="MEM_COM_DELIVERYFREE" value="${map.MEM_COM_DELIVERYFREE}">
									</td>
								</tr>


								<tr>
									<td scope="row" class="memberCols1">계좌번호</td>
									<td><input type="text" name="MEM_COM_ACCOUNT"
										id="MEM_COM_ACCOUNT" value="${map.MEM_COM_ACCOUNT}"></td>
								</tr>

							</tbody>
						</table>
					</div>


					<div id="avoidDbl" class="after"
						style="text-align: center; float: left; margin-top: 20px; margin-left: 20%;">
						<span><a href="#this" id="list" name="return"> <span
								class="bhs_button active" style="float: left;">취 소</span>
						</a></span> <span><a
							href="javascript:window.open('/Dot_tea/com_setting/deleteCheck.tea?MEM_COM_NO=${map.MEM_COM_NO }','pop','toolbar=no, status=no,resizeable=no ,width=500, height=300, left = 100,top=5')">
								<span class="bhs_button active" style="float: none;">탈퇴하기</span>
						</a></span> <span> <input type="submit" id="update" class="bhs_button"
							value="회원정보수정" style="float: none; max-width: none;"></span> <br>
						<br> <br> <br> <br>
					</div>
					<br> <br> <br> <br> <br>

				</div>
			</div>
		</form>
		<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display: none;"></iframe>
		<iframe id="ifrmHpauth" name="ifrmHpauth" style="display: none;"></iframe>
	</div>

	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js">
		
	</script>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#list").on("click", function(e) {
								e.preventDefault();
								window.close();
								//fn_openBoardList();
							});

							$("#delete").on("click", function(e) {
								e.preventDefault();
								fn_openBoardDelete();
							});

							// 주소 검색
							$("#btnAddressSearch").on("click", function(e) {
								e.preventDefault();
								addCk = 0;
								zipCheck();
							});

							// 이메일 확인
							$("#chk_email")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												var inputEmail = document.formInfo.MEM_COM_MANAGER_EMAIL.value;
												Man_email = 0;
												if (inputEmail.length > 2) {
													chk_email(inputEmail);
												} else {
													ck_Email_Callback();
												}
											});

							$("#chk_com_email")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												var inputEmail2 = document.formInfo.MEM_COM_COMPANY_EMAIL.value;
												com_email = 0;
												if (inputEmail2.length > 2) {
													chk_com_email(inputEmail2);
												} else {
													ck_Email_Callback2();
												}
											});

							/*     $("#delete").on("click", function(e){ 
							        e.preventDefault();
							        fn_deleteBoard();
							    }); */

						});

		function chk_email(inputEmail) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/join/chkMenEmail.tea'/>");
			comAjax.setCallback("ck_Email_Callback");
			comAjax.addParam("inputEmail", inputEmail);
			comAjax.ajax();
		}

		function chk_com_email(inputEmail2) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/join/chkComEmail.tea'/>");
			comAjax.setCallback("ck_Email_Callback2");
			comAjax.addParam("inputEmail2", inputEmail2);
			comAjax.ajax();
		}

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/com_setting/settingDetail.tea' />");
			comSubmit.submit();
		}
		function fn_openBoardDelete() {
			var idx = "${map.MEM_COM_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_setting/deleteCheck.tea' />");
			comSubmit.addParam("MEM_COM_NO", idx);
			comSubmit.submit();

		}

		function fn_updateBoard() {
			var MEM_COM_PASS = $("#MEM_COM_PASSWORD").val();
			var MEM_COM_PASSC = $("#MEM_COM_PASSWORDC").val();
			var MEM_COM_PASSWORD = "${map.MEM_COM_PASSWORD}";
			/* var MEM_COM_NO = "${MEM_COM_NO}"; */
			//var comSubmit = new ComSubmit("frm");
			if (MEM_COM_PASSC == "") {
				alert("비밀번호 확인 입력부탁드립니다.");
				//document.MemberComJoin.MEM_COM_ID.focus();
				document.formInfo.MEM_COM_PASSWORDC.focus();
				return false;
			}

			else if (MEM_COM_PASS != MEM_COM_PASSC) {
				alert("비밀번호가 일치하지 않습니다.");
				document.formInfo.MEM_COM_PASSWORDC.focus();
				return false;
			}
			/*  	else if(MEM_COM_PASSC == "")
			   	{
			   		alert("비밀번호 확인부분에 입력해주세요."); 
			   		
			   	} else {
				comSubmit
						.setUrl("<c:url value='/com_setting/updateSetting.tea' />");
				 comSubmit.addParam 
				comSubmit.submit();
			}*/
			return true;
		}

		function pwPress() {

			var body = document.getElementById("ch_pw_div");
			var pw1 = document.formInfo.MEM_COM_PASSWORD.value;
			var pw2 = document.formInfo.MEM_COM_PASSWORDC.value;
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

		/*     function fn_deleteBoard(){
		        var comSubmit = new ComSubmit();
		        comSubmit.setUrl("<c:url value='/admin/BlComDelete.tea' />");
		        comSubmit.addParam("MEM_COM_NO", $("#MEM_COM_NO").val());
		        comSubmit.submit();
		         
		    } */

		// 중복 확인
		function ck_Email_Callback(data2) {
			var body = document.getElementById("ch_email_div");
			body.innerHTML = " ";

			if (data2.BLACK == 1) {
				alert("회원 가입을 하실수 없습니다.");
				joinLoginOpen();

			} else {
				if (data2 == null) {
					var str = "<tr><td>*이메일을 입력해주세요.</tr></td>";
					body.innerHTML = str;
				} else {
					var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
					if (exptext
							.test(document.formInfo.MEM_COM_MANAGER_EMAIL.value) == false) {
						// alert(document.MemberComJoin.MEM_COM_MANAGER_EMAIL.value);
						Man_email = 0;
						var str = "<tr><td>*이메일 형식이 올바르지 않습니다.<tr><td>";
						body.innerHTML = str;
					} else {
						var total = data2.TOTAL2;
						if (total == 1) {
							var str = "<tr><td>*이미 사용 중인 이메일입니다.</tr></td>";
							Man_email = 0;
							body.innerHTML = str;
						} else {
							var str = "<tr><td>*사용 가능한 이메일입니다.</tr></td>";
							Man_email = 1;
							body.innerHTML = str;
						}
					}
				}
			}
		}
		// ----------------------------MANAGER email 확인 end -------------------------

		// ----------------------------COMPANY email 확인 -------------------------
		// function chk_com_email(inputEmail2) {
		// var comAjax = new ComAjax();
		// comAjax.setUrl("<c:url value='/join/chkComEmail.tea'/>");
		// comAjax.setCallback("ck_Email_Callback2");
		// comAjax.addParam("inputEmail2", inputEmail2);
		// comAjax.ajax();
		// }

		var aaa = "";
		/* COMPANY 회사 대표 이메일주소 검증식 */
		function ck_Email_Callback2(data3) {
			var body = document.getElementById("ch_email_div2");
			body.innerHTML = "";

			if (data3.BLACK == 1) {
				alert("회원 가입을 하실수 없습니다.");
				//window.exit();
				joinLoginOpen();

			} else {
				if (data3 == null) {
					var str = "<tr><td>*이메일을 입력해주세요.</tr></td>";
					body.innerHTML = str;
				} else {
					var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
					if (exptext
							.test(document.formInfo.MEM_COM_COMPANY_EMAIL.value) == false) {
						var str = "<tr><td>*이메일 형식이 올바르지 않습니다.<tr><td>";
						com_email = 0;
						body.innerHTML = str;
					} else {
						var total = data3.TOTAL3;
						if (total == 1) {
							var str = "<tr><td>*이미 사용 중인 이메일입니다.</tr></td>";
							com_email = 0;
							body.innerHTML = str;
						} else {
							var cf_em = data3.keySet;
							aaa = cf_em
							var str = "<br><input type='text'"
		    							+ "name='comfirm_em_input' id='comfirm_em_input' maxlength='16'"
		    							+ "placeholder='인증 번호를 입력하세요.' /> <a href='#this'"
		    							+ " id='comfirm_e' name = 'comfirm_e' "
		    							+ "'><span class='bhs_button'>인증확인</span></a>";
							body.innerHTML = str;

							$("#comfirm_e")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												var body = document
														.getElementById("ch_email_div2");
												var temp = document.formInfo.comfirm_em_input.value;

												if (temp == aaa) {
													com_email = 1;
													alert("인증 번호가 일치 합니다.");
													body.innerHTML = "";
												} else {
													alert("인증 번호가 일치 하지 않습니다."
															+ aaa);
													alert("인증 번호가 일치 하지 않습니다.");
												}
											});
						}
					}
				}
			}
		}

		function joinLoginOpen() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/loginForm.tea'/>");
			comSubmit.submit();
		}

		function zipCheck() {
			var body = document.getElementById("ch_zip_div");
			var str = "";
			addCk = 0;
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.formInfo.MEM_COM_ZIBUNADDR.value = data.jibunAddress;
							document.formInfo.MEM_COM_ZIPCODE.value = data.zonecode;
							document.formInfo.MEM_COM_LOADADDR.value = data.roadAddress;

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
	</script>


</body>
</html>