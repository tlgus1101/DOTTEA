<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.RE_NO }</td>
				<input type="hidden" id="RE_NO" name="RE_NO" value="${map.RE_NO }">
				<th scope="row">제품 번호</th>
				<td>${map.DEAL_NO }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.MEM_USER_USERID }</td>
				<th scope="row">별점</th>
				<td>${map.RE_STAR }</td>
				<th scope="row">작성일</th>
				<td>${map.RE_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.RE_SUBJECT }</td>
			</tr>
			<tr>
				<td colspan="3">${map.RE_IMGSV }</td>
			</tr>
			<tr>
				<td colspan="4">${map.RE_CONTENT }</td>
			</tr>
			<%-- <tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<p>
							<input type="hidden" id="IDX" value="${row.IDX }">
							<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
							(${row.FILE_SIZE }kb)
						</p>
					</c:forEach>
				</td>
			</tr> --%>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
        	$("#list").on("click", function(e){ //목록으로 버튼
            	e.preventDefault();
           		fn_reviewBoardList();
        	});
			
        	$("#update").on("click", function(e) {
				e.preventDefault();
				fn_reviewBoardUpdate();
			});
        	
        	$("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_reviewBoardDelete();
            }); 
			
			/* $("a[name='file']").on("click", function(e) {
				e.preventDefault();
				fn_downloadFile($(this));
			}); */ 
		});
		
		function fn_reviewBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/reviewlist.tea' />");
			comSubmit.submit();
		}
		
		function fn_reviewBoardUpdate() {
			var idx = "${map.RE_NO}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/member/reviewupdate.tea' />");
            comSubmit.addParam("RE_NO", idx);
            comSubmit.submit();
		}
		
		function fn_reviewBoardDelete(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/member/reviewdelete.tea' />");
            comSubmit.addParam("RE_NO", $("#RE_NO").val());
            comSubmit.submit();
        }
		
		/* function fn_downloadFile(obj) {
			var idx = obj.parent().find("#IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do'/>");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		} */ 
	</script> 
</body>
</html>
