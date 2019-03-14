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


	<div id="content">


		<div class="page_aticle">
			<div id="lnbMenu" class="lnb_menu">
				<div id="bnrCategory" class="bnr_category" style="">
					<div class="thumb">
						<img src="" alt="카테고리배너">
					</div>
					<a href="#none" class="link_event">페이지 이동</a>
				</div>
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="ico"><img
							src="https://res.kurly.com/pc/img/1808/bg_blink_120_91.png"
							id="goodsListIconView" alt="카테고리 아이콘"></span> <span class="tit"><c:if
								test="${teaShopType==1}">찻잎</c:if> <c:if
								test="${teaShopType==2}">다기</c:if> <c:if
								test="${teaShopType==5}">악세서리</c:if> <c:if
								test="${teaShopType==6}">이벤트</c:if></span>
					</div>
					<div id="category_List"></div>
				</div>
			</div>
			<div id="goodsList" class="page_section section_goodslist">
				<div id="setting_Type" class="list_ability">
					<!--selectType-->




				</div>

				<div class="list_goods">
					<div class="inner_listgoods">
						<ul class="list">
							<table>
								<tbody></tbody>
							</table>
						</ul>
					</div>
				</div>

				<%@ include file="/WEB-INF/include/include-body.jspf"%>
				<div class="layout-pagination">
					<div class="pagediv" id="PAGE_NAVI"></div>
				</div>

			</div>
		</div>

		<div class="bg_loading" id="bgLoading" style="display: none;">
			<div class="loading_show"></div>
		</div>


		<script src="<c:url value='/js/teaDeal.js' />"></script>

		<script type="text/javascript">
			ckSelectButton = 0;
			selectType = 1;// 신상품순 

			$(document).ready(function() {
			if(${teaShopType}==1){
				TeaListAjax(1, 1);
				 categorySetting(1);
			}
			else if(${teaShopType}==2){
				TeaTotalListAjax(1,1,0);
			}
		    else if(${teaShopType}==5){
		         TeaAccListAjax(1,1);
		         categorySetting(5);
		     }
		    else if(${teaShopType}==6){
		         TeaEventListAjax(1,1);
		         categorySetting(6);
		      }
			});
			
			

			var count = 9;
			var types = 1;
			function TeaListAjax(pageNo, type) {

				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/teaDeal/teaListAjax.tea'/>");
				comAjax.setCallback("TeaListAjaxCallback");
				comAjax.addParam("PAGE_INDEX", pageNo);
				comAjax.addParam("PAGE_ROW", count);

				if (type != undefined) {
					comAjax.addParam("select_type", type);
					types = type;
				} else {
					comAjax.addParam("select_type", 1);
					types = 1;
				}
				comAjax.ajax();
			}
			
		
			function TeaTotalListAjax(pageNo,type,DealType) {
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/teaDeal/teaSetTotalList.tea'/>");
				comAjax.setCallback("TeaTotalListAjaxCallback");
				comAjax.addParam("PAGE_INDEX", pageNo);
				comAjax.addParam("PAGE_ROW", count);
				comAjax.addParam("DealType", DealType);
			

				if (type != undefined) {
					comAjax.addParam("select_type", type);
					types = type;
				} else {
					comAjax.addParam("select_type", 1);
					types = 1;
				}
				comAjax.ajax();
			}

			function teaDealDetail(obj){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea'/>");
				comSubmit.addParam("NO", obj.parent().find("#NO").val());
				comSubmit.submit();
			}
			
			
			 function TeaAccListAjax(pageNo,type) {
		            var comAjax = new ComAjax();
		            comAjax.setUrl("<c:url value='/teaDeal/teaAccList.tea'/>");
		            comAjax.setCallback("TeaAccListAjaxCallback");
		            comAjax.addParam("PAGE_INDEX", pageNo);
		            comAjax.addParam("PAGE_ROW", count);

		            if (type != undefined) {
		               comAjax.addParam("select_type", type);
		               types = type;
		            } else {
		               comAjax.addParam("select_type", 1);
		               types = 1;
		            }
		            comAjax.ajax();
		            
		         }
		         
		         function TeaEventListAjax(pageNo,type) {
		            var comAjax = new ComAjax();
		            comAjax.setUrl("<c:url value='/teaDeal/teaEventList.tea'/>");
		            comAjax.setCallback("TeaEventListAjaxCallback");
		            comAjax.addParam("PAGE_INDEX", pageNo);
		            comAjax.addParam("PAGE_ROW", count);

		            if (type != undefined) {
		               comAjax.addParam("select_type", type);
		               types = type;
		            } else {
		               comAjax.addParam("select_type", 1);
		               types = 1;
		            }
		            comAjax.ajax();
		            
		         }

			
		</script>
	</div>

</body>
</html>