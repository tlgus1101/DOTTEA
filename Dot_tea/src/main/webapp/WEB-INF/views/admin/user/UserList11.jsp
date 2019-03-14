<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko"><head>
<meta charset="euc-kr">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d">
<script type="text/javascript" src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js?ver=201902111533"></script>
<link rel="apple-touch-icon" sizes="72x72" href="https://res.kurly.com/images/favicon/1810/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="https://res.kurly.com/images/favicon/1810/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="https://res.kurly.com/images/favicon/1810/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="https://res.kurly.com/images/favicon/1810/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="https://res.kurly.com/images/favicon/1810/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="https://res.kurly.com/images/favicon/1810/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="https://res.kurly.com/images/favicon/1810/apple-icon-180x180.png">
<link rel="shortcut icon" type="image/x-icon" href="https://res.kurly.com/images/favicon/1810/favicon-16x16.png">
<link rel="stylesheet" type="text/css" href="/Dot_tea/resources/css/admin/admin.css" />
<script>
var jwtToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjYXJ0X2lkIjoiYTgwZTM1M2ExNDA5MDIwNmYxNzAyYzNlNzMwYWJmMzMiLCJpc19ndWVzdCI6ZmFsc2UsInV1aWQiOiJhMjM4NTg2OC1kNDFiLTUyMWMtOTg4NS05YzNjMmRmYTdlY2MiLCJzdWIiOiJhMjM4NTg2OC1kNDFiLTUyMWMtOTg4NS05YzNjMmRmYTdlY2MiLCJpc3MiOiJodHRwOi8vYXBpLmt1cmx5LmNvbTo4MDQzL3YxL3VzZXJzL2F1dGgvbG9naW4iLCJpYXQiOjE1NDk4NjkwMTcsImV4cCI6MTU0OTg3MjYxNywibmJmIjoxNTQ5ODY5MDE3LCJqdGkiOiJjNE02cTE4VER4MnJZZk1JIn0.EppYTAeuyO0Ac-jVTsaec16TifWykbWlB1BfTvZ1z7I';
var apiDomain = 'https://api.kurly.com';
var GD_ISMEMBER = !!Number('1');
var checkIsApp = true;// 해당스크립트관련으로 앱체크공용변수추가 생성.앱에서 불필요한 호출제거
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?ver=201902111533"></script><script charset="UTF-8" type="text/javascript" src="https://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/thefarmers.js?ver=201902111533"></script>
<script src="https://www.kurly.comhttps://www.kurly.com/shop/data/skin/designgj/common.js?ver=201902111533"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/polify.js?ver=201902111533"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/ui_v2.js?ver=201902111533"></script>
<script src="https://res.kurly.com/js/lib/jquery.lazyload.min.js?ver=201902111533"></script>

<script src="//res.kurly.com/js/vue/es6-promise.min.js?ver=201902111533"></script>
<script src="//res.kurly.com/js/vue/es6-promise.auto.min.js?ver=201902111533"></script>

<script type="text/javascript" src="//res.kurly.com/js/vue/axios.min.js?ver=201902111533"></script>


<script src="//res.kurly.com/js/vue/vue.min.js?ver=201902111533"></script>
<script src="/common_js/axios.js?ver=201902111533"></script>
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/normalize.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/section1.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/section2.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/common.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/css/goods_style.css?ver=201902111533">

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" src="https://www.kurly.com/shop/lib/js/naverCommonInflowScript.js?Path=service/faq.php&amp;Referer=https%3A%2F%2Fwww.kurly.com%2Fshop%2Fboard%2Flist.php%3Fid%3Dnotice&amp;AccountID=s_4f41b5625072&amp;Inflow=kurly.com" id="naver-common-inflow-script"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="/Dot_tea/resources/ajax/HotelAjax.js" charset="utf-8"></script>

<style>.async-hide { opacity: 0 !important} </style>
<script type="text/javascript">


//아코디언 메뉴
$(function() {
	  var Accordion = function(el, multiple) {
	    this.el = el || {};
	    // more then one submenu open?
	    this.multiple = multiple || false;
	    
	    var dropdownlink = this.el.find('.dropdownlink');
	    dropdownlink.on('click',
	                    { el: this.el, multiple: this.multiple },
	                    this.dropdown);
	  };
	  
	  Accordion.prototype.dropdown = function(e) {
	    var $el = e.data.el,
	        $this = $(this),
	        //this is the ul.submenuItems
	        $next = $this.next();
	    
	    $next.slideToggle();
	    $this.parent().toggleClass('open');
	    
	    if(!e.data.multiple) {
	      //show only one menu at the same time
	      $el.find('.submenuItems').not($next).slideUp().parent().removeClass('open');
	    }
	  }
	  
	  var accordion = new Accordion($('.accordion-menu'), false);
	})
	
</script>

<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');

fbq('init', '526625657540055');
fbq('track', "PageView");
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=526625657540055&ev=PageView&noscript=1"
/></noscript>





<style>
body .criteo_header{display:none}

<!--아코디언 메뉴 -->

* {
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Montserrat', sans-serif;
  background: #ffffff;
}

ul {
  list-style: none;
}

a {
  text-decoration: none;
}

h2 {
  text-align: center;
  margin: 20px auto;
  color: #fff;
}

.accordion-menu {
  width: 100%;
  max-width: 350px;
  margin: 60px auto 20px;
  background: #fff;
  border-radius: 4px;
}
.accordion-menu li.open .dropdownlink {
  color: #CDDC39;
  .fa-chevron-down {
    transform: rotate(180deg);
  }
}
.accordion-menu li:last-child .dropdownlink {
  border-bottom: 0;
}
.dropdownlink {
  cursor: pointer;
  display: block;
  padding: 15px 15px 15px 45px;
  font-size: 18px;
  border-bottom: 1px solid #ccc;
  color: #212121;
  position: relative;
  transition: all 0.4s ease-out;
  i {
    position: absolute;
    top: 17px;
    left: 16px;
  }
  .fa-chevron-down {
    right: 12px;
    left: auto;
  }
}

.submenuItems {
  display: none;
  background: #C8E6C9;
  li {
    border-bottom: 1px solid #B6B6B6;
  }
}

.submenuItems a {
  display: block;
  color: #727272;
  padding: 12px 12px 12px 45px;
  transition: all 0.4s ease-out;
  &:hover {
    background-color: #CDDC39;
    color: #fff;
  }
}
</style>
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script>
	var criteoEmail = "";
	if(uuidCheck != ""){
        // criteoEmail = uuidCheck+"@kurlycorp.com";
	}
</script>



<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>
<body class="service-faq" oncontextmenu="return false" ondragstart="return false" onselectstart="return !enableSelection" style="">


<div id="wrap" class="">
<div id="pos_scroll"></div>
<div id="container">
<div id="header">

</div>
<div id="main">
<div id="content">


<h2>관리자 메뉴</h2>

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
    <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> 결제 관리
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="">결제</a></li>
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

<!-- <div id="qnb" class="quick-navigation"></div>
<div class="page_aticle aticel_type2">
<div id="snb" class="snb_cc">
<h2 class="tit_snb">관리자</h2>
<div class="inner_snb">
<ul class="list_menu">
<li>
<a href="https://www.kurly.com/shop/board/list.php?id=notice">공지사항</a>
</li>
<li class="on">
<a href="https://www.kurly.com/shop/service/faq.php">자주하는 질문</a>
</li>
<li>
<a href="https://www.kurly.com/shop/mypage/mypage_qna.php">1:1 문의</a>
</li>
<li>
<a href="https://www.kurly.com/shop/main/html.php?htmid=mypage/bulk_order.htm">대량주문 문의</a>
</li>
<li>
<a href="https://www.kurly.com/shop/mypage/offer.php">상품 제안</a>
</li>
<li>
<a href="https://www.kurly.com/shop/mypage/echo_packing.php">에코포장 피드백</a>
</li>
</ul>
</div>
<a href="https://www.kurly.com/shop/mypage/mypage_qna_register.php?mode=add_qna" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
</div>
<div class="page_section">
<div class="head_aticle">
<h2 class="tit">회원 관리 (User)</h2>
</div> -->

<!-- <div class="xans-element- xans-myshop xans-myshop-couponserial "> -->



 <div class="adminMian" align="left" style="width:100%;" >
 <div class="adminCenter" align="center" style="width: 80%; margin-left: 5px;  float: left;" >
<table class="xans-board-listheader">
<colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>       
            <th scope="col">NO</th>
            <th scope="col">ID</th>
            <th scope="col">NAME</th>
            <th scope="col">PHONE</th>
            <th scope="col">EMAIL</th>
            <th scope="col">BLACK</th>
        </tr>
    </thead>
    <tbody>
</table>
<div style="padding:1px; border-top:1px solid #e6e6e6"></div>
<tbody><tr>
<td class="input_txt">&nbsp;</td>
<td>
<br>
<center>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</center>
	<br>
<div class="search_bt">
<input type="image" src="https://www.kurly.com/shop/data/skin/designgj/images/board/search.png" align="absmiddle">
<input type="text" name="sword" value="" required="">
</div>
</td>
</tr>
</tbody>
</div>


	</div>
	
	
<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    var count=10;
        $(document).ready(function(){
            fn_selectBoardList(1);
                          
            $("a[name='MEM_USER_USERID']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
            
            $("#search").on("click",function(e){
				e.preventDefault();
				fn_searchKeyword($(this));
			})

        });
         
    	function fn_searchKeyword(obj) {
    		/* 		var comSubmit = new ComSubmit();
    				comSubmit.setUrl("<c:url value='/sample/selectBoardList.do'/>");
    				comSubmit.addParam("searchType", obj.parent().find("#searchType").val() );
    				comSubmit.addParam("keyword",obj.parent().find("#keyword").val() );
    				comSubmit.submit();
    				 */
    				var comAjax = new ComAjax();
    				comAjax.setUrl("<c:url value='/admin/UserList.tea'/>");
    				comAjax.setCallback("fn_selectBoardListCallback");
    				comAjax.addParam("PAGE_INDEX", 1);
    				comAjax.addParam("PAGE_ROW", count);
    				comAjax.addParam("searchType", obj.parent().find("#searchType").val() );
    				comAjax.addParam("keyword",obj.parent().find("#keyword").val() );
    				comAjax.ajax();
    				
    			}
              
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/UserView.tea' />");
            comSubmit.addParam("MEM_USER_NO", obj.parent().find("#MEM_USER_NO").val());
            comSubmit.submit();
        }
         
        function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/admin/selectUserList.tea' />");
            comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", count);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            var body = $("table>tbody");
            body.empty();
            if(total == 0){
                var str = "<tr>" +
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                            "</tr>";
                body.append(str);
            }
            else{
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList",
                    	recordCount : count
                };
                gfn_renderPaging(params);
                var str = "";
            
                $.each(data.list, function(key, value){
                    str += "<tr>" +
                                "<td>" + value.MEM_USER_NO + "</td>" +
                                "<td class='MEM_USER_USERID'>" +
                                    "<a href='#this' name='MEM_USER_USERID'>" + value.MEM_USER_USERID + "</a>" +
                                    "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">" +
                                "</td>" +
                                "<td>" + value.MEM_USER_USERNAME + "</td>" +
                                "<td>" + value.MEM_USER_PHONE + "</td>" +
                                "<td>" + value.MEM_USER_USEREMAIL + "</td>" +
                                "<td>" + value.MEM_USER_BLACK + "</td>" +
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='MEM_USER_USERID']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
            }
        }
    </script>


</div>
</div>

</div>

<div id="footer">
<div class="footer_cc"></div></div>


</body></html>