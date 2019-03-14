<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
</head>
<body class="goods-goods_cart">

	<%@ include file="/WEB-INF/include/include-header.jspf"%>

	<div class="layout-page-header">
		<h2 class="layout-page-title">장바구니</h2>
		<div class="pg_sub_desc">
			<p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
		</div>
	</div>
	<div id="main">


		<style type="text/css">
/* 장바구니에서만 전용 */
.layout-page-header {
	padding-bottom: 10px
}

.section_cart .tbl_goods .goods_quantity .btn {
	float: left;
	width: 30px;
	height: 30px;
	border: 0 none;
	background-color: #f3f3f3
}

.section_cart .tbl_goods .goods_quantity .btn img {
	width: 20px;
	vertical-align: middle
}

.btn_reduce {solid #ddd
	
}

.btn_reduce img {
	width: 25px;
	height: 25px
}

.btn_rise {solid #ddd
	
}

.btn_rise img {
	width: 30px;
	height: 25px
}

.section_cart .tbl_goods .goods_quantity .inp_quantity {
	float: left;
	width: 38px;
	height: 30px;
	border: 0 none;
	background-color: #fff;
	font-size: 12px;
	color: #000;
	text-align: center;
	letter-spacing: -0.2px
}

.section_cart .tbl_goods .goods_total .result {
	font-weight: 700;
	font-size: 14px;
	color: #000;
	letter-spacing: -0.2px;
	text-align: right
}

.section_cart .tbl_goods .goods_delete {
	padding-left: 41px;
	text-align: left
}

.section_cart .tbl_goods .goods_delete .btn_delete {
	display: block;
	width: 30px;
	height: 30px;
	border: 0 none;
	background-color: #fff
}

.section_cart .tbl_goods .goods_delete .btn_delete img {
	display: block;
	width: 12px;
	height: 12px
}

.label_check {
	display: inline-block;
	padding: 0 21px 0 5px;
	background: #fff url(../images/ico_checkbox.png) no-repeat 0 2px;
	font-size: 14px;
	color: #000;
	line-height: 18px;
	cursor: pointer;
	white-space: nowrap
}

.label_check.checked {
	background: #fff url(../images/checked.png) no-repeat 0 2px
}
</style>
		<div class="user_form section_cart">

			<form id="viewCart" id="frmCart" name="frmCart" method="post">

				<input type="hidden" name="mode" value="setOrder">
				<div class="tbl_comm cart_goods">
					<table class="tbl_comm tbl_header">
						<caption>장바구니 목록 제목</caption>
						<colgroup>
							<col style="width: 375px;">
							<col style="width: 432px;">
							<col style="width: 115px;">
							<col style="width: 110px;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th id="thSelect"><div class="all_select">
										<label class="label_check" id="allCk"><input
											type="checkbox" name="allCheck" id="allCheck"
											class="ico_check"></label> <span class="tit" id="tit">
										</span>
									</div></th>
								<th id="thInfo">상품 정보</th>
								<th id="thCount">수량</th>
								<th id="thCost">상품금액</th>
								<th id="thDelete"><span class="screen_out">삭제선택</span></th>
							</tr>

						</thead>
					</table>
					<div id="viewGoods"></div>
				</div>
				<div class="all_select select_option">
					<label class="label_check" id="allCk"><input
						type="checkbox" name="allCheck2" id="allCheck2" class="ico_check"></label>
					<span class="tit" id="tit2"> </span>
					<button type="button" class="btn_delete">선택 삭제</button>
				</div>
				<div class="cart_result">
					<div class="cart_amount cell_except">
						<div class="amount_detail">
							<dl class="list amount_total">
								<dt class="tit">결제하실</dt>
								<dd class="result">
									<span class="inner_result"><span class="txt">총 금액
									</span> <span class="txt"></span></span>
								</dd>
							</dl>
							<div class="deco deco_minus">
								<span class="ico fst"></span> <span class="ico"></span>
							</div>
							<dl class="list amount_dc">
								<dt class="tit">상품금액</dt>
								<dd class="result">
									<span class="inner_result add"><span class="num"><label
											id="finishDelP">0</label> </span> <span class="txt">원</span> </span>
								</dd>
							</dl>

						</div>
						<div class="deco deco_plus">
							<span class="ico fst"></span> <span class="ico"></span>
						</div>
						<dl class="list amount_delivery">
							<dt class="tit">배송비</dt>
							<dd class="result">
								<span class="inner_result add"><span class="num"><span>+</span><label
										id="finishDelF">0</label></label></span> <span class="txt">원</span></span>
							</dd>
						</dl>
						<div class="deco deco_equal">
							<span class="ico fst"></span> <span class="ico"></span>
						</div>
						<dl class="list amout_result">
							<dt class="tit">결제예정금액</dt>
							<dd class="result">
								<span class="inner_result add"><span class="num"><label
										id="FinishBuyPrice">0</label></span> <span class="txt">원</span> <!---->
									<c:if test="${NOSession == null }">
										<span class="no_login">로그인 시 구매 가능합니다.</span>
									</c:if></span>
							</dd>
						</dl>
					</div>
					<div class="notice_cart"></div>
					<button type="button" class="btn_submit">주문하기</button>
					<!-- /member/teaDealBuy.tea -->
				</div>
			</form>
		</div>
		<div class="bg_loading" id="bgLoading" style="display: none;">
			<div class="loading_show"></div>
		</div>
		<script>
			viewCart.userGrade = "";
		</script>
		<script type="text/javascript">
			viewCart.loginCheck = false;
		</script>
	</div>


	<script src="<c:url value='/js/buyTeaDeal.js' />"></script>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					TeaBasketListAjax();
					$(function() {
						$(".btn_submit").click(function() {
							teaDealBuy();
						});
					});

					$('.btn_delete').click(function() {
						$("input[name='ckedBox']:checked").each(function() {

							TeaBasketListDeleteAjax($(this));
						});

					});

					$('#allCheck').click(
							function() {
								if ($("#allCheck").prop("checked")) {
									$("input[name='ckedBox']").prop("checked",
											true);
									$("#allCheck2").prop("checked", true);
									$(".label_check").addClass("checked");
									$("input[name='ckedBox']:checked").each(
											function(index, item) {
												item.onclick($(this));
											});

								} else {
									$("input[name='ckedBox']").prop("checked",
											false);
									$("#allCheck2").prop("checked", false);
									$(".label_check").removeClass("checked");
									$("input[name='ckedBox']").each(
											function(index, item) {
												item.onclick($(this));
											});
								}
								totalCkSetting();//allCheck ckedBox
							});

					$('#allCheck2').click(
							function() {
								if ($("#allCheck2").prop("checked")) {
									$("input[name='ckedBox']").prop("checked",
											true);
									$("#allCheck").prop("checked", true);
									$(".label_check").addClass("checked");
									$("input[name='ckedBox']:checked").each(
											function(index, item) {
												item.onclick();
											});

								} else {
									$("input[name='ckedBox']").prop("checked",
											false);
									$("#allCheck").prop("checked", false);
									$(".label_check").removeClass("checked");
									$("input[name='ckedBox']").each(
											function(index, item) {
												item.onclick();
											});

								}
								totalCkSetting();//allCheck ckedBox
							});

				});

		function TeaBasketListAjax() {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/member/TeaBasketListAjax.tea'/>");
			comAjax.setCallback("TeaBasketListAjaxCallback");
			comAjax.ajax();
		}
		function TeaBasketListDeleteAjax(obj) {
			var comAjax = new ComAjax();
			comAjax
					.setUrl("<c:url value='/member/TeaBasketListDeleteAjax.tea'/>");
			comAjax.setCallback("TeaBasketListAjax");
			comAjax.addParam("B_NO", obj.parent().find('#B_NO').val());
			comAjax.addParam("DEAL_NO", obj.parent().find('#DEAL_NO').val());
			comAjax.ajax();
		}

		function B_Count_change(type, B_NO, DEAL_NO) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/member/B_Count_change.tea'/>");
			comAjax.addParam("B_NO", B_NO);
			comAjax.addParam("DEAL_NO", DEAL_NO);
			if (type == 1) {
				comAjax.addParam("type", 1);
			} else {
				comAjax.addParam("type", 2);
			}
			comAjax.setCallback("TeaBasketListAjax");
			comAjax.ajax();

		}

		function teaDealBuy() {
			var comSubmit = new ComSubmit();
			if ('${NOSession}' == "") {
				alert("로그인 후 주문 가능합니다.");
				comSubmit.setUrl("<c:url value='/login/loginForm.tea'/>");
			} else {
				if ('${typeSession}' == 1) {

					var b_noList = [];
					var dealTitle = [];
					$("input[name='ckedBox']:checked").each(
							function(index, item) {
								b_noList.push($(this).parent().find("#B_NO")
										.val());
								dealTitle.push($(this).parent().find(
										"#DEAL_TITLE").val());
							});

					comSubmit
							.setUrl("<c:url value='/member/teaDealBuy.tea' />");
					comSubmit.addParam("FinishBuyPrice", $('#FinishBuyPrice')
							.text());
					comSubmit.addParam("B_NOList", b_noList);
					comSubmit.addParam("dealTitleList", dealTitle);
				} else {
					alert("개인 회원만 주문 가능합니다.");
				}
			}
			comSubmit.submit();
		}

		function teaDealDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea'/>");
			comSubmit.addParam("NO", obj.parent().find("#NO").val());
			comSubmit.submit();
		}
	</script>


</body>
</html>