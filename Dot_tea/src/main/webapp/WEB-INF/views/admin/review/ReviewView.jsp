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
                <th scope="row">리뷰 번호</th>
                <td>${map.RE_NO }</td>
                <th scope="row">작성자</th>
                <td>${map.MEM_USER_USERID }</td>
            </tr>
            <tr>
                <th scope="row">제품 번호</th>
                <td>${map.DEAL_NO }</td>
                <th scope="row">날짜</th>
                <td>${map.RE_DATE }</td>
            </tr>
            <tr>
             <th scope="row">별점</th>
                <td>${map.RE_STAR }</td>
            
            </tr>
            
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.RE_SUBJECT }</td>
            </tr>
            <tr>
				<th scope="row">내용</th>
				<td colspan="4">${map.RE_CONTENT }<br></br> 
				
				<img src="${pageContext.request.contextPath}/Image/${map.RE_IMGSV}"
					width="300" /></br>
				</td>
			</tr>
               
            
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
            
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/ReviewList.tea' />");
            comSubmit.submit();
        }
         
    </script>
</body>
</html>
