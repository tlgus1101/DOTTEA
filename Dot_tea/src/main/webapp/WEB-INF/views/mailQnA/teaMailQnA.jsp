<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/normalize.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section1.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/section2.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/common.css?ver=201901141354">
<link rel="styleSheet"
	href="https://www.kurly.com//shop/data/skin/designgj/css/goods_style.css?ver=201901141354">

<meta charset="UTF-8">
<title>1:1 문의하기</title>
</head>
<body>
	<div class="page_aticle aticel_type2">
		<div class="page_section section_qna">
			<div class="head_aticle">
				<h2 class="tit">1:1 문의</h2>
			</div>


			<form name="mailForm" id="mailForm" method="post"
				action="teaSendMail.tea" enctype="multipart/form-data"
				onsubmit="return chkForm(this)" style="height: 100%;">
				<table id="table_after" class="boardWrite2" width="100%">
					<colgroup>
						<col width="14%" align="right">
					</colgroup>
					<tbody>
						<tr>
							<th class="input_txt">제목</th>
							<td><input type="text" name="inputTitle" size="50"></td>
						</tr>
						<tr>
							<th class="input_txt">답볃 받을 이메일</th>
							<td><input type="text" name="inputEmail" size="26"
								class="read_only"></td>
						</tr>
						<tr>
							<th class="input_txt">내용</th>
							<td class="edit_area" style="position: relative;">
								<style>
.notice_qna {
	font-size: 12px;
	linep-height: 20px;
	font-family: 'Noto Sans';
	color: #4c4c4c
}

.notice_qna .tit {
	display: block;
	padding: 4px 0 10px;
	font-size: 12px;
	line-height: 20px;
	font-family: 'Noto Sans';
	fint-weight: 700
}

.notice_qna .list {
	padding-top: 10px
}

.notice_qna dt {
	font-family: 'Noto Sans';
	font-weight: 700
}

.notice_qna .desc {
	padding: 21px 10px 30px 0
}
</style> <textarea name="inputContent" style="width: 70%; height: 274px;"
									class="editing_area" required="" fld_esssential="" label="내용"></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<table width="100%">
					<tbody>
						<tr>
							<td align="left" style="padding-top: 5px; border: none;"
								id="avoidDbl"><input type="submit" class="bhs_button yb"
								value="메일전송" style="float: none;"></td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>

	</div>
	</div>



	<script type="text/javascript">

</script>


</body>
</html>