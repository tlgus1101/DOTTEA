<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품 리스트</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
</head>
<body>
	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">상품목록</h2>
	</div>
	<br>
	<div>
		<span><a href="${path}/Dot_tea/shop/openBoardWrite.tea"
			class=" bhs_button
					active" id="Month">상품등록</a></span> <br> <br>
		<br> <br> <br>
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
					<thead>
						<tr style="background-color: #eee9f1; color: #532074">
							<th scope="col">상품번호</th>
							<th scope="col">상품이미지</th>
							<th scope="col">상품명</th>
							<th scope="col">가 격</th>
							<th scope="col">날 짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:set var="i" value="0" />
								<c:forEach var="row" items="${list }">
									<tr>
										<td>${row.DEAL_NO}</td>


										<td class='image'>
											<div id="imageSetting${i }"></div> <script
												type="text/javascript">
												imagesSet('${i}',
														'${row.DEAL_IMGSV}');
												function imagesSet(i, img) {
													var name = "imageSetting"
															+ i;

													var body = document
															.getElementById(name);

													var imgList = img
															.split(",");

													var src = "${pageContext.request.contextPath}/images/"
															+ imgList[0];

													var str = "<a href='#this' name=image> <img "
									+"src='"+src+"'width='120ox'"
									+" height='110px'></a><input type='hidden' id='DEAL_NO' value='${row.DEAL_NO}'></td>";
													body.innerHTML = str;
												}
											</script>
										</td>
										<td class="title"><a href="#this" name=title>${row.DEAL_TITLE}
										</a><input type="hidden" id="DEAL_NO" value="${row.DEAL_NO}"><br>
											<c:if test="${row.DEAL_TYPE == 1}">
          									 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[찻입]
          									 	</c:if> <c:if test="${row.DEAL_TYPE == 2}">
          									 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[티팟]
          									 	</c:if> <c:if test="${row.DEAL_TYPE == 3}">
          									 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[악세서리]
          									 	</c:if> <c:if test="${row.DEAL_TYPE == 4}">
          									 	&nbsp;&nbsp;&nbsp;[이벤트 상품]
          									 	</c:if></td>

										<td>${row.DEAL_PRICE}</td>
										<td>${row.DEAL_DATE}</td>
									</tr>
									<c:set var="i" value="${i+1 }" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<input type="hidden" id="currentPageNo" name="currentPageNo" /> <br />
				<!-- 	<form action="">
						<select class="slcte" name="searchNum" id="searchNum">

							<option value="0">제목</option>
							<option value="1">내용</option>
						</select> <input class="txte" type="text" name="isSearch" id="isSearch" />
						<span class="btn btnC_03 btnP_04 mr10"> <input
							type="submit" value="검색"
							style="font-size: 11px; padding-bottom: 20; vertical-align: middle;" />
						</span>
					</form> -->
			</div>
		</div>
	</div>
	<c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo="${paginationInfo}" type="text"
			jsFunction="fn_search" />
	</c:if>
	<input type="hidden" id="currentPageNo" name="currentPageNo" />

	<%@ include file="/WEB-INF/include/include-body2.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='image']").on("click", function(e) { //이미지
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/openBoardDetail.tea'/>");
			comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
			comSubmit.submit();
		}
		function fn_search(pageNo) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/openBoardList.tea' />");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
	</script>
</body>
</html>