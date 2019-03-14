<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			imagesSplit();
		});

		function imagesSplit() {
			var images = "<c:out value="${list.DEAL_IMGSV}"/>";
			var imageslist = images.split(",");

			document.frmView.objImg.src = "${pageContext.request.contextPath}/images/"
					+ imageslist[0];

			var body = document.getElementById("goods_pi");
			var str = "";
			for (var i = 1; i < imageslist.length; i++) {
				str += "<div class='context' align='center'><div class='pic'><img"
				+" src='${pageContext.request.contextPath}/images/"+imageslist[i]+"'>"
						+ "<p class='words'><strong class='sub_tit'></strong></p></div></div> "
			}
			body.innerHTML = str;
		}

		function totalSetting() {
			var selected = document.getElementById("addopt");
			if (selected.options[selected.selectedIndex].value != "0") {
				var body = document.getElementById("totalCount");
				var PRICE = "${list.DEAL_PRICE}";
				selected = document.getElementById("totalSettingId")
				var count = selected.options[selected.selectedIndex].value;
				var total = (count) * (PRICE);

				body.innerHTML = "총 상품금액 : <span id='el-multi-option-total-price'"
								+"class='__value-total-price'>"
						+ total
						+ "</span>원 <span class='screen_out'>"
						+ "</span>";

			} else {
				selected = document.getElementById("totalSettingId");
				selected.selectedIndex = 0;
				alert("상품을 선택한후 눌러 주세요");
			}
		}

		/* 	function putBasket() {
		         var comSubmit = new ComSubmit();
		         var count = document.getElementById("totalSettingId").value;
		         comSubmit.setUrl("<c:url value='/member/inbasket.tea' />");
		         comSubmit.addParam("Count", count);
		         comSubmit.submit();

		      } */

		function putBasket() {
			var id = "";
			var selected = document.getElementById("totalSettingId");
			var count = selected.options[selected.selectedIndex].value;

			if (selected.options[selected.selectedIndex].value != "0") {
				var comSubmit = new ComSubmit();
				/* comSubmit.setUrl("<c:url value='/member/inbasket.tea'/>"); */
				comSubmit
						.setUrl("<c:url value='/member/teaDealInputBasket.tea'/>");
				comSubmit.addParam("DEAL_NO", "${list.DEAL_NO}");
				comSubmit.addParam("count", count);

				if ("<c:out value='${NOSession}'/>" == ""
						|| "<c:out value='${typeSession}'/>" != 1) {
					alert("장바구니에 담겼습니다.");
					comSubmit.addParam("LoginBasket", 1);
				}

				if ("<c:out value='${NOSession}'/>" != ""
						&& "<c:out value='${typeSession}'/>" == 1) {
					alert("장바구니에 담겼습니다.");
					comSubmit.addParam("LoginBasket", 2);
				}
				comSubmit.submit();

			} else {
				alert("제품을 선택해 주세요.");
			}
		}
	</script>


	<div class="layout-wrapper goods-view-area">
		<div class="goods-view-sns-area"></div>


		<form name="frmView" method="post" onsubmit="return false"
			class="__connect-form">
			<input type="hidden" name="mode" value="addItem"> <input
				type="hidden" name="goodsno" value="1385"> <input
				type="hidden" name="goodsCoupon" value="0"> <input
				type="hidden" name="packageCheck" value="true">

			<div class="goods-view-wrapper" id="goods-view-wrapper">
				<div class="goods-view-figure">
					<img src="" id="objImg" class="goods-view-figure-image">
				</div>
				<div class="goods-view-form">
					<div class="goods-view-form-header">
						<h2 class="goods-view-name">${list.DEAL_TITLE}</h2>
						<p class="goods-view-shortdesc"></p>

					</div>
					<div class="goods-view-form-table-wrapper">
						<table class="goods-view-form-table">
							<tbody>
								<tr class="goods-view-form-price">
									<th scope="row" class="goods-view-form-table-heading">판매가</th>
									<td class="goods-view-form-table-cell">${list.DEAL_PRICE}</td>
								</tr>
							</tbody>
						</table>
						<table class="goods-view-form-table">
						</table>
						<table class="goods-view-form-table">
							<tbody>
								<tr>
									<th scope="row" class="goods-view-form-table-heading">용량</th>
									<td class="goods-view-form-table-cell">${list.DEAL_VOL}</td>
								</tr>
								<tr>
									<th scope="row" class="goods-view-form-table-heading">판매
										단위</th>
									<td class="goods-view-form-table-cell">${list.DEAL_UNIT}</td>
								</tr>

								<tr>
									<th scope="row" class="goods-view-form-table-heading">원산지</th>
									<td class="goods-view-form-table-cell">${list.DEAL_ORG}</td>
								</tr>

								<tr>
									<th scope="row" class="goods-view-form-table-heading">재고
										수량</th>
									<td class="goods-view-form-table-cell">${list.DEAL_COUNT}</td>
								</tr>
							</tbody>
						</table>


						<table class="goods-view-form-table">
							<tbody>
								<tr>
									<th scope="row" class="goods-view-form-table-heading">상세설명</th>
									<td class="goods-view-form-table-cell ex-line-type">${list.DEAL_CONTENT}
									</td>
								</tr>
							</tbody>
						</table>
						<table class="goods-view-form-table">
						</table>

						<form name="frm">
							<table class="goods-view-form-table">
								<input type="hidden" name="ea" step="1" min="1" max="0"
									value="1" />

								<tbody>
									<tr>
										<th scope="row" class="goods-view-form-table-heading">단품골라담기</th>
										<td class="goods-view-form-table-cell"><select
											name="addopt" id="addopt">
												<option value="0">==단품골라담기 선택==</option>
												<option value="1">${list.DEAL_TITLE}</option>
										</select> <select id="totalSettingId" name="addoptCount"
											onchange='totalSetting()'>
												<option value="0">==원하는 수량==</option>
												<c:forEach begin="1" var="i" end="${list.DEAL_COUNT}">
													<option value="${i}">${i}개</option>
												</c:forEach>
										</select></td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="view_info">
							<strong class="tit_info">안내사항</strong>
							<ul class="list_info">
								<li>식품 특성상 중량은 3% 내외의 차이가 발생할 수 있습니다.</li>
							</ul>
						</div>



					</div>

					<div id="el-multi-option-display" class="goods-view-order-table"
						style="display: none">
						<ul class="goods-view-order-list">
						</ul>
					</div>
					<div class="goods-view-total-price" id="totalCount">
						총 상품금액 : <span id="el-multi-option-total-price"
							class="__value-total-price">0</span>원 <span class="screen_out">(<span
							class="__value-total-ea">1</span>개)
						</span>
					</div>
					<div class="goods-view-form-button goodsview_cart">


						<button type="button" onclick="putBasket()"
							class="styled-button goods-cart-type">장바구니 &nbsp;담기</button>
						<div name="like" id="like">
							<c:if test="${like == 1}">
								<button type="button"
									onclick="javascript:act('../mypage/mypage_wishlist')"
									class="styled-button goods-heart-type">좋아요</button>
							</c:if>
							<c:if test="${like == 2}">
								<button type="button"
									onclick="javascript:act('../mypage/mypage_wishlist')"
									class="styled-button __active goods-heart-type ">좋아요</button>
							</c:if>
						</div>


					</div>
				</div>
			</div>
			<script type="text/javascript">
				$('.goods-heart-type').click(
						function() {
							if ('${typeSession}' == 1) {
								var c = $(".goods-heart-type").prop("class")
										.split("__active");
								if (c.length > 1) {//like ing
									likeAjax(1);
								} else {//unlike ing
									likeAjax(2);
								}
							} else {
								alert("개인 회원만 사용 가능합니다. ");
							}
						});

				function likeAjax(type) {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/member/likeAjax.tea'/>");
					if (type == 1) {//like ing
						comSubmit.addParam("type", 1);
					} else {//unlike ing
						comSubmit.addParam("type", 2);
					}
					comSubmit.addParam("NO", '${list.DEAL_NO}');
					comSubmit.addParam("DEAL_NO", '${list.DEAL_NO}');
					comSubmit.addParam("MEM_USER_NO", '${NOSession}');
					comSubmit.submit();
				}
			</script>

		</form>

		<div class="goods-view-infomation detail_wrap_outer"
			id="goods-view-infomation">
			<ul class="goods-view-infomation-tab-group">
				<li class="goods-view-infomation-tab"><a
					href="#goods-description"
					class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
				<li class="goods-view-infomation-tab"><a href="#goods-image"
					class="goods-view-infomation-tab-anchor">상품이미지</a></li>
				<li class="goods-view-infomation-tab"><a
					href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
				<li class="goods-view-infomation-tab"><a href="#goods-review"
					class="goods-view-infomation-tab-anchor">고객후기 <span></span>
				</a></li>

				<li class="goods-view-infomation-tab"><a href="#goods-qna"
					class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
			</ul>
			<div class="goods-view-infomation-content __active"
				id="goods-description">


				<div class="goods_wrap">
					<div class="goods_desc" id="detailImages">
						<div class='context'>
							<div class='pic'>
								<p class='words' align="center">
									<strong class='sub_tit'>${list.DEAL_TITLE }</strong>
									${list.DEAL_CONTENT }
								</p>
							</div>
						</div>
					</div>
				</div>

				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a
						href="#goods-description"
						class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image"
						class="goods-view-infomation-tab-anchor __active">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a
						href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review"
						class="goods-view-infomation-tab-anchor">고객후기 <span></span>
					</a></li>

					<li class="goods-view-infomation-tab"><a href="#goods-qna"
						class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-image">
					<div id="goods_pi">
						<p class="pic">
							<img
								src="//img-cf.kurly.com/shop/data/goodsview/20181008/gv00000033168_1.jpg">
						</p>
					</div>
				</div>
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a
						href="#goods-description"
						class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image"
						class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a
						href="#goods-infomation"
						class="goods-view-infomation-tab-anchor __active">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review"
						class="goods-view-infomation-tab-anchor">고객후기 <span></span>
					</a></li>

					<li class="goods-view-infomation-tab"><a href="#goods-qna"
						class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-infomation">

					<div class="goods_wrap">
						<div class="goods_desc" id="detailImages">
							<div class='context'>
								<div class='pic'>
									<p class='words' align="center">
										<strong class='sub_tit'>상세 정보</strong> 상품에 관한 상세 정보 입니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<table width="100%" border="0" cellpadding="0" cellspacing="1"
						class="extra-information">
						<tbody>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">상품명</th>
								<td>${list.DEAL_TITLE}</td>
								<th scope="row" class="goods-view-form-table-heading">상품
									등록일</th>
								<td>${list.DEAL_DATE }</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">포장단위</th>
								<td>${list.DEAL_UNIT}</td>
								<th scope="row" class="goods-view-form-table-heading">원산지</th>
								<td>${list.DEAL_ORG}</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">사업장명</th>
								<td>${list.MEM_COM_NAME }</td>
								<th scope="row" class="goods-view-form-table-heading">사업자명</th>
								<td>${list.MEM_COM_OWNER }</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">사업자번호</th>
								<td>${list.MEM_COM_RESI }</td>
								<th scope="row" class="goods-view-form-table-heading">통신판매번호</th>
								<td>${list.MEM_COM_COMNUM }</td>

							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">제조일자(포장일)</th>
								<td>제품 전/후면 별도표기</td>
								<th scope="row" class="goods-view-form-table-heading">소비자상담실
									전화번호</th>
								<td>${list.MEM_COM_COMPANY_PHONE }</td>
							</tr>
						</tbody>
					</table>



				</div>
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a
						href="#goods-description"
						class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image"
						class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a
						href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review"
						class="goods-view-infomation-tab-anchor __active">고객후기 <span></span></a></li>

					<li class="goods-view-infomation-tab"><a href="#goods-qna"
						class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
				</ul>

				<div class="goods-view-infomation-content" id="goods-review"
					data-load="0">
					<iframe id="inreview"
						src="http://localhost:8080/Dot_tea/teaDeal/starts.tea?DEAL_NO=${list.DEAL_NO}"
						frameborder="0" class="goods-view-infomation-board" height="737"></iframe>
				</div>

				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a
						href="#goods-description"
						class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image"
						class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a
						href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review"
						class="goods-view-infomation-tab-anchor">고객후기 <span></span>
					</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-qna"
						class="goods-view-infomation-tab-anchor __active">상품문의 <span></span></a></li>
				</ul>

				<div class="goods-view-infomation-content" id="goods-qna"
					data-load="0">
					<iframe id="inqna"
						src="http://localhost:8080/Dot_tea/com_qna/openBoardList.tea?DEAL_NO=${list.DEAL_NO}"
						frameborder="0" class="goods-view-infomation-board" height="577"
						width="1010"></iframe>
					<input type="hidden" id="DEAL_NO" value="${list.DEAL_NO}">
				</div>
			</div>
		</div>
	</div>
	<script>
		jQuery(function($) {
			var $infoContainer = $('#goods-view-infomation');
			var $infoAnchors = $infoContainer
					.find('.goods-view-infomation-tab-anchor');
			var $infoContents = $infoContainer
					.find('.goods-view-infomation-content');

			$infoContainer.on('click', '.goods-view-infomation-tab-anchor',
					function($e) {
						$e.preventDefault();
						var hash = $(this).attr('href').replace(/^#/, "");
						var $container = $('#' + hash, $infoContainer);
						$(window).scrollTop($container.offset().top - 100);
					});
		});

		// PD-811 장차석 : Kurly's Tip 동영상 들어갈시 사이즈조정
		if ($('.goods_tip .tip_box iframe').length > 0) {
			$('.goods_tip .tip_box iframe').css({
				width : '100%',
				'margin-bottom' : '30px'
			}).css({
				height : $('.goods_tip .tip_box iframe').width() / 1.75
			});
		}
	</script>
	</div>

	<div class="goods-view-flow-cart" id="flow-cart">
		<div class="goods-view-flow-cart-wrapper">
			<button type="button" id="show-option-button"
				class="goods-view-show-option-button">
				<span class="goods-view-show-option-button-value">옵션선택</span>
			</button>
			<div id="flow-cart-content" class="goods-view-flow-cart-content">
				<form name="frmView2" method="post" onsubmit="return false"
					class="__connect-form">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="1385"> <input
						type="hidden" name="goodsCoupon" value="0">



				</form>
			</div>
		</div>
	</div>


	</div>

	<iframe name="xdomain-abb2ca0c" id="xdomain-abb2ca0c"
		src="https://api.kurly.com/xdomain" style="display: none;"></iframe>

	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>


	<script type="text/javascript">
		window.NREUM || (NREUM = {});
		NREUM.info = {
			"beacon" : "bam.nr-data.net",
			"licenseKey" : "2982e7e5e8",
			"applicationID" : "82369478",
			"transactionName" : "MVBTZxFTDEJVAUFcWwgaZEEKHRFZWxIaUlsJUUIcBF0NVUc9Q1xRERtBWxM=",
			"queueTime" : 0,
			"applicationTime" : 324,
			"atts" : "HRdQEVlJH0w=",
			"errorBeacon" : "bam.nr-data.net",
			"agent" : ""
		}
	</script>
	<div id="criteo-tags-div" style="display: none;"></div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>