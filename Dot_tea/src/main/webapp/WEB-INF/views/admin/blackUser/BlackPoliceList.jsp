<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
<link rel="stylesheet" href="/Dot_tea/resources/css/hotel/form.css">
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css" rel="stylesheet" style="text/css">
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
	<h1 class="page-header">신고게시판 목록(User)</h1>
<div class="orderArea">
	<div class="boardWrite">

		<table border="1" summary="" style="width: 60%">
					<thead>
					<tr style="vertical-align:middle; border:1px solid lightgray;">
							<th style="width: 5%; text-align:center;vertical-align:middle; border:1px solid lightgray;">글 번호</th>
							<th style="width: 5%; text-align:center;vertical-align:middle; border:1px solid lightgray;">회원 번호</th>
							<th style="width: 5%; text-align:center;vertical-align:middle; border:1px solid lightgray;">후기 번호</th>
							<th style="width: 5%; text-align:center;vertical-align:middle; border:1px solid lightgray;">제목</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">내용</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">상태</th>
						</tr>
					</thead>
            
    <tbody>
    <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach items="${list }" var="row">
                  <tr>
                     <td align=center>${row.P_USER_NO }</td>
                     <td align=center>${row.MEM_USER_NO }</td>
                      <td align=center>${row.RE_NO }</td>
                     <td align=center>${row.P_USER_SUBJECT }</td>
                     <td align=center>${row.P_USER_CONTENT }</td>
                    
                     <td align=center>
                     
                     <c:if test="${row.P_USER_STATUS == 2}">
                           승인</c:if>
                     </td>
            
               
                     
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="6">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
       </tbody>
    </table>
	
</div>

 </div>
 </div>
	<br>
	<center>
	<a href="#this"  class="button" id="list">목록</a>
	</center>
	

     
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
                comSubmit.setUrl("<c:url value='/admin/BlUserList.tea' />");
                comSubmit.submit();
            }
            
      </script>
</body>
</html>
