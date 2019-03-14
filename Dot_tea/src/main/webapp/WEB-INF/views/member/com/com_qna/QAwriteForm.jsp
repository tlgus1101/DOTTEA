<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>QnA 작성</caption>
			<tbody>
				<!--  <tr>
					<th scope="row">작성자</th>
					<td><input type="text" value="상품관리자"></input></td>
				</tr> -->
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="QA_SUBJECT" name="QA_SUBJECT"
						value="└[${map.MEM_USER_USERID}님]" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
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
			comSubmit
					.setUrl("<c:url value='/com_qna/openQnAList.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_insertBoard() {
			/* var QA_NO = "${map.QA_NO}"; */
			var DEAL_NO = "${map.DEAL_NO}";
			var QA_REF = "${map.QA_REF}";
			var QA_STEP = "${map.QA_STEP}";
			var MEM_USER_USERID = "${map.MEM_USER_USERID}";
			var QA_PASSWORD = "${map.QA_PASSWORD}";
			var comSubmit = new ComSubmit("frm");
			comSubmit
					.setUrl("<c:url value='/com_qna/insertBoard.tea?MEM_COM_ID=${idSession}' />");
			/* comSubmit.addParam("QA_NO", QA_NO); */
			comSubmit.addParam("DEAL_NO", DEAL_NO);
			comSubmit.addParam("QA_REF", QA_REF);
			comSubmit.addParam("QA_STEP", QA_STEP);
			comSubmit.addParam("MEM_USER_USERID", MEM_USER_USERID);
			comSubmit.addParam("QA_PASSWORD", QA_PASSWORD);
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