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
<h1 class="page-header">회원 정보</h1>
<div class="orderArea">
	
	<div class="boardWrite">

		<table border="1" summary="" style="width: 60%">
		
		<tbody>		
					<tbody>
					
					<tr>						
						<th scope="row">아이디</th>
						<td>
							${map.MEM_COM_ID}
						</td>						
					</tr>
					
						
					<tr>						
						<th scope="row">비밀번호</th>
						<td>
							${map.MEM_COM_PASSWORD}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">회사명</th>
						<td>
							${map.MEM_COM_NAME}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">대표자</th>
						<td>
							${map.MEM_COM_OWNER}
						</td>						
					</tr>	
					
					<tr>						
						<th scope="row">사업자등록번호</th>
						<td>
							 ${map.MEM_COM_RESI }					
						</td>						
					</tr>
						
					
					<tr>						
						<th scope="row">통신 판매 번호</th>
						<td>
							 ${map.MEM_COM_COMNUM }					
						</td>						
					</tr>			
					
					<tr>						
						<th scope="row">기업 연락처</th>
						<td>
							${map.MEM_COM_COMPANY_PHONE}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">담당자 연락처</th>
						<td>
							${map.MEM_COM_MANAGER_PHONE}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">팩스</th>
						<td>
							${map.MEM_COM_FAX}
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">기업 메일 주소</th>
						<td>
							${map.MEM_COM_COMPANY_EMAIL}				   
						</td>						
					</tr>
						
					<tr>						
						<th scope="row">담당자 메일 주소</th>
						<td>
							${map.MEM_COM_MANAGER_EMAIL}				   
						</td>						
					</tr>	
					
					<tr>		
						<th scope="row">우편번호</th>
						<td>${map.MEM_COM_ZIPCODE }</td></tr>
					<tr>
						<th scope="row">지번주소</th>
                        <td>${map.MEM_COM_ZIBUNADDR }</td></tr>
                    <tr>    
                        <th scope="row">도로명주소</th>
                        <td>${map.MEM_COM_LOADADDR }</td></tr>
                    <tr>    
                        <th scope="row">상세주소</th>
                        <td>${map.MEM_COM_DETAILADDR }</td></tr>		
					
					<tr>						
						<th scope="row">배달비 무료 커트라인</th>
						<td>
							 ${map.MEM_COM_DELIVERYFREE }				
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">수수료</th>
						<td>
							 ${map.MEM_COM_NET}%			
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">기업 계좌번호</th>
						<td>
							 ${map.MEM_COM_ACCOUNT }					
						</td>						
					</tr>
					
					<tr>						
						<th scope="row">신고 누적횟수</th>
						<td>
							 ${map.MEM_COM_BLACK }					
						</td>						
					</tr>
					
					
		</tbody>
	</table>
</div>
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
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/CompanyList.tea' />");
            comSubmit.submit();
        }
         
        function fn_openBoardUpdate(){
            var idx = "${map.MEM_COM_NO}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/openCompanyModify.tea' />");
            comSubmit.addParam("MEM_COM_NO", idx );
            comSubmit.submit();
        }
    </script>
</body>
</html>

