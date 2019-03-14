<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>

	<div class="page_section section_myinfo">
		<br> <br>

		<div class="head_aticle">
			<h2 class="tit" align="center">배송 입력</h2>
		</div>
		<br> <br>
		<form id="frm" name="frm">
			<table class="board_list">
				<colgroup>
					<col width="20%">
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" style="background-color: #eee9f1; color: #532074">택배
							회사명</th>
						<td><input type="text" id="OR_DELIVERY" name="OR_DELIVERY"
							class="wdp_90"></input></td>
					</tr>
					<tr>
						<th scope="row" style="background-color: #eee9f1; color: #532074">운송장번호</th>
						<td><input type="text" id="OR_WAY" name="OR_WAY"
							class="wdp_90"></input></td>
					</tr>
				</tbody>
			</table>

			<br /> <br /> <span><a href="#this"
				class="bhs_button active" id="write">입 력</a></span>

		</form>
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
			var OR_NO = "${OR_NO}";
			var MEM_COM_NO = "${MEM_COM_NO}";
			var ORDER_DETAIL_NO = "${ORDER_DETAIL_NO}";

			var comSubmit = new ComSubmit("frm");
			comSubmit
					.setUrl("<c:url value='/com_or/insertBoard.tea?MEM_COM_NO=${NOSession}' />");
			comSubmit.addParam("OR_NO", OR_NO);
			comSubmit.addParam("MEM_COM_NO", MEM_COM_NO);
			comSubmit.addParam("ORDER_DETAIL_NO", ORDER_DETAIL_NO);
			comSubmit.submit();
		}
	</script>
</body>
</html>