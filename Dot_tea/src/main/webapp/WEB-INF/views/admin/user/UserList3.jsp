<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  text-decoration:none;
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>

<link href="/Dot_tea/resources/css/admin/memberList.css" rel="stylesheet" style="text/css">
 
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css" rel="stylesheet" style="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/ajax/ajax.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/Dot_tea/resources/JQuery/joinForm.js" charset="utf-8"></script> 
<%@ include file="/WEB-INF/include/include-header.jspf" %>


 


<div id="ContextModifiedForm">

<div class="row" >    
	<h1 class="page-header">회원 관리 목록</h1>
</div>

<div class="row">
	<div class="panel panel-default">
	 <div class="panel-heading">
        </div>
	
	<div id="dataTables-example_wrapper" class="panel-body">
	
	
		<table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>       
					<th style="width: 7%; text-align:center;vertical-align:middle;">번호</th>
					<th style="width: 15%; text-align:center;vertical-align:middle;">ID</th>										
					<th style="width: 10%; text-align:center;vertical-align:middle;">이름</th>
					<th style="width: 12%; text-align:center;vertical-align:middle;">전화번호 </th>
					<th style="width: 12%; text-align:center;vertical-align:middle;">메일</th>
					<th style="width: 10%; text-align:center;vertical-align:middle;">관리</th>
					
        </tr>
    </thead>
    <tbody>
       </tbody>
    </table>			
	
	
<center>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</center>
	<br>

     
     
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
                                "<td style='text-align:center;vertical-align:middle;'>" + value.MEM_USER_NO + "</td>" +
                                "<td style='text-align:center;vertical-align:middle;' class='MEM_USER_USERID'>" +
                                    "<a href='#this' name='MEM_USER_USERID'>" + value.MEM_USER_USERID + "</a>" +
                                    "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">" +
                                "</td>" +
                                "<td style='text-align:center;vertical-align:middle;'>" + value.MEM_USER_USERNAME + "</td>" +
                                "<td style='text-align:center;vertical-align:middle;'>" + value.MEM_USER_PHONE + "</td>" +
                                "<td style='text-align:center;vertical-align:middle;'>" + value.MEM_USER_USEREMAIL + "</td>" +
                                "<td style='text-align:center;vertical-align:middle;'>" + value.MEM_USER_BLACK + "</td>" +
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
</div>


