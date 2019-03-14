<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>
	<form name="frm">
		<br> <br>
		<div class="head_aticle">
			<h2 class="tit" align="center">월별 매출</h2>
		</div>
		<br>
		<table class="board_list">
			<%-- 		<colgroup>
			<col width="5%" />
			<col width="5" />
			<col width="5%" />
		</colgroup> --%>
			<thead>
				<tr style="background-color: #eee9f1; color: #532074">
					<th>년도/월</th>
					<th>기업명</th>
					<th>월 매출액</th>

				</tr>
			</thead>
			<thead>
				<div style="padding: 2px 30px">
					<input type="text" size="20"
						style="text-align: left; width: 50px; height: 25px" id="yearC"
						name="yearC" value="${yearC }">년
				</div>
				<div style="padding: 2px 30px">
					<c:forEach begin="01" end="12" var="monC">
						<div
							style="text-align: center; width: 8%; height: 25px; float: left">
							<a href="#this" type="button" id="monthC" name="monthC"
								class="button1"
								style="text-align: center; width: 45px; height: 25px"> <input
								type="hidden" id="monC" value="${monC }"> ${monC}월
							</a>
						</div>
					</c:forEach>
				</div>
			</thead>
			<tbody>

			</tbody>
		</table>
		<br> <span><a href="#this" class=" bhs_button active"
			id="List">주문목록</a></span> <span> <a href="#this"
			class=" bhs_button
					active" id="Day">일(매출)</a>
		</span>

	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_perMonth($(this));
			$("a[name='monthC']").on("click", function(e) {
				e.preventDefault();
				fn_perMonth($(this));
			});

			$("#List").on("click", function(e) {
				e.preventDefault();
				fn_openBoardList();
			});

			$("#Day").on("click", function(e) { //일별
				e.preventDefault();
				fn_openBoardDay();
			});
		});

		function fn_perMonth(obj) {
			month = obj.parent().find("#monC").val();

			if (month < 10) {
				month = "0" + month;
			}

			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/com_or/com_MonthAjax.tea' />");
			comAjax.setCallback("calculationListCallback");
			comAjax.addParam("yearC", document.frm.yearC.value);
			comAjax.addParam("monC", month);
			comAjax.ajax();
		}

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/com_or/openBoardList.tea?MEM_COM_NO=${NOSession}' />");
			/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
			comSubmit.submit();
		}

		function fn_openBoardDay() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_or/com_Day.tea' />");
			/* comSubmit.addParam("OR_NO", obj.parent().find("#OR_NO").val()); */
			comSubmit.submit();
		}

		function calculationListCallback(data) {

			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr><td align='center' colspan='3'><span class='name'>"
						+ "정산 할 기업이 존재하지 않습니다.</span></td></tr>";
				body.append(str);

			} else {

				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "ComAjax"
				};

				var str = "";

				$.each(data.list, function(key, value) {
					str += "<tr><td>" + value.YM + "</td>" + "<td>"
							+ value.MEM_COM_NAME + "</td>" + "<td>"
							+ value.CALCULATION + "</td></tr>";

				});

				body.append(str);

				$("a[name='MEM_COM_ID']").on("click", function(e) { // 제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}

		}
	</script>
</body>
</html>