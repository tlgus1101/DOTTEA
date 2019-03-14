<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">

<title>관리자페이지</title>
</head>
<!-- <body>

관리자페이지


회원관리
<br/><br/><br/><br/><br/>
<input value="회원리스트" type="button" onclick="location.href='/IMPet/Member/MemberList'"/>

호텔관리
<br/><br/><br/><br/><br/>
<input value="룸예약리스트" type="button" onclick="location.href='/IMPet/PetHotel/RoomResAllList'"/>
<input value="룸리스트" type="button" onclick="location.href='/IMPet/PetHotel/RoomList'"/>

상품관리
<br/><br/><br/><br/><br/>
<input value="관리자 상품 리스트" type="button" onclick="location.href='/IMPet/PetShop/AdminItemList'"/>
<input value="관리자 회원 주문 내역 리스트" type="button" onclick="location.href='/IMPet/PetShop/AdminOrderList'"/>

공지사항
<br/><br/><br/><br/><br/>
<input value="공지사항리스트" type="button" onclick="location.href='/IMPet/ServiceCenter/NoticeList'"/>

자주묻는질문
<br/><br/><br/><br/><br/>
<input value="자주묻는질문리스트" type="button" onclick="location.href='/IMPet/ServiceCenter/FAQList'"/> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="/Dot_tea/resources/ajax/HotelAjax.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/Dot_tea/resources/css/admin/admin.css" />

</head>
<body>
<div class="adminMian" align="left" style="width:100%;" >
	<div class="adminLeft" style="width: 19%;  float: left; ">
		<div class="nestedsidemenu">
			<ul>
				 <li style="line-height: 2em; text-align: center; vertical-align: middle;">&nbsp;관리자 페이지<br/>
				 </li>
				 
				  <li><a href="javascript:vold(0)">&nbsp;&nbsp;&nbsp;회원 관리</a>
					  <ul>
						  <li><a href="/Dot_tea/admin/UserList.tea">User</a></li>
						  <li><a href="/Dot_tea/admin/CompanyList.tea">Company</a></li>   
						  <li><a href="/Dot_tea/admin/BlUserList.tea">User(Black)</a></li>
						  <li><a href="/Dot_tea/admin/BlComList.tea">Company(Black)</a></li>
					 </ul>
				</li>
				 
				 <li><a href="javascript:vold(0)">&nbsp;&nbsp;&nbsp;게시판 관리</a>
					  <ul>
						  <li><a href="/Dot_tea/admin/ReportUserList.tea">신고 게시판(User)</a></li>
						  <li><a href="/Dot_tea/admin/ReportComList.tea">신고 게시판(Company)</a></li>
						  <li><a href="/Dot_tea/admin/QnAList.tea">QnA</a></li>								  
						  <li><a href="/Dot_tea/admin/ReviewList.tea">Review</a></li>	
					 </ul>
				</li>
				
				 <li><a href="javascript:vold(0)">&nbsp;&nbsp;&nbsp;결제 관리</a>
					  <ul>
						  <li><a href="">결제</a></li>
					 </ul>
				</li>
				
				<li><a href="javascript:vold(0)">&nbsp;&nbsp;&nbsp;고객센터</a>
					  <ul>
					  	<li><a href="/Dot_tea/admin/NoticeList.tea">공지사항</a></li>				
									
					 </ul>
				</li>		
				
								
			</ul>
		</div>
	</div>

	

</div>

</body>
</html>