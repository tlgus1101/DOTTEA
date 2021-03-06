<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<script type="text/javascript">
$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();
http://jsfiddle.net/composite/3n74v/?utm_source=website&utm_medium=embed&utm_campaign=3n74v#
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});

</script>
<body>
    <h2>신고게시판(상품)</h2>
    <p align="right" >
		<select name="searchType" id="searchType">
			<option value="1" label="제목">
			<option value="2" label="신고자">
		</select> <input type="text" id="keyword" name="keyword"> <a
			href="#this" class="btn" id="search">검색</a>
	</p>
	<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1"><a href="<c:url value='/admin/ReportComList.tea'/>">전체</a></li>
        <li class="active" rel="tab2"><a href="<c:url value='/admin/ReportBlComList.tea'/>">블랙</a></li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
    
    <table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">신고자</th>
            <th scope="col">신고일자</th>
            <th scope="col">상태</th>
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
             
             
            $("a[name='P_COM_SUBJECT']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
            
            $("#search").on("click",function(e){
				e.preventDefault();
				fn_searchKeyword($(this));
			})

        });
         
    	function fn_searchKeyword(obj) {
    	
    				var comAjax = new ComAjax();
    				comAjax.setUrl("<c:url value='/admin/ReportBlComList.tea'/>");
    				comAjax.setCallback("fn_selectBoardListCallback");
    				comAjax.addParam("PAGE_INDEX", 1);
    				comAjax.addParam("PAGE_ROW", count);
    				comAjax.addParam("searchType", obj.parent().find("#searchType").val() );
    				comAjax.addParam("keyword",obj.parent().find("#keyword").val() );
    				comAjax.ajax();
    				
    			}
    	
    	 function fn_openBoardDetail(obj){
             var comSubmit = new ComSubmit();
             comSubmit.setUrl("<c:url value='/admin/ReportComView.tea' />");
             comSubmit.addParam("P_COM_NO", obj.parent().find("#P_COM_NO").val());
             comSubmit.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
             comSubmit.submit();
         }
         
       
        function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/admin/selectReportBlComList.tea' />");
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
            else {
            	
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
                                "<td>" + value.P_COM_NO + "</td>" +
                                "<td class='P_COM_SUBJECT'>" +
                                    "<a href='#this' name='P_COM_SUBJECT'>" + value.P_COM_SUBJECT + "</a>" +
                                    "<input type='hidden' name='P_COM_NO' id='P_COM_NO' value=" + value.P_COM_NO + ">" +
                                    "<input type='hidden' name='MEM_COM_NO' id='MEM_COM_NO' value=" + value.MEM_COM_NO + ">"+
                                "</td>" 
                               +"<td>" + value.P_REPORTER_ID + "</td>" 
                               + "<td>" + value.P_COM_DATE + "</td>" ;
                    if(value.P_COM_STATUS==1){
                 	   str+="<td>미확인</td>";
                    }
                    else if(value.P_COM_STATUS==2){
                 	   str+="<td>승인</td>";
                    }
                    else if(value.P_COM_STATUS==3){
                 	   str+="<td>거절</td>";
                    }
                     //"<td><c:if test='"+value.P_COM_STATUS+"== 1'>미승인</c:if><c:if test='"+value.P_COM_STATUS+"= 2'>승인</c:if>" + value.P_COM_STATUS + "</td>" +
                 str+="</tr>";
                });
                body.append(str);
                $("a[name='P_COM_SUBJECT']").on("click", function(e){ //제목
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
