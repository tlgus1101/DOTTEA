<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf"%>
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
#button {
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
	<div id="ContextJoinForm" align="center">
		<h1 class="page-header">신고 게시판</h1>
		<div class="orderArea">

			<div class="boardWrite">

				<table border="1" summary="" style="width: 60%">

					<tbody>
					<tbody>

						<tr>
							<th scope="row">글번호</th>
							<td>${map.P_COM_NO}</td>
						</tr>

						<tr>
							<th scope="row">상품 번호</th>
							<td>${map.DEAL_NO}<input type="hidden" id="DEAL_NO"
								name="DEAL_NO" value="${map.DEAL_NO }" />
							</td>
						</tr>

						<tr>
							<th scope="row">신고 대상자</th>
							<td>${map.MEM_COM_ID}<input type="hidden" id="MEM_COM_NO"
								name="MEM_COM_NO" value="${map.MEM_COM_NO }" />
							</td>
						</tr>

						<tr>
							<th scope="row">신고자</th>
							<td>${map.P_REPORTER_ID}</td>
						</tr>

						<tr>
							<th scope="row">상태</th>
							<td><c:if test="${map.P_COM_STATUS ==1}">미확인</c:if> <c:if
									test="${map.P_COM_STATUS ==2}">승인</c:if> <c:if
									test="${map.P_COM_STATUS ==3}">거절</c:if></td>
						</tr>
						<tr>
							<th scope="row">날짜</th>
							<td>${map.P_COM_DATE}</td>
						</tr>

						<tr>
							<th scope="row">제목</th>
							<td>${map.P_COM_SUBJECT}</td>
						</tr>

						<tr>
							<th scope="row">내용</th>
							<td>${map.P_COM_CONTENT }<br>
							</td>
						</tr>

						<c:if test="${map.P_COM_REFUSAL != null }">
							<tr>
								<th scope="row">거절사유</th>
								<td>${map.P_COM_REFUSAL }</td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</div>

<c:choose>
			<c:when test="${map.P_COM_STATUS <= 1 || map.P_COM_STATUS >= 2}">
			<c:if test="${map.P_COM_STATUS <= 1 }"> 
				<br>
				<a href="#this" class="button" id="list" onclick="javascript()">목록</a>
				</c:if>
				<c:if test="${map.P_COM_STATUS >= 2 }">
					<br>
					<a href="#this" class="button" id="list" onclick="javascript()">닫기</a>
				</c:if>
			</c:when>
			</c:choose>
			<c:if test="${map.P_COM_STATUS <2 }">
				<a href="#this" class="button" id="Approval">승인</a>
				<a href="#this" class="button" id="update">거절</a>
			</c:if>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-bodyAdmin.jspf"%>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
            
            $("#Approval").on("click", function(e){ //승인
            	var ok = confirm("승인하시겠습니까?")
            	if(ok == true){
            		
                e.preventDefault();
                fn_openApproval();
            	}
            });

            
            $("#update").on("click", function(e){ //거절
                e.preventDefault();
                fn_openBoardUpdate();
            });
             
            
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/ReportComList.tea' />");
            comSubmit.submit();
        }
        
        function fn_openApproval(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/ComUpdateStatus1.tea?P_COM_NO=${map.P_COM_NO}&DEAL_NO=${map.DEAL_NO}&MEM_COM_NO=${map.MEM_COM_NO}' />");
            comSubmit.submit();
            
        }
        
         
        function fn_openBoardUpdate(){
            var idx = "${map.P_COM_NO}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/openComUpdateStatus2.tea' />");
            comSubmit.addParam("P_COM_NO", idx );
            comSubmit.submit();
        }
         
        
    </script>
</body>
</html>

