<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
  <title>관리자 페이지</title>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<!-- <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'> -->
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Montserrat''>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/style.css'/>" />
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src="<c:url value='/js/index.js'/>" charset="utf-8"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/Dot_tea/resources/ajax/HotelAjax.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/Dot_tea/resources/css/admin/admin.css" />
</head>

<body>
  <!-- <h2>관리자 페이지</h2> -->
  
<br><br>
<div class="adminMian" align="left" style="width:100%;" >
	<div class="adminLeft" style="width: 19%;  float: left; ">
<ul class="accordion-menu">
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 회원 관리
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
       <li><a href="/Dot_tea/admin/UserList.tea">User</a></li>
	   <li><a href="/Dot_tea/admin/CompanyList.tea">Company</a></li>   
	   <li><a href="/Dot_tea/admin/BlUserList.tea">User(Black)</a></li>
	   <li><a href="/Dot_tea/admin/BlComList.tea">Company(Black)</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-paper-plane" aria-hidden="true"></i> 게시판 관리
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="/Dot_tea/admin/ReportUserList.tea">신고 게시판(User)</a></li>
      <li><a href="/Dot_tea/admin/ReportComList.tea">신고 게시판(Company)</a></li>
      <li><a href="/Dot_tea/admin/QnAList.tea">QnA</a></li>
      <li><a href="/Dot_tea/admin/ReviewList.tea">Review</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> 정산 관리
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="/Dot_tea/admin/Calculator.tea">일반 기업 정산</a></li>
      <li><a href="/Dot_tea/admin/CalculatorB.tea">블랙 기업 정산</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-motorcycle" aria-hidden="true"></i> 고객센터
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="/Dot_tea/admin/NoticeList.tea">공지사항</a></li>
    </ul>
  </li>
</ul>
</div>
</div>

<div class="adminLeft" style="width: 19%;  float: left; ">
		
	</div>

	<div class="adminCenter" align="center" style="width: 80%; margin-left: 5px;  float: left;" >
		
		<c:choose>
			<c:when test="${adminCode==1 || adminCode==2 || adminCode==3 || adminCode==4}">
				<div id="Manage" style="width: 90%; padding-top: 10px;">
					<c:if test="${adminCode==1}">
						<jsp:include page="/WEB-INF/views/admin/user/UserList.jsp"/>
					</c:if>
					<c:if test="${adminCode==2}">
						<jsp:include page="/WEB-INF/views/admin/company/CompanyList.jsp"/>
					</c:if>
					<c:if test="${adminCode==3}">
						<jsp:include page="/WEB-INF/views/admin/blackUser/BlackList.jsp"/>
					</c:if>
					<c:if test="${adminCode==4}">
						<jsp:include page="/WEB-INF/views/admin/blackCom/BlackList.jsp"/>
					</c:if>
				</div>
			</c:when>
			
			<c:when test="${adminCode==5 || adminCode==55 || adminCode==6 || adminCode==65 || adminCode==7 || adminCode==8}">
				<div id="ContextHotel" style="width: 90%; padding-top: 10px;">
					<c:if test="${adminCode==5}">
						<jsp:include page="/WEB-INF/views/admin/policeUser/ReportUserList.jsp"/>
					</c:if>
					
					<c:if test="${adminCode==55}">
						<jsp:include page="/WEB-INF/views/admin/policeUser/ReportUserList1.jsp"/>
					</c:if>
					
					<c:if test="${adminCode==6}">
						<jsp:include page="/WEB-INF/views/admin/policeCom/ReportComList.jsp"/>
					</c:if>
					
					<c:if test="${adminCode==65}">
						<jsp:include page="/WEB-INF/views/admin/policeCom/ReportComList1.jsp"/>
					</c:if>
					
					<c:if test="${adminCode==7}">
						<jsp:include page="/WEB-INF/views/admin/qna/QnAList.jsp"/>
					</c:if>
					<c:if test="${adminCode==8}">
						<jsp:include page="/WEB-INF/views/admin/review/ReviewList.jsp"/>
					</c:if>
				</div>
			</c:when>
			
			<%-- <c:when test="${ adminCode==10 || adminCode==11}">
				<div id="ContextHotel" style="width: 90%; padding-top: 10px;">
					<c:if test="${adminCode==10}">
						<jsp:include page="/WEB-INF/views/admin/calculator/calculationList.jsp"/>
					</c:if>
					<c:if test="${adminCode==11}">
						<jsp:include page="/WEB-INF/views/admin/calculator/calculationBlackList.jsp"/>
					</c:if>
				</div>
			</c:when> --%>
			
			<c:when test="${adminCode==9}">
				<div id="ContextHotel" style="width: 90%; padding-top: 10px;">
					<jsp:include page="/WEB-INF/views/admin/notice/NoticeList.jsp"/>
				</div>
			</c:when>
			
			
			
			<c:otherwise>
				<div style="width: 90%; height: 400px; margin-top: 10px;">
					<img alt="admin" src="/Dot_tea/resources/adminImage/admin.jpg">
				</div>
			</c:otherwise>
			
		</c:choose>
		
	</div>


</body>
</html>
