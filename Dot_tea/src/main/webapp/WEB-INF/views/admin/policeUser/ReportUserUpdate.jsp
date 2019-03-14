<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
<link rel="stylesheet" href="/Dot_tea/resources/css/user/userForm.css">
<script type="text/javascript">

function javascript(){
	window.opener.location.reload();
	self.close();   //자기자신창을 닫습니다.
}
</script>
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
<h1 class="page-header">신고 게시판(거절)</h1>
<div class="orderArea">
	
	<div class="boardWrite">
<form id="jform" name="jform" >	

		<table border="1" summary="" style="width: 60%">
		
		<tbody>		
					<tbody>
					
					<tr>						
						<th scope="row">번호</th>
						 <td>
                        ${map.P_USER_NO }
                        <input type="hidden" id="P_USER_NO" name="P_USER_NO" value="${map.P_USER_NO }">
                        <input type="hidden" id="MEM_USER_NO" name="MEM_USER_NO" value="${map.MEM_USER_NO }">
                    </td>					
					</tr>
						
					<tr>						
						<th scope="row">리뷰 번호</th>
						<td>
						  	${map.RE_NO }
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">신고 대상자</th>
						<td>
						  	${map.MEM_USER_USERID }
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">신고자</th>
						<td>
						  ${map.P_REPORTER_ID}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">날짜</th>
						<td>
						  	${map.P_USER_DATE }
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">신고 사유</th>
						<td>
							${map.P_USER_CONTENT }
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">거절 사유</th>
						<td>
						<textarea rows="20" cols="100" title="내용" id="P_USER_REFUSAL" name="P_USER_REFUSAL">${map.P_USER_REFUSAL }</textarea>
						</td>						
					</tr>
					
					
					
		</tbody>
	</table>
</form>
</div>

<!-- <input value="회원 수정하기" type="button" id="button" onclick="javascript:ajaxJoinUpdateView();"/> -->
<br>
    <a href="#this"  class="button"  id="update">거절</a>
    <a href="#this"  class="button" id="list" onclick="javascript()">목록</a>
	
	</div>	
</div>
<%@ include file="/WEB-INF/include/include-bodyAdmin.jspf" %>
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
             
        });
        
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/ReportUserList.tea' />");
            comSubmit.submit();
        }
         
        function fn_updateBoard(){
            var comSubmit = new ComSubmit("jform");
            comSubmit.setUrl("<c:url value='/admin/UserUpdateStatus2.tea' />");
            comSubmit.submit();
        }
         
        
        
    </script>
</body>
</html>