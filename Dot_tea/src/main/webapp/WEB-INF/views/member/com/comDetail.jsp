<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>

<br>
<br>
<div class="head_aticle">
	<h2 class="tit" align="center">상품 상세보기</h2>
</div>
<br>
<div id="tab2" class="tab_content">
	<div class="innerTab2">
		<table class="board_list">
			<colgroup>
				<col width="10%">
				<col width="30%" />
				<col width="10%" />
				<col width="20%" />
				<col width="25%" />
			</colgroup>
			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">상품명</th>
				<td>${map.DEAL_TITLE}</td>
			</tr>
			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">가 격</th>
				<td>${map.DEAL_PRICE}</td>
			</tr>
			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">용량/중량</th>
				<td>${map.DEAL_VOL}</td>
			</tr>

			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">단위</th>
				<td>${map.DEAL_UNIT}</td>
			</tr>

			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">원산지</th>
				<td>${map.DEAL_ORG}</td>
			</tr>

			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">재고 수량</th>
				<td>${map.DEAL_COUNT}</td>
			</tr>

			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">상품 소개</th>
				<td>

					<div id="imageSetting"></div> <script type="text/javascript">
						imagesSet();
						function imagesSet() {
							var body = document.getElementById("imageSetting");
							var img = '${map.DEAL_IMGSV}';
							var imgList = img.split(",");
							var str = "";

							for (var i = 0; i < imgList.length; i++) {
								var src = "${pageContext.request.contextPath}/images/"
										+ imgList[i];

								str += "<a href='#this' name=image> <img "
									+"src='"+src+"'width='120ox'"
									+" height='110px'></a><input type='hidden' id='DEAL_NO' value='${row.DEAL_NO}'><br>";
							}
							body.innerHTML = str;
						}
					</script> ${map.DEAL_CONTENT}



				</td>
			</tr>

			<tr align="center">
				<th style="background-color: #eee9f1; color: #532074">추 천</th>
				<td>${map.DEAL_FAV}</td>
			</tr>

		</table>
	</div>
</div>

<span><a href="#this" class=" bhs_button
					active" id="list">목록으로</a></span>
<span><a href="#this" class=" bhs_button
					active"
	id="update">수정하기</a></span>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").on("click", function(e) {
			e.preventDefault();
			fn_openBoardList();
		});

		$("#update").on("click", function(e) {
			e.preventDefault();
			fn_openBoardUpdate();
		});
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit
				.setUrl("<c:url value='/shop/openBoardList.tea?MEM_COM_ID=${idSession}' />");
		comSubmit.submit();
	}

	function fn_openBoardUpdate() {
		var DEAL_NO = "${map.DEAL_NO}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/openBoardUpdate.tea' />");
		comSubmit.addParam("DEAL_NO", DEAL_NO);
		comSubmit.submit();
	}
</script>
</body>
</html>