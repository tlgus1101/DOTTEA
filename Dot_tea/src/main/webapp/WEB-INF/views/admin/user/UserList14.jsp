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

</head>

<body>

    <h2>회원관리(USER)</h2>
         <div>

       
    <jsp:include page="/WEB-INF/views/admin/adminMain/AdminMenu.jsp"></jsp:include></div>
    <div class="adminMian" align="center" style="width:100%;" >
	<div class="adminLeft" style="width: 100%;  float: center;">
		
	

	<div class="adminCenter" align="center" style="width: 100%; margin-left: 5px;  float: center; " >
    <table class="xans-board-listheader">

        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="10%"/>
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
       </tbody>
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
</body>
</html>
