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
								<td>${map.MEM_USER_USERID} <input type="hidden"
									id="MEM_USER_NO" name="MEM_USER_NO" value="${map.MEM_USER_NO }">
									<input type="hidden" id="MEM_USER_USERID"
									name="MEM_USER_USERID" value="${map.MEM_USER_USERID }">
								</td>
							</tr>


							<tr>
								<th scope="row">비밀번호</th>
								<td><input name="MEM_USER_PASSWORD" type="text"
									value="${map.MEM_USER_PASSWORD}" required
									style="font-size: 15px"></td>
							</tr>


							<tr>
								<th scope="row">이름</th>
								<td><input name="MEM_USER_USERNAME" type="text"
									value="${map.MEM_USER_USERNAME}" required
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">연락처</th>
								<td><input name="MEM_USER_PHONE" type="tel"
									value="${map.MEM_USER_PHONE}" autocomplete="off"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">생년월일</th>
								<td>${map.MEM_USER_BIRTH1 }</td>
							</tr>

							<tr>
								<th scope="row">메일 주소</th>
								<td><input name="MEM_USER_USEREMAIL" type="email"
									value="${map.MEM_USER_USEREMAIL}" required autocomplete="off"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">우편번호</th>
								<td class="memberCols2"><input type="text"
									name="MEM_USER_ZIPCODE" id="MEM_USER_ZIPCODE"
									value="${map.MEM_USER_ZIPCODE}" style="font-size: 15px">
									<a href="#this" id="btnAddressSearch" name="btnAddressSearch"
									class="button" style="font-size: 10px">주소 검색</a></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">지번주소</th>
								<td><input type="text" name="MEM_USER_ZIBUNADDR"
									id="MEM_USER_ZIBUNADDR" value="${map.MEM_USER_ZIBUNADDR}"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">도로명주소</th>
								<td><input type="text" name="MEM_USER_LOADADDR"
									id="MEM_USER_LOADADDR" value="${map.MEM_USER_LOADADDR}"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row" class="memberCols1">상세주소</th>
								<td><input type="text" name="MEM_USER_DETAILADDR"
									id="MEM_USER_DETAILADDR" value="${map.MEM_USER_DETAILADDR}"
									style="font-size: 15px"></td>
							</tr>

							<tr>
								<th scope="row">신고 누적횟수</th>
								<td><input type="text" id="MEM_USER_BLACK"
									name="MEM_USER_BLACK" value="${map.MEM_USER_BLACK }" autofocus
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
		$(document)
				.ready(
						function() {
							$("#list").on("click", function(e) { //목록으로 버튼
								e.preventDefault();
								fn_openBoardList();
							});

							$("#update").on("click", function(e) { //저장하기 버튼
								e.preventDefault();
								fn_updateBoard();

							});

							$("#btnAddressSearch").on("click", function(e) {
								e.preventDefault();
								addCk = 0;
								zipCheck();

							});

							function fn_openBoardList() {
								var comSubmit = new ComSubmit();
								comSubmit
										.setUrl("<c:url value='/admin/BlUserList.tea' />");
								comSubmit.submit();
							}

							function fn_updateBoard() {
								var comSubmit = new ComSubmit("jform");
								comSubmit
										.setUrl("<c:url value='/admin/BlUserModify.tea' />");
								comSubmit.submit();
							}

							function zipCheck() {
								var body = document
										.getElementById("ch_zip_div");
								var str = "";
								addCk = 0;
								new daum.Postcode(
										{
											oncomplete : function(data) {
												document.jform.MEM_USER_ZIBUNADDR.value = data.jibunAddress;
												document.jform.MEM_USER_ZIPCODE.value = data.zonecode;
												document.jform.MEM_USER_LOADADDR.value = data.roadAddress;

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

						});
	</script>
</body>
</html>