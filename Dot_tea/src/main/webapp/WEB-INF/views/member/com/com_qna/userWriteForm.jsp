<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
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
</head>
<body>
	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">QnA 작성</h2>
	</div>
	<br>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="*" />
				<col width="35%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074;">작성자</th>
					<td><input type="hidden" id="DEAL_NO" name="DEAL_NO"
						value="${DEAL_NO}"><input type="text" id="MEM_USER_USERID"
						name="MEM_USER_USERID" value="${idSession}" class="wdp_90"></input></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074;">비밀번호</th>
					<td><input type="password" id="QA_PASSWORD" name="QA_PASSWORD">
						</input></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074;">제목</th>
					<td colspan="3"><input type="text" id="QA_SUBJECT"
						name="QA_SUBJECT" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="QA_CONTENT" name="QA_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>


		<br /> <br /> <a href="#this" class="bhs_button active" id="list">목록으로</a>
		<a href="#this" class="bhs_button active" id="write">작성하기</a>
	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		/* var gfv_count=1; */
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			/* 	$("#addFile").on("click", function(e){
					e.preventDefault();
					fn_addFile();
				}); */
			$("#a[name='delete']").on("click", function(e) {
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea' />");
			comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
			comSubmit.submit();
		}

		function fn_insertBoard() {
			/* var DEAL_NO = "#DEAL_NO"; */
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/com_qna/userinsert.tea' />");
			/* comSubmit.addParam("DEAL_NO", DEAL_NO); */
			comSubmit.submit();
		}

		/* 	function fn_addFile(){
				var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
				$("#fileDiv").append(str);
				$("a[name='delete']").on("click", function(e){
					e.preventDefault();
					fn_deleteFile($(this));
				});
			} */
		/* function fn_deleteFile(obj){
			obj.parent().remove();
		} */
	</script>
</body>
</html>