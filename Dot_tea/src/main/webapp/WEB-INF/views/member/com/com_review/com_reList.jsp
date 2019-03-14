<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<script type="text/javascript">
var locked = 0;
 function show(star) {
	 if(locked)
		 return;
	 var i;
	 var image;
	 var el;
	 var e = document.getElementById('startext');
	 var stateMsg;
	 
	 for(i = 1; i <= star; i++) {
		 image = 'image' + i;
		 el = document.getElementById(image);
		 el.src = "${pageContext.request.contextPath}/images/star_1.png"
	 }
 }
 </script>
</head>
<body>
	<div class="page_section section_myinfo">
		<br> <br>

		<div class="head_aticle">
			<h2 class="tit" align="center">리뷰</h2>
		</div>
		<br>
		<div id="tab2" class="tab_content">
			<div class="innerTab2">

				<table class="board_list">
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr style="background-color: #eee9f1; color: #532074">
							<th scope="col">리뷰 번호</th>
							<th scope="col">리뷰 제품</th>
							<th scope="col">리뷰 내용</th>
							<th scope="col">고객 ID</th>
							<th scope="col">별점</th>
						</tr>
					</thead>
					<tbody class="reviewlist">
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="row">
									<tr>
										<td>${row.RE_NO }</td>
										<td>${row.DEAL_TITLE }</td>
										<td class="RE_SUBJECT"><a href="#this" name="RE_SUBJECT">${row.RE_SUBJECT }</a>
											<input type="hidden" id="RE_NO" value="${row.RE_NO }"></td>
										<td>${row.MEM_USER_USERID }</td>



										<td colspan="2" width="600"><c:if
												test="${row.RE_STAR==1}">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
											</c:if> <c:if test="${row.RE_STAR==2}">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
											</c:if> <c:if test="${row.RE_STAR==3}">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
											</c:if> <c:if test="${row.RE_STAR==4}">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
											</c:if> <c:if test="${row.RE_STAR==5}">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
												<img
													src="${pageContext.request.contextPath}/images/star_1.png"
													width="30ox" height="30px">
											</c:if></td>
									</tr>
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
				<div id="PAGE_RE"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</div>
		</div>
	</div>

	<!-- <a href="#this" class="btn" id="write">글쓰기</a> -->

	<!-- <form action="">
						<select class="slcte" name="searchNum" id="searchNum">

							<option value="0">제목</option>
							<option value="1">내용</option>
						</select> <input class="txte" type="text" name="isSearch" id="isSearch" />
						<span class="btn btnC_03 btnP_04 mr10"> <input
							type="submit" value="검색"
							style="font-size: 11px; padding-bottom: 20; vertical-align: middle;" />
						</span>
					</form>
 -->
	<div>
		<center>
			<c:if test="${not empty paginationInfo}">
				<ui:pagination paginationInfo="${paginationInfo}" type="text"
					jsFunction="fn_search" />
			</c:if>
		</center>
	</div>


	<input type="hidden" id="currentPageNo" name="currentPageNo" />
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
			comSubmit.submit();
		}
	
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
			comSubmit.addParam("RE_NO", obj.parent().find("#RE_NO").val());
			comSubmit.submit();
		}
		
	  	function fn_search(pageNo){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/com_re/openBoardList.tea' />");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
	/* 	function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/com_re/selectBoardList.tea' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectBoardList"
					
				};
				gfn_renderPaging(params);
/* 
				var str = "";
				$.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RE_NO
											+ "</td>"
											+ "<td class='RE_SUBJECT'>"
											+ "<a href='#this' name='RE_SUBJECT'>"
											+ value.RE_SUBJECT
											+ "</a>"
											+ "<input type='hidden' id='RE_NO' value=" + value.RE_NO + ">"
											+ "</td>" + "<td>" + value.MEM_USER_USERID
											+ "</td>" + "<td>" + value.RE_COUNT
											+ "</td>" + "<td>" + value.RE_STAR
											+ "</td>" + "</tr>";
								});
				body.append(str); */

				$("a[name='RE_SUBJECT']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
	</script>
</body>
</html>