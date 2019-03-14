<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<script>
	$(window).scroll(function() {
		$('#banner').animate({
			top : $(window).scrollTop() + "px"
		}, {
			queue : false,
			duration : 500
		});
	});
</script>
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/normalize.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section1.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section2.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/common.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/css/goods_style.css?ver=201901141354">


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
	<div class="page_section section_myinfo">
		<br> <br>
		<div class="head_aticle">
			<br> <br> <br>
			<h2 class="tit" align="center">비밀번호 확인</h2>
			<br> <br> <br>
		</div>
		<center>
			<form id="frm" name="frm">
				<div class="boardWrite">
					<table class="tbl_comm">
						<colgroup>
							<col width="20%">
							<col width="*" />
							<col width="20" />
						</colgroup>
						<tbody>
							<tr>
								<td scope="row" class="memberCols1">비밀번호&nbsp;&nbsp;&nbsp;</td>
								<td><input type="password" id="MEM_COM_PASSWORD"
									name="MEM_COM_PASSWORD" class="wdp_90"></input></td>
								<td><span><a href="#this" id="write" name="return">
											<span class="bhs_button active" style="float: center;">확
												인</span>
									</a></span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</center>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
			$(document).ready(function() {
				$("#write").on("click", function(e) { //작성하기 버튼
					e.preventDefault();
					fn_insertBoard();
				});
			});

			function fn_insertBoard() {
				/* var QA_NO = "${map.QA_NO}"; */
				var COM_PASSWORD = "${map.MEM_COM_PASSWORD}";
				var COM_PASSC = $("#MEM_COM_PASSWORD").val();
				var comSubmit = new ComSubmit("frm");

				if (COM_PASSC != COM_PASSWORD) {
					alert("비밀번호가 틀렸습니다.");
				} else {
					comSubmit
							.setUrl("<c:url value='/com_setting/deleteSetting.tea' />");
					/* comSubmit.addParam("_NO", QA_NO); */
					comSubmit.submit();
				}
			}
		</script>
</body>
</html>