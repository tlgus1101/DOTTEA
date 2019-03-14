function TeaBasketListAjaxCallback(data) {

	var total = data.TOTAL;
	Atotal = data.TOTAL;
	/* var body = $("table>tbody"); */

	var body = document.getElementById("viewGoods");
	var firstCompany = data.firstCompany;
	var firstCompanyName = "";
	var DELIVERYFREE = "";
	var companyPrice = 0;
	totalCkSetting();

	// body.empty();
	if (total == 0) {
		var str = "<div class='no_data'><span class='name'>"
				+ "장바구니에 담긴 상품이 없습니다.</span></div>";
		// body.append(str);
		body.innerHTML = str;

	} else {

		var str = "";
		var count = 0;
		$
				.each(
						data.list,
						function(key, value) {

							var images = value.DEAL_IMGSV;
							var imageslist = "";
							if (images != null)
								imageslist = images.split(",");
							++count;

							if (firstCompany != value.MEM_COM_ID) {
								companyPrice;

								value.MEM_COM_DELIVERYFREE

								str += "<div class='view_goods' ><div class='name_goods'><span class='name'>"
										+ firstCompanyName
										+ " 배송비는 "
										+ DELIVERYFREE
										+ " 이상 무료 배송입니다.<br>"
										+ " 상품 가격 <label id='won_"
										+ firstCompany
										+ "'>"
										+ 0
										+ "</label>원 + 배송비 <label id='delivert_"
										+ firstCompany
										+ "' >"
										+ "0</label> 원   =  주문금액 <label id='priceCompany_"
										+ firstCompany
										+ "' >"
										+ "0</label> 원 </span> </div>";
								firstCompany = value.MEM_COM_ID;

								str += "<div><div class='view_goods view_pakege fst lst'><div class='name_goods'>"
										+ value.MEM_COM_NAME + "</div>";
							} else {
								str += "<div><div class='view_goods view_pakege fst lst'><div class='name_goods'>"
										+ value.MEM_COM_NAME + "</div>";
							}

							str += "<table class='tbl_goods goods'>"
									+ "<caption>장바구니 목록 내용</caption><colgroup>"
									+ "<col style='width: 76px;'>"
									+ "<col style='width: 100px;'>"
									+ "<col style='width: 488px;'>"
									+ "<col style='width: 112px;'>"
									+ "<col style='width: 86px;'>"
									+ "<col style='width: 110px;'>"
									+ "<col style='width: auto;'>"
									+ "</colgroup><tbody><tr><td header='thSelect' class='goods_check'><label class='label_check' id ='cklabel' name='cklabe'>"
									+ "<input type='hidden' name='DEAL_TITLE' id='DEAL_TITLE' value='"
									+ value.DEAL_TITLE
									+ "'>"
									+ "<input type='hidden' name='MEM_COM_ID' id='MEM_COM_ID' value='"
									+ value.MEM_COM_ID
									+ "'>"
									+ "<input type='hidden' name='B_NO' id='B_NO' value='"
									+ value.B_NO
									+ "'><input type='hidden' name='ck_PRICE' id='ck_PRICE' value='"
									+ (value.DEAL_PRICE * value.B_COUNT)
									+ "'><input type='hidden' name='MEM_COM_DELIVERYFREE' id='MEM_COM_DELIVERYFREE' value='"
									+ value.MEM_COM_DELIVERYFREE
									+ "'><input type='checkbox'"
									+ "name='ckedBox' id='ckedBox' onclick='ckSetting($(this))' class='ico_check' value='"
									+ value.DEAL_NO
									+ "'></label></td>"
									+ "<td header='thInfo' class='goods_thumb'><a href='#this'class='thumb' name='title' ><input type='hidden' name='NO' id='NO' value='"
									+ value.DEAL_NO
									+ "'>"
									+ "<img src='../images/"
									+ imageslist[0]
									+ "'alt='상품이미지'></a></td><td header='thInfo' class='goods_info'><a"
									+ "href='#this' name='title' class='name'>["
									+ value.MEM_COM_NAME
									+ "] "
									+ value.DEAL_TITLE
									+ "<input type='hidden' name='NO' id='NO' value='"
									+ value.DEAL_NO
									+ "'></a>"
									+ "<dl class='goods_cost'> <dt class='screen_out'>판매가격</dt>"
									+ "<dd class='selling_price'> <span class='num'>"
									+ value.DEAL_PRICE
									+ "</span> <span class='txt'>원</span>"
									+ "</dd></dl> <p class='txt txt_limit'>"
									+ "<span>재고 "
									+ value.DEAL_COUNT
									+ "개 </span></p></td>"

							str += "<td header='thCount'><div class='goods_quantity'>"
									+ "<div class='quantity'><strong class='screen_out'>수량</strong>"
									+ "<button type='button' class='btn reduce' >"
									+ "<img src='../images/ico_minus.png'  alt='감소'></button>"
									+ "<input type='text'  name='B_COUNT' id='B_COUNT' readonly='readonly'class='inp_quantity' value='"
									+ value.B_COUNT
									+ "'>"
									+ "<input type='hidden' name='B_NO' id='B_NO' value='"
									+ value.B_NO
									+ "'>"
									+ "<input type='hidden' name='DEAL_NO' id='DEAL_NO' value='"
									+ value.DEAL_NO
									+ "'>"
									+ "<input type='hidden' name='DEAL_COUNT' id='DEAL_COUNT' value='"
									+ value.DEAL_COUNT
									+ "'>"
									+ "<button type='button' class='btn rise'>"
									+ "<img src='../images/ico_plus.png' alt='추가'>"
									+ "</button></div></div></td>";

							str += "<td header='thCost'><dl class='goods_total'>"
									+ "<dt class='screen_out'>합계</dt><dd class='result'>"
									+ "<span class='num'>"
									+ (value.DEAL_PRICE * value.B_COUNT)
									+ "</span> <span class='txt'>원</span>"
									+ "</dd></dl></td>"
									+ "<td header='thDelete' class='goods_delete'><button type='button' id='deleteTea' class='btn btn_delete'>"
									+ "<input type='hidden' name='B_NO' id='B_NO' value='"
									+ value.B_NO
									+ "'><input type='hidden' name='DEAL_NO' id='DEAL_NO' value='"
									+ value.DEAL_NO
									+ "'><img src='../images/btn_close.png' alt='삭제'>"
									+ "</button></td></tr>";

							str += "</tbody></table></div></div>";
							firstCompanyName = value.MEM_COM_NAME;
							DELIVERYFREE = value.MEM_COM_DELIVERYFREE;

							// body.append(str);
							companyPrice += (value.DEAL_PRICE * value.B_COUNT);

							if (count == total) {
								str += "<div class='view_goods' ><div class='name_goods'><span class='name'>"
										+ firstCompanyName
										+ " 배송비는 "
										+ DELIVERYFREE
										+ " 이상 무료 배송입니다.<br>"
										+ " 상품 가격 <label id='won_"
										+ firstCompany
										+ "'>"
										+ 0
										+ "</label>원 + 배송비 <label id='delivert_"
										+ firstCompany
										+ "' >"
										+ "0 </label>원  =  주문금액 <label id='priceCompany_"
										+ firstCompany
										+ "' >"
										+ "0 </label>원 </span> </div>";
							}

							body.innerHTML = str;
						});

		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			teaDealDetail($(this));
		});

		$("button[id=deleteTea]").click(function(e) {
			e.preventDefault();
			TeaBasketListDeleteAjax($(this));
		});

		$('.rise')
				.click(
						function(e) {
							e.preventDefault();

							var B_CountInput = $(this).parent()
									.find("#B_COUNT").val();
							var DEAL_COUNT = $(this).parent().find(
									"#DEAL_COUNT").val();

							if (Number(B_CountInput) < Number(DEAL_COUNT)) {
								B_Count_change(1, $(this).parent()
										.find("#B_NO").val(), $(this).parent()
										.find("#DEAL_NO").val());

							} else {
								alert("최대 수량입니다.");
							}

						});

		$('.reduce').click(
				function(e) {
					e.preventDefault();

					var B_CountInput = $(this).parent().find("#B_COUNT").val();

					if (Number(B_CountInput) > 1) {
						B_Count_change(2, $(this).parent().find("#B_NO").val(),
								$(this).parent().find("#DEAL_NO").val());

					} else {
						alert("최소 수량입니다.");
					}
				});
	}
}

var Atotal;
function totalCkSetting() {
	var cntEPT = $('input:checkbox[name=ckedBox]:checked').length;

	var body = document.getElementById("tit");
	body.innerHTML = "전체선택 (<span class='num_count'>" + cntEPT
			+ "</span>/<span class='num_total'>" + Atotal + "</span>)";
	body = document.getElementById("tit2");
	body.innerHTML = "전체선택 (<span class='num_count'>" + cntEPT
			+ "</span>/<span class='num_total'>" + Atotal + "</span>)";

}

function ckSetting(obj) {
	var cntEPT = $('input:checkbox[name=ckedBox]:checked').length;

	if (cntEPT == Atotal) {
		$("input[name='ckedBox']").prop("checked", true);
		$(".label_check").addClass("checked");
	} else {
		$("#allCheck").parent().removeClass("checked");
		$("#allCheck2").parent().removeClass("checked");
	}

	if (obj.is(":checked")) {
		obj.parent().addClass("checked");
		obj.prop("checked", true);

		CompanyPriceSetting(obj.parent().find("#MEM_COM_ID").val(), obj
				.parent().find("#ck_PRICE").val(), obj.parent().find(
				"#MEM_COM_DELIVERYFREE").val(), 1);

	} else {
		obj.parent().removeClass("checked");
		obj.prop("checked", false);

		CompanyPriceSetting(obj.parent().find("#MEM_COM_ID").val(), obj
				.parent().find("#ck_PRICE").val(), obj.parent().find(
				"#MEM_COM_DELIVERYFREE").val(), 2);
	}

	totalCkSetting();// allCheck ckedBox
}

function CompanyPriceSetting(com_Id, com_Price, com_Deliver, type) {
	var str = "#won_" + com_Id;
	var dv = $('#delivert_' + com_Id).text();

	if (type == 1) {
		var won = Number($(str).text());
		var delivert = Number(com_Deliver) > (Number(won) + Number(com_Price)) ? 2500
				: 0;

		$(str).html(Number(won) + Number(com_Price));
		$('#delivert_' + com_Id).html(delivert);
		$('#priceCompany_' + com_Id).html(
				Number($(str).text()) + Number(delivert));

		$('#finishDelP').html(
				Number($('#finishDelP').text()) + Number(com_Price));

		var d = Number(delivert) + Number($('#finishDelF').text()) - Number(dv);

		$('#finishDelF').html(d);

		$('#FinishBuyPrice').html(
				Number($('#finishDelF').text())
						+ Number($('#finishDelP').text()));

	} else {
		var won = Number($(str).text());
		var delivert = Number(com_Deliver) > (Number(won) - Number(com_Price)) ? 2500
				: 0;

		$(str).html(Number(won) - Number(com_Price));

		if (Number($(str).text()) == 0) {
			$('#delivert_' + com_Id).html(0);
			delivert = 0;
		} else {
			$('#delivert_' + com_Id).html(delivert);
		}

		$('#priceCompany_' + com_Id).html(
				Number($(str).text()) + Number(delivert));

		$('#finishDelP').html(
				Number($('#finishDelP').text()) - Number(com_Price));

		$('#finishDelF')
				.html(
						Number($('#finishDelF').text()) - Number(dv)
								+ Number(delivert));

		$('#FinishBuyPrice').html(
				Number($('#finishDelF').text())
						+ Number($('#finishDelP').text()));

	}

}