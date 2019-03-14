<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf"%>
<link rel="stylesheet" href="/Dot_tea/resources/css/hotel/form.css">
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css"
	rel="stylesheet" style="text/css">
<head>
<style>
body {
	background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
}

.wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: inline-block;
	/*  margin: 20px auto;
	max-width: 100px;
	text-decoration: none;  */
	/* border-radius: 4px; */
	padding: 5px 5px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
/* 
a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
} */
#button {
	background: #f6f6f6;
	color: #11111;
	width: 100px;
	height: 30px;
	border: 0;
	font-size: 15px;
	border-radius: 4px;
	font-family: 'Noto sans KR', sans-serif;
	-webkit-transition: .6s;
	transition: .6s;
	overflow: hidden;
	cursor: pointer;
	margin-top: 10px;
}
</style>

</head>

<div class="row">
	<h1 class="page-header">공지사항</h1>
	<div style="float: right;">
		<a href="#this"  id="Main">Main</a>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">공지사항 입니다.</div>

			<div id="dataTables-example_wrapper" class="panel-body">

				<table class="table  table-bordered table-hover dataTable no-footer"
					id="dataTables-example" role="grid"
					aria-describedby="dataTables-example_info">
					<thead>
						<tr style="vertical-align: middle; border: 1px solid lightgray;">
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">번호</th>
							<th
								style="width: 18%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">제목</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">조회수</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">작성일</th>
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">관리</th>
						</tr>
					</thead>


					<tbody>
					</tbody>
				</table>

					<div id="PAGE_NAVI"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
				<br> <a href="#this" class="button" id="write">글쓰기</a>

			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/include/include-bodyAdmin.jspf"%>
<script type="text/javascript">
    var count=10;
    $(document).ready(function(){
        fn_selectBoardList(1);
         
        $("#write").on("click", function(e){ //글쓰기 버튼
            e.preventDefault();
            fn_openBoardWrite();
        });
         
        $("a[name='N_SUBJECT']").on("click", function(e){ //제목
            e.preventDefault();
            fn_openBoardDetail($(this));
        });
        
        $("#search").on("click",function(e){
			e.preventDefault();
			fn_searchKeyword($(this));
		})

		$("#Main").on("click", function(e){ 
            e.preventDefault();
            fn_Main();
        });
    });
			
    function fn_searchKeyword(obj) {
		/* 		var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/selectBoardList.do'/>");
				comSubmit.addParam("searchType", obj.parent().find("#searchType").val() );
				comSubmit.addParam("keyword",obj.parent().find("#keyword").val() );
				comSubmit.submit();
				 */
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/admin/NoticeList.tea'/>");
				comAjax.setCallback("fn_selectBoardListCallback");
				comAjax.addParam("PAGE_INDEX", 1);
				comAjax.addParam("PAGE_ROW", count);
				comAjax.addParam("searchType", obj.parent().find("#searchType").val() );
				comAjax.addParam("keyword",obj.parent().find("#keyword").val() );
				comAjax.ajax();
				
			}
    
    function fn_Main(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/Main.tea' />");
        comSubmit.submit();
    }
     
    function fn_openBoardWrite(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/openNoticeWrite.tea' />");
        comSubmit.submit();
    }
     
    function fn_openBoardDetail(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/NoticeView.tea' />");
        comSubmit.addParam("N_NO", obj.parent().find("#N_NO").val());
        comSubmit.submit();
    }
     
    function fn_selectBoardList(pageNo){
        var comAjax = new ComAjax();
        comAjax.setUrl("<c:url value='/admin/selectNoticeList.tea' />");
        comAjax.setCallback("fn_selectBoardListCallback");
        comAjax.addParam("PAGE_INDEX",pageNo);
        comAjax.addParam("PAGE_ROW", count);
        comAjax.ajax();
    }
    
    function fn_deleteBoard(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/NoticeDelete.tea' />");
        comSubmit.addParam("N_NO", obj.parent().find("#N_NO").val());
        comSubmit.submit();
         
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
                            "<td align=center>" + value.N_NO + "</td>" +
                            "<td align=center>" + value.N_SUBJECT + "</td>" +
                            "<td align=center>" + value.N_READHIT + "</td>" +
                            "<td align=center>" + value.N_DATE + "</td>" +
                            "<td class='admin' style='text-align:center;vertical-align:middle;'>" +
                            "<a href='#this' name='admin'>" +  
                            "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png'>"+ "</a>"+"&nbsp;&nbsp;"+
                            "<input type='hidden' name='N_NO' id='N_NO' value=" + value.N_NO + ">" +
                            "<a href='#this' name='delete'>" +
						    "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png'>"+"</a>"+
						    "<input type='hidden' name='N_NO' id='N_NO' value=" + value.N_NO + ">" +
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
