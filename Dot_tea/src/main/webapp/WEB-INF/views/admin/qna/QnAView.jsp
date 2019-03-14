<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
<link rel="stylesheet" href="/Dot_tea/resources/css/user/userForm.css">
<style>

body {
	background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
	background-size: cover;
	background-repeat: no-repeat;
   font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
}

.wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	/*  margin: 20px auto;
	max-width: 100px;
	text-decoration: none;  */
	/* border-radius: 4px; */
	padding: 5px 5px;
}
a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
/* 
a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
} */


#button  {
  background: #f6f6f6;
  color: #11111;
  width: 100px;
  height: 30px;
  border: 0;
  font-size: 15px;
  border-radius: 4px;
  font-family: 'Noto sans KR', sans-serif;
  -webkit-transition: .6s;
  transition: .6s;
  overflow: hidden;
  cursor: pointer;
  margin-top: 10px;
}

</style>
</head>
<body>
<div id ="ContextJoinForm" align="center" >
<h1 class="page-header">Q&A</h1>
<div class="orderArea">
	
	<div class="boardWrite">
<form name="jform" >	

		<table border="1" summary="" style="width: 60%">
		
		<tbody>		
					<tbody>
					
					<tr>						
						<th scope="row">글번호</th>
						<td>
							${map.QA_NO}
						</td>						
					</tr>
					
						
					<tr>						
						<th scope="row">작성자</th>
						<td>
							${map.MEM_USER_USERID}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">제품 번호</th>
						<td>
							${map.DEAL_NO}
						</td>						
					</tr>
					<tr>						
						<th scope="row">날짜</th>
						<td>
							${map.QA_DATE}
						</td>						
					</tr>	
					
					<tr>						
						<th scope="row">답변 상태</th>
						<td>
							 <c:if test="${map.QA_TYPE == 1}">미확인</c:if>
                			<c:if test="${map.QA_TYPE == 2}">답변완료</c:if>
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">제목</th>
						<td>
							${map.QA_SUBJECT}
						</td>						
					</tr>	
					
					<tr>	
						<th scope="row">내용</th>					
						<td>
							 ${map.QA_CONTENT }
							 <br>
						</td>						
					</tr>
						
		</tbody>
	</table>
</form>
</div>
<br>
    
    <a href="#this" class="button" id="list">목록</a>
 
 </div>
</div>
     
    <%@ include file="/WEB-INF/include/include-bodyAdmin.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/QnAList.tea' />");
            comSubmit.submit();
        }
         
        
    </script>
</body>
</html>

