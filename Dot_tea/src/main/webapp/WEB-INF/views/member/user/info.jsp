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
				<th scope="row">이름</th>
				<td><input type="text" value="${map.MEM_USER_USERNAME }"></td>
				<input type="hidden" id="info" name="info" value="${map.MEM_USER_NO }">
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td><input type="text" value="${map.MEM_USER_PHONE }"></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input type="text" value="${map.MEM_USER_USEREMAIL }"></td>
			</tr>
			<tr>
				<th scope="row">우편번호</th>
				<td><input type="text" value="${map.MEM_USER_ZIPCODE }"></td>
				<th scope="row">지번주소</th>
				<td colspan="3"><input type="text" value="${map.MEM_USER_ZIBUNADDR }"></td>
				<th scope="row">도로명주소</th>
				<td colspan="4"><input type="text" value="${map.MEM_USER_LOADADDR }"></td>
				<th scope="row">상세주소</th>
				<td colspan="4"><input type="text" value="${map.MEM_USER_DETAILADDR }"></td>
			</tr>
			
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="return">취소</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">회원탈퇴</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
        	$("#return").on("click", function(e){ //목록으로 버튼
            	e.preventDefault();
           		fn_MyPageList();
        	});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_infoBoardUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_infoBoardDelete();
            }); 
		});
		
		function fn_MyPageList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/mypage.tea' />");
			comSubmit.submit();
		}
		
		function fn_infoBoardUpdate(){
			var idx = "${map.MEM_USER_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/infoupdate.tea' />");
			comSubmit.addParam("MEM_USER_NO", idx);
			comSubmit.submit();
		}
		
		function fn_infoBoardDelete(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/member/infodelete.tea' />");
            comSubmit.addParam("MEM_USER_NO", $("#info").val());
            comSubmit.submit();
        }
	</script> 
</body>
</html>
