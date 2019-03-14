<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf" %>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
	<!-- 	<col width="5%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" /> -->
			</colgroup>
			<caption>QnA 작성</caption>
			<tbody>
				<!--  <tr>
					<th scope="row">작성자</th>
					<td><input type="text" value="상품관리자"></input></td>
				</tr> -->
				<tr>
				 <th scope="row">신고자</th>
				 <c:if test="${typeSession == 2}">
				 
				 <td>${idSession}<input type="hidden" id="P_REPORTER_ID" name="P_REPORTER_ID" value="${idSession}/기업"> </td>
				 </c:if>
				 				 <c:if test="${typeSession == 1}">
				 <td>${idSession}<input type="hidden" id="P_REPORTER_ID" name="P_REPORTER_ID" value="${idSession}/회원"> </td>
				 </c:if>
				 </tr>
				 <tr>
				 	<th scope="row">신고 대상자</th>
					<td>
					${map.MEM_USER_USERID}
					 <input type="hidden" id="MEM_USER_NO" value="${map.MEM_USER_NO}"> </td>
					 </tr>
				<tr>
					 <th scope="row">신고 사유</th>
				 <td><input type="text" id="P_USER_SUBJECT" name="P_USER_SUBJECT" class="wdp_90">
				</tr> 
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="P_USER_CONTENT" name="P_USER_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	
		
		<br/><br/>
		<a href="#this" class="btn" id="write">신고하기<input type="hidden" id="MEM_USER_NO" value="${map.MEM_USER_NO}"></a>
		<a href="#this" class="btn" id="list">취 소<input type="hidden" id="DEAL_NO" value="${map.DEAL_NO}"></a>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body2.jspf" %>
	<script type="text/javascript">
		/* var gfv_count=1; */
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList($(this));
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard($(this));
			});
		/* 	$("#addFile").on("click", function(e){
				e.preventDefault();
				fn_addFile();
			}); */
			$("#a[name='delete']").on("click",function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/starts.tea' />");
			comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
			comSubmit.submit();
		}
		
		function fn_insertBoard(obj){
			/* var QA_NO = "${map.QA_NO}"; */
			var RE_NO = "${map.RE_NO}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/com_re/policeinsert.tea' />");
			 /* comSubmit.addParam("QA_NO", QA_NO); */
			 comSubmit.addParam("RE_NO", RE_NO);
			 comSubmit.addParam("MEM_USER_NO", obj.parent().find("#MEM_USER_NO").val());
			 comSubmit.addParam("DEAL_NO", obj.parent().find("#DEAL_NO").val());
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