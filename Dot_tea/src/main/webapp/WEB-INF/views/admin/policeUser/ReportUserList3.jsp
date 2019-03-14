<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

    <h2>신고게시판(후기)</h2>
    <p align="right" >
		<select name="searchType" id="searchType">
			<option value="1" label="제목">
			<option value="2" label="신고자">
		</select> <input type="text" id="keyword" name="keyword"> <a
			href="#this" class="btn" id="search">검색</a>
	</p>
    
         <table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
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
	</div>
		

    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    var count=10;
        $(document).ready(function(){
            fn_selectBoardList(1);
             
             
            $("a[name='P_USER_SUBJECT']").on("click", function(e){ //제목
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
    				comAjax.setUrl("<c:url value='/admin/ReportUserList.tea'/>");
    				comAjax.setCallback("fn_selectBoardListCallback");
    				comAjax.addParam("PAGE_INDEX", 1);
    				comAjax.addParam("PAGE_ROW", count);
    				comAjax.addParam("searchType", obj.parent().find("#searchType").val() );
    				comAjax.addParam("keyword",obj.parent().find("#keyword").val() );
    				comAjax.ajax();
    				
    			}
    	
    	 function fn_openBoardDetail(obj){
             var comSubmit = new ComSubmit();
             comSubmit.setUrl("<c:url value='/admin/ReportUserView.tea' />");
             comSubmit.addParam("P_USER_NO", obj.parent().find("#P_USER_NO").val());
             comSubmit.addParam("MEM_USER_NO", obj.parent().find("#MEM_USER_NO").val());
             comSubmit.submit();
         }
         
       
        function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/admin/selectReportUserList.tea' />");
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
                                "<td>" + value.P_USER_NO + "</td>" +
                                "<td class='P_USER_SUBJECT'>" +
                                    "<a href='#this' name='P_USER_SUBJECT'>" + value.P_USER_SUBJECT + "</a>" +
                                    "<input type='hidden' name='P_USER_NO' id='P_USER_NO' value=" + value.P_USER_NO + ">" +
                                    "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">"+
                                "</td>" 
                               +"<td>" + value.P_REPORTER_ID + "</td>" 
                               + "<td>" + value.P_USER_DATE + "</td>";
                               if(value.P_USER_STATUS==1){
                            	   str+="<td>미확인</td>";
                               }
                               else if(value.P_USER_STATUS==2){
                            	   str+="<td>승인</td>";
                               }
                               else if(value.P_USER_STATUS==3){
                            	   str+="<td>거절</td>";
                               }
                                //"<td><c:if test='"+value.P_USER_STATUS+"== 1'>미승인</c:if><c:if test='"+value.P_USER_STATUS+"= 2'>승인</c:if>" + value.P_USER_STATUS + "</td>" +
                            str+="</tr>";
                });
                body.append(str);
                $("a[name='P_USER_SUBJECT']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
         
               }
        }
    </script>
    </div>
 
  
  
</body>

</html>
