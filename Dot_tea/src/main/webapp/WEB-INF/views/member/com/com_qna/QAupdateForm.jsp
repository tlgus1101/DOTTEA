<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보수정</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
</head>
<body>
	<form id="frm" enctype="multipart/form-data" method="post">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 수정</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.QA_NO } <input type="hidden" id="QA_NO" name="QA_NO"
						value="${map.QA_NO }">
					</td>
				<tr>
					<th scope="row">제 목</th>
					<td><input type="text" id="QA_SUBJECT" name="QA_SUBJECT"
						class="wdp_90" value="${map.QA_SUBJECT }" /> <!--  <th scope="row">패스워드</th>
                    <td><input type="password" id="QA_PASSWORD" name="QA_PASSWORD" /></td> -->
				</tr>

				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="QA_CONTENT" name="QA_CONTENT">${map.QA_CONTENT }</textarea>
					</td>
				</tr>


			</tbody>
		</table>
	</form>
	<a href="#this" class="bhs_button active" id="list">목록으로</a>
	<a href="#this" class="bhs_button active" id="update">저장하기</a>


	<%@ include file="/WEB-INF/include/include-body2.jspf"%>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){ //저장하기 버튼
                e.preventDefault();
                fn_updateBoard();
            });
             
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_deleteBoard();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/com_qna/openQnAList.tea?MEM_COM_ID=${idSession}' />");
            comSubmit.submit();
        }
         
        function fn_updateBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/com_qna/QnAupdate.tea?MEM_COM_ID=${idSession}' />");
            comSubmit.submit();
        }
        
    </script>