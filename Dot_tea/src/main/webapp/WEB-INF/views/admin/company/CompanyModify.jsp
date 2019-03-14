<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf"%>
<link rel="stylesheet" href="/Dot_tea/resources/css/user/userForm.css">
<head>
<style>
body {
	background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
}

.wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	/*  margin: 20px auto;
	max-width: 100px;
	text-decoration: none;  */
	/* border-radius: 4px; */
	padding: 5px 5px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
/* 
a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
} */
#button {
	background: #f6f6f6;
	color: #11111;
	width: 100px;
	height: 30px;
	border: 0;
	font-size: 15px;
	border-radius: 4px;
	font-family: 'Noto sans KR', sans-serif;
	-webkit-transition: .6s;
	transition: .6s;
	overflow: hidden;
	cursor: pointer;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="ContextJoinForm" align="center">
		<h1 class="page-header">회원 정보 수정</h1>
		<div class="orderArea">

			<div class="boardWrite">
				<form id="jform" name="jform">

					<table border="1" summary="" style="width: 60%">

						<tbody>
						<tbody>

							<tr>
								<th scope="row">아이디</th>
								<td>${map.MEM_COM_ID}<input type="hidden" id="MEM_COM_NO"
									name="MEM_COM_NO" value="${map.MEM_COM_NO }"> <input
									type="hidden" id="MEM_COM_ID" name="MEM_COM_ID"
									value="${map.MEM_COM_ID }">
								</td>
							</tr>


							<tr>
								<th scope="row">비밀번호</th>
								<td><input name="MEM_COM_PASSWORD" type="text"
									value="${map.MEM_COM_PASSWORD}" required
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">회사명</th>
								<td><input name="MEM_COM_NAME" type="text"
									value="${map.MEM_COM_NAME}" required style="font-size: 15px">
								</td>
							</tr>

							<tr>
								<th scope="row">대표자</th>
								<td><input name="MEM_COM_OWNER" type="text"
									value="${map.MEM_COM_OWNER}" required style="font-size: 15px">
								</td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">사업자등록번호</th>
								<td class="memberCols2">
									<div class="phone_num">
										<input type="text" value="${map.MEM_COM_RESI}" autofocus pattern="[0-9]*"
											name="MEM_COM_RESI" id="MEM_COM_RESI" 
											class="inp"> <a
											href="#this" id="resi_find" class="button" style="font-size: 10px">사업자 번호 확인</a>
											<table>
											<thead id="ch_resi_div"></thead>
											</table>
									</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row" class="memberCols1">통신 판매 번호</th>
								<td class="memberCols2">
									<div class="phone_num">
										<input type="text" value="${map.MEM_COM_COMNUM}" name="MEM_COM_COMNUM"
											id="MEM_COM_COMNUM" 
											class="inp"> <a href="#this" id="comNum"
											class="button" style="font-size: 10px">통신판매 번호 확인</a>
											<table>
												<tfoot id="ch_sellNumber_div"></tfoot>
											</table>
									</div>
								</td>
							</tr>
							
						<!-- 	<tr>
										<td align="center" colspan="3"><table>
												<tfoot id="ch_sellNumber_div"></tfoot>
											</table></td>
							</tr> -->
							
							<tr>
								<th scope="row">기업 연락처</th>
								<td><input name="MEM_COM_COMPANY_PHONE" type="tel"
									value="${map.MEM_COM_COMPANY_PHONE}" autocomplete="off"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">담당자 연락처</th>
								<td><input name="MEM_COM_MANAGER_PHONE" type="tel"
									value="${map.MEM_COM_MANAGER_PHONE}" autocomplete="off"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">팩스</th>
								<td><input name="MEM_COM_FAX" type="tel"
									value="${map.MEM_COM_FAX}" autocomplete="off"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">기업 메일 주소</th>
								<td><input name="MEM_COM_COMPANY_EMAIL" type="email"
									value="${map.MEM_COM_COMPANY_EMAIL}" required
									autocomplete="off" style="font-size: 15px"></td>
							</tr>


							<tr>
								<th scope="row">담당자 메일 주소</th>
								<td><input name="MEM_COM_MANAGER_EMAIL" type="email"
									value="${map.MEM_COM_MANAGER_EMAIL}" required
									autocomplete="off" style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">우편번호</th>
								<td class="memberCols2"><input type="text"
									name="MEM_COM_ZIPCODE" id="MEM_COM_ZIPCODE"
									value="${map.MEM_COM_ZIPCODE}" style="font-size: 15px">
									<a href="#this" id="btnAddressSearch" name="btnAddressSearch"
									class="button" style="font-size: 10px">주소 검색</a></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">지번주소</th>
								<td><input type="text" name="MEM_COM_ZIBUNADDR"
									id="MEM_COM_ZIBUNADDR" value="${map.MEM_COM_ZIBUNADDR}"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">도로명주소</th>
								<td><input type="text" name="MEM_COM_LOADADDR"
									id="MEM_COM_LOADADDR" value="${map.MEM_COM_LOADADDR}"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">상세주소</th>
								<td><input type="text" name="MEM_COM_DETAILADDR"
									id="MEM_COM_DETAILADDR" value="${map.MEM_COM_DETAILADDR}"
									style="font-size: 15px"></td>
							</tr>


							<tr>
								<th scope="row">배달비 무료 커트라인</th>
								<td><input type="text" id="MEM_COM_DELIVERYFREE"
									name="MEM_COM_DELIVERYFREE"
									value="${map.MEM_COM_DELIVERYFREE }" autofocus
									style="font-size: 15px" /></td>
							</tr>

							<tr>
								<th scope="row">수수료</th>
								<td><input type="text" id="MEM_COM_NET" name="MEM_COM_NET"
									value="${map.MEM_COM_NET }"  style="font-size: 15px" />
								</td>
							</tr>

							<tr>
								<th scope="row">기업 계좌번호</th>
								<td><input type="text" id="MEM_COM_ACCOUNT"
									name="MEM_COM_ACCOUNT" value="${map.MEM_COM_ACCOUNT }"
									autofocus style="font-size: 15px" /></td>
							</tr>

							<tr>
								<th scope="row">신고 누적횟수</th>
								<td><input type="text" id="MEM_COM_BLACK"
									name="MEM_COM_BLACK" value="${map.MEM_COM_BLACK }" autofocus
									style="font-size: 15px" /></td>
							</tr>


						</tbody>
					</table>
				</form>
			</div>

			<!-- <input value="회원 수정하기" type="button" id="button" onclick="javascript:ajaxJoinUpdateView();"/> -->
			<br> <a href="#this" class="button" id="update">회원 수정</a> <a
				href="#this" class="button" id="list">목록</a>

		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-bodyAdmin.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
				chkForm(a);
			});

			$("#btnAddressSearch").on("click", function(e) {
				e.preventDefault();
				addCk = 0;
				zipCheck();
			});

			$("#resi_find").on("click", function(e) {
				e.preventDefault();
				var body = document.getElementById("ch_resi_div");
				body.innerHTML = "";
				resiCk = 0;
				companyResi();
			});

			$("#comNum").on("click", function(e) {
				e.preventDefault();
				var body = document.getElementById("ch_sellNumber_div");
				body.innerHTML = "";
				companySellNumber();
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/CompanyList.tea' />");
			comSubmit.submit();
		}

		function fn_updateBoard() {
			var comSubmit = new ComSubmit("jform");
			comSubmit.setUrl("<c:url value='/admin/CompanyModify.tea' />");
			comSubmit.submit();
		}

		function zipCheck() {
			var body = document.getElementById("ch_zip_div");
			var str = "";
			addCk = 0;
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.jform.MEM_COM_ZIBUNADDR.value = data.jibunAddress;
							document.jform.MEM_COM_ZIPCODE.value = data.zonecode;
							document.jform.MEM_COM_LOADADDR.value = data.roadAddress;

							str += "<tr><td class='memberCols1'>우편 번호</td><td class='memberCols2'><input type='text'"
	               +"name='MEM_COM_ZIPCODE' id='MEM_COM_ZIPCODE' option='regId' value='"+data.zonecode+"'/></td></tr>";
							str += "<tr><td class='memberCols1'> 지번 주소 </td><td class='memberCols2'><input type='text'"
	               +"name='MEM_COM_ZIBUNADDR' id='MEM_COM_ZIBUNADDR' option='regId' value='"+data.jibunAddress+"'/></td></tr>";
							str += "<tr><td class='memberCols1'>도로명 주소 </td><td class='memberCols2'><input type='text'"
	               +"name='MEM_COM_LOADADDR' id='MEM_COM_LOADADDR' option='regId' value='"+data.roadAddress+"'/></td></tr>";
							str += "<tr><td class='memberCols1'>상세 주소 </td><td class='memberCols2'><input type='text'"
	                  +"name='MEM_COM_DETAILADDR' id='MEM_COM_DETAILADDR' option='regId' value=''/></td></tr>";

						}
					}).open();
		}

		function companySellNumber() {
			var name = document.jform.MEM_COM_OWNER.value;
			var number = document.jform.MEM_COM_RESI.value;

			if (document.jform.MEM_COM_RESI.value == ""
					|| document.jform.MEM_COM_RESI.value.length != 10) {
				alert("사업자번호를 입력후  통신판매 검사를 해주세요. ");
				document.jform.MEM_COM_RESI.focus();
			} else if (document.jform.MEM_COM_COMNUM.value == "") {
				alert("통신판매 번호를 입력후 검사를 해주세요. ");
				document.jform.MEM_COM_COMNUM.focus();
			} else {
				var body = document.getElementById("ch_sellNumber_div");
				body.innerHTML = "<input type='hidden' name='name' id='name' value="
					+ name + ">"
				body.innerHTML = "<input type='hidden' name='number' id='number' value="
					+ number + ">"

				var comAjax = new ComAjax();
				comAjax
						.setUrl("<c:url value='/join/companyJoinForm.tea/findSellingNumber.tea'/>");
				comAjax.setCallback("ck_sellingNumber_Callback");
				comAjax.addParam("name", name);
				comAjax.addParam("number", number);
				comAjax.ajax();
			}
		}

		function companyResi() {
			var name = document.jform.MEM_COM_NAME.value;
			var number = document.jform.MEM_COM_RESI.value.substr(0, 6);
			if (document.jform.MEM_COM_RESI.value == null
					|| document.jform.MEM_COM_RESI.value.length != 10) {
				alert("올바르지 않은 사업자번호 입니다.");
				document.jform.MEM_COM_RESI.focus();
			} else {
				var body = document.getElementById("ch_resi_div");
				body.innerHTML = "<input type='hidden' name='name' id='name' value="
					+ name + ">"
				body.innerHTML = "<input type='hidden' name='number' id='number' value="
					+ number + ">"

				var comAjax = new ComAjax();
				comAjax
						.setUrl("<c:url value='/join/companyJoinForm.tea/findResi.tea'/>");
				comAjax.setCallback("ck_resi_Callback");
				comAjax.addParam("name", name);
				comAjax.addParam("number", number);
				comAjax.ajax();
			}
		}
	</script>
</body>
</html>