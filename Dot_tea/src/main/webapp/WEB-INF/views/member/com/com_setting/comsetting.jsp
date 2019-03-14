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
	<script>
		alert('정보 수정 완료');
	</script>
	<div class="page_section section_myinfo">
		<div class="head_aticle">
			<br> <br> <br>
			<h2 class="tit" align="center">개인 정보 수정 완료</h2>
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
		<div class="member_join">
			<div class="">
				<form id="form" name="frmMember" method="post">

					<div class="field_head head_type1">
						<h3 class="tit">회원정보</h3>
					</div>
					<div class="boardWrite">
						<table class="tbl_comm">
							<tbody>
								<tr>
									<td scope="row" class="memberCols1">기업 ID</td>
									<td>${map.MEM_COM_ID}</td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">대표자</td>
									<td>${map.MEM_COM_OWNER}</td>
								</tr>

								<tr class="mobile">
									<td scope="row" class="memberCols1">담당자 연락처</td>
									<td>${map.MEM_COM_MANAGER_PHONE}</td>
								</tr>

								<tr class="birth">
									<td class="memberCols1">담당자 이메일</td>
									<td>${map.MEM_COM_MANAGER_EMAIL}</td>
								</tr>

							</tbody>
						</table>
					</div>


					<div class="field_head head_type1">
						<h3 class="tit">기업 정보</h3>
					</div>
					<div class="boardWrite">
						<table class="tbl_comm">
							<tbody>
								<tr>
									<td scope="row" class="memberCols1">사업자명</td>
									<td>${map.MEM_COM_OWNER}</td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">사업장명</td>
									<td>${map.MEM_COM_NAME}</td>
								</tr>

								<tr class="birth">
									<td class="memberCols1">기업 이메일</td>
									<td>${map.MEM_COM_COMPANY_EMAIL}</td>
								</tr>
								<tr>
									<td scope="row" class="memberCols1">사업자번호</td>
									<td>${map.MEM_COM_RESI}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">통신판매번호</td>
									<td>${map.MEM_COM_COMNUM}</td>
								</tr>


								<tr class="mobile">
									<td scope="row" class="memberCols1">기업 연락처</td>
									<td>${map.MEM_COM_COMPANY_PHONE}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">팩스</td>
									<td>${map.MEM_COM_FAX}</td>
								</tr>

								<tr class="birth">
									<td class="memberCols1">배송비 커트라인</td>
									<td>${map.MEM_COM_DELIVERYFREE}</td>
								</tr>
								<tr class="birth">
									<td class="memberCols1">계좌번호</td>
									<td>${map.MEM_COM_ACCOUNT}</td>
								</tr>
								<tr class="birth">
									<td class="memberCols1">수수료</td>
									<td>${map.MEM_COM_NET}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">우편번호</td>
									<td>${map.MEM_COM_ZIPCODE}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">지번주소</td>
									<td>${map.MEM_COM_ZIBUNADDR}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">도로명주소</td>
									<td>${map.MEM_COM_ZIBUNADDR}</td>
								</tr>

								<tr>
									<td scope="row" class="memberCols1">상세주소</td>
									<td>${map.MEM_COM_DETAILADDR}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="avoidDbl" class="after"
						style="text-align: center; float: center; margin-top: 20px; margin-left: 20%;">
						<span><a href="#this" id="return" name="return"> <span
								class="bhs_button active" style="float: center;">닫 기</span>
						</a></span> <br> <br> <br> <br> <br>
					</div>
					<br> <br> <br> <br> <br>
				</form>
			</div>
		</div>
		<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display: none;"></iframe>
		<iframe id="ifrmHpauth" name="ifrmHpauth" style="display: none;"></iframe>
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

		});

		function fn_infoBoardUpdate() {
			var idx = "${NOSession}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/infoupdate.tea' />");
			comSubmit.addParam("MEM_USER_NO", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>




