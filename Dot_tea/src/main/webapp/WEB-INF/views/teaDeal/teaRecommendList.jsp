<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- <script type="text/javascript" src="https://www.kurly.com//js/jquery-3.js"></script>
 -->
<meta charset="UTF-8">

<title>DOTEA</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" async=""
	src="http://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript"
	src="https://bam.nr-data.net/1/2982e7e5e8?a=82369478&amp;v=1099.d27c17c&amp;to=MVBTZxFTDEJVAUFcWwgaZEEKHRFZWxIaWFUPWx5bF18OH0QKRQ%3D%3D&amp;rst=2637&amp;ref=http://www.kurly.com/shop/main/html.php&amp;ap=112&amp;be=284&amp;fe=2093&amp;dc=890&amp;af=err,xhr,stn,ins&amp;perf=%7B%22timing%22:%7B%22of%22:1548311823021,%22n%22:0,%22f%22:82,%22dn%22:82,%22dne%22:82,%22c%22:82,%22ce%22:82,%22rq%22:83,%22rp%22:226,%22rpe%22:243,%22dl%22:252,%22di%22:889,%22ds%22:889,%22de%22:915,%22dc%22:2092,%22l%22:2092,%22le%22:2101%7D,%22navigation%22:%7B%7D%7D&amp;at=HRdQEVlJH0w%3D&amp;jsonp=NREUM.setToken"></script>
<script src="https://js-agent.newrelic.com/nr-1099.min.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/gtm/js?id=GTM-MRW9DRV&amp;cid=835621150.1546848502"></script>
<script
	src="https://teralog.techhub.co.kr/init?la_uid=1546848491235924333&amp;la_dcrf=https%3A%2F%2Fwww.google.com%2F&amp;la_dcurl=http%3A%2F%2Fwww.kurly.com%2Fshop%2Fmain%2Fhtml.php%3Fhtmid%3Devent%2Fjoin%2Fjoin_190102.htm%26utm_source%3DPU_1055%26utm_medium%3D1901%26utm_campaign%3DSA_google%26utm_term%3D%25EB%25A7%2588%25EC%25BC%2593%25EC%25BB%25AC%25EB%25A6%25AC%26la_gc%3DTR10082304856%26la_src%3Dsa%26la_cnfg%3D502249&amp;la_dccs=EUC-KR&amp;la_dcttl=%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%3A%3A%20%EB%82%B4%EC%9D%BC%EC%9D%98%20%EC%9E%A5%EB%B3%B4%EA%B8%B0%2C%20%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC&amp;la_r=883989771&amp;la_gc=TR10082304856&amp;la_crsd_gc=&amp;la_sv=59ed4fc&amp;la_callback=_LA.CBI"></script>
<script src="https://teralog.techhub.co.kr/ckie"></script>
<script
	src="http://sas.nsm-corp.com/sa-w.js?gc=TR10082304856&amp;rd=1548311823910"></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NJDKR7R"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification"
	content="58ff7c242d41178131208256bfec0c2f93426a1d">
<script type="text/javascript"
	src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js?ver=201901221723"></script>
<script
	src="https://res.kurly.com/js/lib/jquery.lazyload.min.js?ver=201901221723"></script>
<script src="//res.kurly.com/js/vue/xdomain.min.js"
	slave="https://api.kurly.com/xdomain"></script>
<script src="//res.kurly.com/js/vue/es6-promise.min.js?ver=201901221723"></script>
<script
	src="//res.kurly.com/js/vue/es6-promise.auto.min.js?ver=201901221723"></script>
<script type="text/javascript"
	src="//res.kurly.com/js/vue/axios.min.js?ver=201901221723"></script>
<script src="//res.kurly.com/js/vue/vue.min.js?ver=201901221723"></script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js"
	async="true"></script>

<style>
body .criteo_header {
	display: none
}
</style>
<style type="text/css">
/* event_common */
#qnb {
	display: none
}

#content {
	padding-bottom: 0
}

.page_event {
	min-width: 1050px
}

.page_event img {
	vertical-align: top
}

.page_event .view_event {
	width: 1050px;
	margin: 0 auto;
	text-align: center
}

.page_event .btn_link {
	overflow: hidden;
	position: absolute;
	/* background: url(https://res.kurly.com/images/common/bg_1_1.gif) repeat 0
		0; */
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}
/* event_style */
.page_event .view_event1 {
	height: 546px;
	background: url(../images/mainbanner.jpeg) no-repeat 50% 0 /*메인 광고 화면 */
}

.page_event .view_event1 .view_event {
	position: relative
}

.page_event .view_event1 .link_join {
	left: 0px;
	top: 370px;
	width: 354px;
	height: 111px;
	background: url(../images/join.png) no-repeat 50% 50%
}

.page_event .view_event1 .link_join:hover {
	background: url(../images/join_hover.png) no-repeat 50% 50%
}

.page_event .view_event2 {
	height: 120px;
	background: url(../images/DotTEA_banner.png) no-repeat 50% 0
		/*tab_main 메인 광고 화면 */
}

.page_event .view_event2 .view_event {
	position: relative
}

.page_event .view_event2 .link_benefit {
	width: 1050px;
	height: 120px
}

.page_event .view_event2 .link_benefit .btn_link {
	width: 349px;
	height: 120px;
	/* background-image:
		url(https://res.kurly.com/images/event/join/181031/pc/tab_menu.jpg); */
	background-position: 0 0;
	background-repeat: no-repeat /* 인기 상품 1-00 --- 이부분 메인 광고 화면 */
}

.page_event .view_event2 .btn_link.link_benefit1 {
	left: 0
}

.page_event .view_event2 .btn_link.link_benefit1:hover {
	background-position: 0 -120px
}

.page_event .view_event2 .btn_link.link_benefit2 {
	left: 350px;
	background-position: -349px 0
}

.page_event .view_event2 .btn_link.link_benefit2:hover {
	background-position: -349px -120px
}

.page_event .view_event2 .btn_link.link_benefit3 {
	width: 351px;
	left: 699px;
	background-position: -699px 0
}

.page_event .view_event2 .btn_link.link_benefit3:hover {
	background-position: -699px -120px
}

.page_event .view_event3 {
	height: 840px;
	background: #f9f9f9
		url(https://res.kurly.com/images/event/join/181004/pc/img_special.jpg)
		no-repeat 50% 0
}

.page_event .view_event4 .view_event {
	position: relative
}

.page_event .view_event4 .tit {
	padding: 124px 0 23px
}

.page_event .view_event4 .list_goods {
	overflow: hidden;
	width: 1050px;
	margin: 0 auto 100px;
	text-align: center
}

.page_event .view_event4 .list {
	float: left;
	width: 1095px
}

.page_event .view_event4 .list li {
	position: relative;
	float: left;
	width: 320px;
	height: 503px;
	margin: 22px 45px 0 0
}

.page_event .view_event4 .list li.exception {
	width: 503px;
	padding-left: 183px
}

.page_event .view_event5 {
	height: 861px;
	background: #f7f8f9
		url(https://res.kurly.com/images/event/join/180502/pc/img_benefit2.jpg)
		no-repeat 50% 124px
}

.page_event .view_event6 {
	height: 840px;
	background: #ebecee
		url(https://res.kurly.com/images/event/join/181212/pc/img_benefit3.png)
		no-repeat 50% 82px
}

.page_event .view_best {
	padding-bottom: 280px;
	background-color: #fff
}

.page_event .view_best .tit {
	padding: 117px 0 58px;
	text-align: center
}

.page_event .view_best .list_best {
	overflow: hidden;
	width: 1050px;
	padding-bottom: 29px
}

.page_event .view_best .list {
	float: left;
	width: 1070px
}

.page_event .view_best .list li {
	float: left;
	margin: 28px 20px 0 0
}

.page_event .view_best .page_btn {
	position: relative
}

.page_event .view_best .page_btn .btn_link {
	position: absolute;
	top: 44px;
	left: 100px;
	width: 440px;
	height: 122px
}

.page_event .view_best .page_btn .btn_best {
	background: url(../images/event.png) no-repeat
}

.page_event .view_best .page_btn .btn_best:hover {
	background: url(../images/event_hover.png) no-repeat
}

.page_event .view_best .page_btn .btn_join {
	left: 530px;
	background: url(../images/join.png) no-repeat 50% 50%;
}

.page_event .view_best .page_btn .btn_join:hover {
	background: url(../images/join_hover2.png) no-repeat 50% 50%;
}

/* soldout */
.page_event .item_soldout {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background:
		url(https://res.kurly.com/images/event/join/180207/m/bg_soldout.png)
		no-repeat 50% 50%;
	background-size: cover
}

.page_event .soldout .item_soldout {
	display: block
}
</style>

<style type="text/css">
.notice_ie8 {
	display: none;
	width: 100%;
	height: 70px;
	padding-top: 23px;
	background-color: #d5586f;
	font-weight: 400;
	font-size: 16px;
	font-family: 'Noto Sans';
	color: #fff;
	letter-spacing: -0.4px;
	text-align: center
}

.notice_ie8 .inner_noticeie8 {
	display: block;
	width: 1050px;
	margin: 0 auto
}

.notice_ie8 .emph {
	padding: 0 16px 0 11px;
	background:
		url(https://res.kurly.com/pc/ico/1801/ico_arrow_noticeie8.png)
		no-repeat 100% 55%;
	font-family: 'Noto Sans';
	font-weight: 700
}
</style>

<style type="text/css">
.bnr_qnb {
	padding-bottom: 10px
}

.bnr_qnb img {
	width: 107px;
	vertical-align: top
}
</style>


<script type="text/javascript">
	$(document).ready(function() {
		$("#top-message-close").on("click", function() {
			setCookie('top_msg_banner2', 'set_cookie', 1)
		});
		if (getCookie('top_msg_banner2') == 'set_cookie') {
			$("#top-message").hide()
		} else {
			$("#top-message").show();
		}
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue + "; path=/;"
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>

<script>
	$(document).ready(function() {
		$("#eventBenefit a").on('click', function(e) {
			e.preventDefault();
			var eventBenefitPos = 0;
			if ($(this).hasClass('link_benefit1')) {
				eventBenefitPos += $('.view_event4').offset().top;
			} else if ($(this).hasClass('link_benefit2')) {
				eventBenefitPos += $('.view_event5').offset().top;
			} else if ($(this).hasClass('link_benefit3')) {
				eventBenefitPos += $('.view_event6').offset().top;
			}
			$('html,body').animate({
				'scrollTop' : eventBenefitPos
			}, 500);
		});

		$('.btn_hover').parent().hover(function() {
			$(this).find('.btn_hover').stop().animate({
				width : '100%'
			}, 300);
		}, function() {
			$(this).find('.btn_hover').stop().animate({
				width : 0
			}, 300);
		});
	});
</script>

<script
	src="https://connect.facebook.net/signals/config/526625657540055?v=2.8.37&amp;r=stable"
	async=""></script>

</head>
<body class="main-html" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !enableSelection">

	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NJDKR7R"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<div id="header"></div>
			<div id="main">
				<div id="content">

					<div id="qnb" class="quick-navigation qnb_stop">

						<div class="bnr_qnb">
							<a
								href="http://www.kurly.com/shop/main/html.php?htmid=event/2019/0115/newyear.htm">
								<img
								src="https://res.kurly.com/pc/img/1901/bnr_side_190102_v2.png"
								alt="얼리버드">
							</a>
						</div>
					</div>
					<%@ include file="/WEB-INF/include/include-body.jspf"%>

					<div class="page_event">
						<h3 class="screen_out">DotTea 회원가입</h3>

						<div class="view_event1">
							<div class="view_event">
								<h4 class="screen_out">모바일 프리미엄 마트 DotTea</h4>
								<p class="screen_out">잠들기 전 주문해도 아침이면 도착! 모바일 장보기는 DotTea로
									시작하세요</p>
								<a href="${pageContext.request.contextPath}/join/jointype.tea"
									class="btn_link link_join">가입하기</a>
							</div>
						</div>

						<!-- <div class="view_event2">
							<div class="view_event">
								<ul id="eventBenefit" class="link_benefit">
									<li><a href="#none" class="btn_link link_benefit1">좋아요
											TOP 6</a></li>
									<li><a href="#none" class="btn_link link_benefit2">첫
											구매 무료 배송</a></li>
									<li><a href="#none" class="btn_link link_benefit3">한달동안
											5% 적립(첫 구매 후)</a></li>
								</ul>
							</div>
						</div>
 -->
						<div class="view_event4">
							<div class="view_event">
								<h4 class="tit">

									<div class="main-goods-item-content">
										<p class="main-goods-item-name">마켓에서 가장 좋아요를 많이 받은 6가지 물품</p>
									</div>
								</h4>

								<div class="list_goods">
									<ul class="list">


										<!-- 	<div class="main-goods-figure">
											<img
												src="//img-cf.kurly.com/shop/data/goods/153320027814m0.jpg"
												alt="코코넛 진미 오징어채 이미지"
												onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'">
										</div> -->

										<c:forEach items="${list}" var="row">
											<li><div class='item'>
													<a class='info' name='title'>
														<div class="main-goods-figure">

															<input type='hidden' name='NO' id='NO'
																value="${row.DEAL_NO}"> <img
																src="${pageContext.request.contextPath}/images/${row.DEAL_IMGSV}" />
														</div>
														<div class="main-goods-item-content">
															<p class="main-goods-item-name">${row.DEAL_TITLE}</p>
															<p class="main-goods-item-price">${row.DEAL_PRICE}</p>
														</div>
												</div> </a></li>
										</c:forEach>

									</ul>
								</div>


							</div>
						</div>



						<!-- <div class="view_event5">
							<div class="view_event">
								<h4 class="screen_out">혜택02 하나만 사도 무료배송!</h4>
								<p class="screen_out">회원 가입 후 첫 구매 시, 어떤 상품을 사도 무료배송 혜택을
									드립니다 배송비 부담 없이 DotTea를 경험해 보세요!</p>
								<p class="screen_out">· ID당 1회 무료배송 혜택 적용</p>
							</div>
						</div>
						<div class="view_event6">
							<div class="view_event">
								<h4 class="screen_out">혜택03 한 달 동안 5% 적립 + 무료배송!</h4>
								<p class="screen_out">첫 구매 후 한 달 동안 결제 금액의 5% 적립금과 무제한 무료배송
									혜택을 드립니다.</p>
								<ul class="screen_out">
									<li>· 혜택은 첫 구매 완료 후, 차주 월요일 낮 12시에 일괄 적용됩니다.</li>
									<li>· 혜택 적용 기간은 첫 구매 후 한 달이며, 시작일로부터 5주 뒤 일요일까지 혜택이 적용됩니다.</li>
									<li>· 무료배송 혜택은 2만원 이상 주문 시 적용됩니다.</li>
								</ul>
							</div>
						</div> -->
						<div class="view_best">
							<div class="view_event">
								<div class="page_btn">
									<a
										href="${pageContext.request.contextPath}/teaDeal/teaList.tea?teaShopType=6"
										class="btn_link btn_best">이벤트 상품 보러가기</a> <a
										href="${pageContext.request.contextPath}/join/jointype.tea"
										class="btn_link btn_join">회원가입 하러가기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<iframe name="xdomain-2c8fe7f5" id="xdomain-2c8fe7f5"
		src="https://api.kurly.com/xdomain" style="display: none;"></iframe>

	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
	<script>
		(function(theFrame) {
			theFrame.contentWindow.location.href = theFrame.src;
		}(document.getElementById("ifrmHidden")));
	</script>



	<script>
		var _nSA = (function(_g, _c, _s, _p, _d, _i, _h) {
			if (_i.wgc != _g) {
				var _ck = (new Image(0, 0)).src = _p + '//' + _c + '/?cookie';
				_i.wgc = _g;
				_i.wrd = (new Date().getTime());
				var _sc = _d.createElement('script');
				_sc.src = _p + '//sas.nsm-corp.com/' + _s + 'gc=' + _g + '&rd='
						+ _i.wrd;
				var _sm = _d.getElementsByTagName('script')[0];
				_sm.parentNode.insertBefore(_sc, _sm);
				_i.wgd = _c;
			}
			return _i;
		})('TR10082304856', 'ngc1.nsm-corp.com', 'sa-w.js?', location.protocol,
				document, window._nSA || {}, location.hostname);
	</script>
	<noscript>
		<img src="//ngc1.nsm-corp.com/?uid=TR10082304856&je=n&" border=0
			width=0 height=0>
	</noscript>

	<script type="text/javascript">
		var count = 10;
		$(document).ready(function() {
			//fn_selectBoardList(1);

			$("#write").on("click", function(e) {
				e.preventDefault();
				fn_openBoardWrite();
			});

			$("#search").on("click", function(e) {
				e.preventDefault();
				fn_searchKeyword($(this));
			})

			$("a[name='title']").on("click", function(e) {
				e.preventDefault();
				teaDealDetail($(this));
			});
		});

		function teaDealDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teaDeal/teaDealDetail.tea'/>");
			comSubmit.addParam("NO", obj.parent().find("#NO").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>