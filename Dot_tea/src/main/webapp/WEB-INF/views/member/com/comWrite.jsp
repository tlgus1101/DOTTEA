<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-header-Cmypage.jspf"%>
<script type="text/javascript" src="/Dot_tea/resources/jquery-3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").click(function() {
			var MEM_COM_ID = $("#MEM_COM_ID").val();
			var DEAL_TITLE = $("#DEAL_TITLE").val();
			var DEAL_PRICE = $("#DEAL_PRICE").val();
			var DEAL_VOL = $("#DEAL_VOL").val();
			var DEAL_UNIT = $("#DEAL_UNIT").val();
			var DEAL_ORG = $("#DEAL_ORG").val();
			var DEAL_CONTENT = $("#DEAL_CONTENT").val();
			var DEAL_TYPE = $("#DEAL_TYPE").val();
			var DEAL_INGSV = $("#DEAL_IMGSV").val();

			if (MEM_COM_ID == "") {
				alert("ID를 입력해주세요");
				MEM_COM_ID.foucs();
			} else if (DEAL_TITLE == "") {
				alert("상품명을 입력해주세요");
				DEAL_TITLE.focus();
			} else if (DEAL_PRICE == "") {
				alert("상품 가격을 입력해주세요");
				DEAL_PRICE.focus();
			} else if (DEAL_VOL == "") {
				alert("용량/중량을 입력해주세요");
				DEAL_VOL.focus();
			} else if (DEAL_UNIT == "") {
				alert("단위을 입력해주세요");
				DEAL_UNIT.focus();
				/* }else if (isNaN(DEAL_TYPE) != true  ){
				 	alert("상품 타입은 숫자로 표기해주세요(1 찻잎 2 티팟 3 악세서리 4 이벤트)")
				 	 DEAL_TYPE.focus(); */
			} else if (DEAL_ORG == "") {
				alert("원산지를 입력해주세요");
				DEAL_ORG.focus();
			} else if (DEAL_CONTENT == "") {
				alert("설명을 입력해주세요");
				DEAL_CONTENT.focus();
			} else if (DEAL_IMGSV == "") {
				alert("사진을 등록해주세요");
				DEAL_IMGSV.focus();
			}

		});
		// 상품 목록이동
	});
</script>

</head>
<body>

	<br>
	<br>
	<div class="head_aticle">
		<h2 class="tit" align="center">상품 등록</h2>
	</div>
	<form id="frm" enctype="multipart/form-data" method="post">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">기업ID</th>
					<td><input type="text" name="MEM_COM_ID" id="MEM_COM_ID"
						value="${idSession }" class="wdp_90"></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">상품명</th>
					<td><input type="text" name="DEAL_TITLE" id="DEAL_TITLE"
						class="wdp_90"></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">가격</th>
					<td><input type="text" name="DEAL_PRICE" id="DEAL_PRICE"
						class="wdp_90"></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">상품타입</th>
					<td><input type="text" id="DEAL_TYPE" name="DEAL_TYPE"
						class="wdp_90"> <br>숫자로 표기하세요 <br>ex. 1 찻잎 2 티팟
						3 악세서리 4 이벤트</td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">용량/중량</th>
					<td><input type="text" name="DEAL_VOL" id="DEAL_VOL"
						class="wdp_90"></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">단위</th>
					<td><input type="text" name="DEAL_UNIT" id="DEAL_UNIT"
						class="wdp_90"></td>
				</tr>
				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">원산지</th>
					<td><input type="text" name="DEAL_ORG" id="DEAL_ORG"
						class="wdp_90"></td>
					<th scope="row" style="background-color: #eee9f1; color: #532074">재고
						수량</th>
					<td><input type="text" name="DEAL_COUNT" id="DEAL_COUNT"
						class="wdp_90"></td>
				</tr>



				<tr>
					<th scope="row" style="background-color: #eee9f1; color: #532074">상품
						설명</th>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="DEAL_CONTENT" name="DEAL_CONTENT"></textarea></td>
				</tr>

				<!--  <tr>
            <td>상품이미지</td>            
            <td><p> <input type="file" id="file" name="file_0">
                <a href="#this" class="btn" id="delete" name="delete">삭제</a></p></td>
        </tr>  -->


				<!--        <div id="fileDiv">
            <p>
                <input type="file" id="file" name="file_0">
                <a href="#this" class="btn" id="delete" name="delete">삭제</a>
            </p>
        </div>
         
        <br/><br/> -->
				<!--  <tr>
            <td colspan="2" align="center">
            <a href="#this" class="btn" id="addFile">파일 추가</a>
                <input type="button" value="등록" id="addBtn">
                <input type="button" value="목록" id="listBtn">
            </td>
        </tr> -->
			</tbody>
		</table>
		<input type="hidden" id="DEAL_IMGSV" name="DEAL_IMGSV" value="">
		<div id="fileDiv">
			<span><p>
					<br> <input type="file" id="DEAL_IMGSV" name="DEAL_IMGSV_0">
					<a href="#this" class=" bhs_button
					active" id="delete"
						name="delete"
						style='position: absolute; width: 50px; height: 25px; font-size: 15px; background-color: #eee9f1; color: #532074'>
						삭제 </a>
				</p></span>
		</div>
		<!--  <tr>
            <td>상품이미지</td>            
            <td><input type="file" id="DEAL_IMGSV" name="DEAL_IMGSV">
             
        </tr>  -->
		<br /> <br />
		<tr>

			<td colspan="2" align="center"><span><a href="#this"
					class=" bhs_button
					active" id="list">목록으로</a></span><span><a
					href="#this" class=" bhs_button
					active" id="write">저장하기</a></span><span><a
					href="#this" class=" bhs_button
					active" id="addFile">파일
						추가</a></span></td>
		</tr>
	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = 1;

		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});

			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});

			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit
					.setUrl("<c:url value='/shop/openBoardList.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_insertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit
					.setUrl("<c:url value='/shop/insertBoard.tea?MEM_COM_ID=${idSession}' />");
			comSubmit.submit();
		}

		function fn_addFile() {

			var str = "<p><br><input type='file' name='DEAL_IMGSV_"
					+ (gfv_count++)
					+ "'><a href='#this' class='bhs_button active' class='btn' name='delete' style='position: absolute; width: 50px; height: 25px; font-size: 15px; background-color: #eee9f1; color: #532074'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}

		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>