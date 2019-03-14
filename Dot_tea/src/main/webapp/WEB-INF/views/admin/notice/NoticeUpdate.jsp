<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
<link rel="stylesheet" href="/Dot_tea/resources/css/user/userForm.css">
<!-- <link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css" rel="stylesheet" style="text/css"> -->
<head>
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
<h1 class="page-header">공지사항 수정</h1>
<div class="orderArea">
	
	<div class="boardWrite">
<form id="jform" name="jform" enctype="multipart/form-data">	

		<table border="1" summary="" style="width: 60%">
		
		<tbody>		
					<tbody>
					
					<tr>						
						<th scope="row">글 번호</th>
						<td>
							${map.N_NO }
							<input type="hidden" id="N_NO" name="N_NO" value="${map.N_NO }">
						</td>						
					</tr>
					
						
					<tr>						
						<th scope="row">조회수</th>
						<td>
							${map.N_READHIT }
						</td>						
					</tr>
					
					
					<tr>						
						<th scope="row">작성시간</th>
						<td>
							${map.N_DATE }
						</td>						
					</tr>		
					
					<tr>						
						<th scope="row">제목</th>
						<td>
							<input name="N_SUBJECT" type="text" value="${map.N_SUBJECT}" autocomplete="off" style="font-size: 15px">
							
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">내용</th>
						<td>
						<textarea rows="20" cols="70" title="내용" id="N_CONTENT" name="N_CONTENT">${map.N_CONTENT }</textarea>
						</td>						
					</tr>
					
				<tr>
					<th scope="row">파일</th>
                    <td>
                    <input type="file" name="file">
                    </td>
                </tr>	
					
					
					
		</tbody>
	</table>
</form>
</div>

<!-- <input value="회원 수정하기" type="button" id="button" onclick="javascript:ajaxJoinUpdateView();"/> -->
<br>
    <a href="#this" class="button"  id="update">수정</a>
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
             
            $("#update").on("click", function(e){ //저장하기 버튼
                e.preventDefault();
                fn_updateBoard();
            });
            $("a[name^='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
             
        });
        
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/NoticeList.tea' />");
            comSubmit.submit();
        }
         
        function fn_updateBoard(){
            var comSubmit = new ComSubmit("jform");
            comSubmit.setUrl("<c:url value='/admin/NoticeUpdate.tea' />");
            comSubmit.submit();
        }
        
        function fn_deleteFile(obj){
            obj.parent().remove();
        }

         
        
    </script>
</body>
</html>