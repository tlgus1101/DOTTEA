<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//res.kurly.com/js/vue/vue.min.js?ver=201902111533"></script>
<script src="/common_js/axios.js?ver=201902111533"></script>
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/normalize.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/section1.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/section2.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/common.css?ver=201902111533">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/css/goods_style.css?ver=201902111533">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
  text-align: left;
  margin: 20px auto;
  color: #fff;
}

.accordion-menu {
  width: 50%;
  float : left;
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
</div>
</div>
</div>
</div>
</body>
</html>