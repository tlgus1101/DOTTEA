<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf" %>
<link rel="stylesheet" href="/Dot_tea/resources/css/hotel/form.css">
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css" rel="stylesheet" style="text/css">
<head>

</head>

<div class="row" >
	<h1 class="page-header">회원 목록(User)</h1> </div>
	<div style="float :right;">
<a href="#this" class="button"  id="Main">Main</a></div>
<form name=frm>
<div class="row">

	<div class="panel panel-default">
	
		 <div class="panel-heading">
                         회원 목록(User) 입니다.
        </div>
        
        	<div id="dataTables-example_wrapper" class="panel-body">
				<table class="table  table-bordered table-hover dataTable no-footer" 
				id="dataTables-example" role="grid"
				aria-describedby="dataTables-example_info">
					<thead>
						<tr style="vertical-align:middle; border:1px solid lightgray;">
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">번호</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">아이디</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">이름</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">연락처</th>
							<th style="width: 5%; text-align:center;vertical-align:middle; border:1px solid lightgray;">BLACK</th>
							<th style="width: 10%; text-align:center;vertical-align:middle; border:1px solid lightgray;">관리</th>
						</tr>
					</thead>
 
	
    <tbody>
    
       </tbody>
       
    </table>
    <div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
    
	<br>
</div>

 </div>
</div>
 <select name="searchType" id="searchType">
			<option value="1">ID</option>
			<option value="2">NAME</option>
		</select> <input type="text" name="searchKeyWord" id="searchKeyWord"> <a
			href="#this" type="button" name="sehBtn"> 검색 </a>


  </form> 
  
     
    <%@ include file="/WEB-INF/include/include-bodyAdmin.jspf" %>
    <script type="text/javascript">
    var count=10;
        $(document).ready(function(){
            fn_selectBoardList(1);
                          
            $("a[name='admin']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
            
            $("a[name='sehBtn']").on("click",function(e){
				e.preventDefault();
				searchBtn();
			});
			
            $("#Main").on("click", function(e){ 
                e.preventDefault();
                fn_Main();
            });
        });
         
    	
    	
    	function searchBtn() {
			var selected = document.getElementById("searchType");
			comAjax.addParam("PAGE_INDEX", 1);
			comAjax.addParam("PAGE_ROW", count);
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/UserList.tea' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			
			
			comAjax.addParam("searchType",
					selected.options[selected.selectedIndex].value);
			comAjax.addParam("searchKeyWord", document.frm.searchKeyWord.value);
			comAjax.ajax();
		}

    	
    	function fn_Main(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/Main.tea' />");
            comSubmit.submit();
        }
    	
    	function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/UserList.tea' />");
            comSubmit.submit();
        }
    	 
    	 
    	function fn_deleteBoard(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/UserDelete.tea' />");
            comSubmit.addParam("MEM_USER_NO", obj.parent().find("#MEM_USER_NO").val());
            comSubmit.submit();
             
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
                                "<td align=center>" + value.MEM_USER_NO + "</td>" +
                                "<td align=center>" + value.MEM_USER_USERID + "</td>" +
                                "<td align=center>" + value.MEM_USER_USERNAME + "</td>" +
                                "<td align=center>" + value.MEM_USER_PHONE + "</td>" +
                                "<td align=center>" + value.MEM_USER_BLACK + "</td>" +
                                "<td class='admin' style='text-align:center;vertical-align:middle;'>" +
                                "<a href='#this' name='admin'>" +  
                                "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png'>"+ "</a>"+"&nbsp;&nbsp;"+
                                "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">" +
                                "<a href='#this' name='delete'>" +
							    "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png'>"+"</a>"+
							    "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">" +
                            "</tr>";
                });
                body.append(str);
                
                 
             
                $("a[name='admin']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
                
                
                $("a[name='delete']").on("click", function(e){ //제목
            		var del = confirm("삭제하시겠습니까?");
    		 		if(del ==true){
    		 			e.preventDefault();
                       fn_deleteBoard($(this));
    		 		}else{
    	                fn_openBoardList();
    		 		}
                });
                
                
            }
        }
    </script>
</body>
</html>

