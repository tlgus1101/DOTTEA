<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<script>
	var locked = 0;
	function show(RE_STAR) {
		if (locked)
			return;
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
		var stateMsg;

		for (i = 1; i <= RE_STAR; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "${pageContext.request.contextPath}/images/star_1.png"
		}
		switch (RE_STAR) {
		case 1:
			stateMsg = "더럽게 맛 없어요."
			break;
		case 2:
			stateMsg = "아쉽네요."
			break;
		case 3:
			stateMsg = "무난했어요."
			break;
		case 4:
			stateMsg = "기대 이상이에요."
			break;
		case 5:
			stateMsg = "대박 JMT."
			break;
		default:
			stateMsg = "";
		}
		e.innerHTML = stateMsg;
	}
	function noshow(RE_STAR) {
		if (locked)
			return;
		var i;
		var image;
		var el;

		for (i = 1; i <= RE_STAR; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "${pageContext.request.contextPath}/images/star_0.png";
		}
	}
	function lock(RE_STAR) {
		show(RE_STAR);
		locked = 1;
	}
	function mark(RE_STAR) {
		lock(RE_STAR);
		document.cmtform.RE_STAR.value = RE_STAR;
	}
</script>




</head>
<body>
	<c:if test="${idSession != null}">
		<form action="/Dot_tea/teaDeal/insertstarts.tea" method="post"
			name="cmtform">
			<c:if test="${typeSession == 1}">
				<table width="700">
					<tr>
						<td width="100" rowspan="2"></td>
						<td width="500" height="50" colspan="2">
							<div id=rating align=center>
								<span> <img id=image1 onmouseover=show(1) onclick=mark(1)
									onmouseout=noshow(1)
									src="${pageContext.request.contextPath}/images/star_0.png"
									width="30ox" height="30px"> <img id=image2
									onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2)
									src="${pageContext.request.contextPath}/images/star_0.png"
									width="30ox" height="30px"> <img id=image3
									onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3)
									src="${pageContext.request.contextPath}/images/star_0.png"
									width="30ox" height="30px"> <img id=image4
									onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4)
									src="${pageContext.request.contextPath}/images/star_0.png"
									width="30ox" height="30px"> <img id=image5
									onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5)
									src="${pageContext.request.contextPath}/images/star_0.png"
									width="30ox" height="30px">
								</span> <br /> <span id=startext>후기 남기기</span>
							</div> <input type="hidden" name="RE_STAR" />
						</td>


						<td width="100" rowspan="2"><span><input type="submit"
								name="submit" class="btn" value="후기 입력"
								style="width: 150px; height: 80px; font-size: 20px; background-color: #eee9f1; border: 0; outline: 0; color: black;"></span></td>


						<input type=hidden name="DEAL_NO" value="${DEAL_NO }" />
						<input type=hidden name="MEM_USER_USERID" value="${idSession }" />
					</tr>

					<tr>
						<td width="500" height="100" colspan="2"><textarea
								name="RE_SUBJECT" cols="65" rows="7"></textarea></td>
					</tr>
					</c:if>
					<c:if test="${typeSession == 2}">
						<tr>
							<td colspan="4">기업은 후기 입력 불가</td>
						</tr>
					</c:if>
				</table>
		</form>
	</c:if>
	<br>
	<br>
	<table class="board_list">
		<c:if test="${typeSession != 1}">
			<br>
			<br>
			<div class="head_aticle">
				<h2 class="tit" align="center">개인 회원 로그인시 후기 작성 가능합니다.</h2>
			</div>
			<br>
		</c:if>

		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td rowspan="3" width="100" align="center"
							style="background-color: #eee9f1; color: #532074;">${row.MEM_USER_USERID }님의<br>
							후기
						</td>
						<td width="550" height="20"><font size="5" border="border">${row.MEM_USER_USERID }</font>&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="1">${row.RE_DATE }</font>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#this" class="bhs_button active" name="police">신고하기<input
								type="hidden" id="RE_NO" value="${row.RE_NO }">
						</a></td>

					</tr>
					<tr>
						<td colspan="2" width="600"><c:forEach begin="1"
								end="${row.RE_STAR}">
								<img src="${pageContext.request.contextPath}/images/star_1.png"
									width="30ox" height="30px">
							</c:forEach></td>




					</tr>
					<tr>
						<td height="100" colspan="2">${row.RE_SUBJECT }</td>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>

	<c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo="${paginationInfo}" type="text"
			jsFunction="fn_search" />
	</c:if>
	<input type="hidden" id="currentPageNo" name="currentPageNo" />
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='police']").on("click", function(e) { //신고 버튼
				e.preventDefault();
				fn_openBoardPolice($(this));
			});
		});

		function fn_openBoardPolice(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_re/policeWrite.tea' />");
			comSubmit.addParam("RE_NO", obj.parent().find("#RE_NO").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>