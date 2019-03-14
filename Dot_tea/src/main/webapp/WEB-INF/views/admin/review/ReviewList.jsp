<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf"%>
<link rel="stylesheet" href="/Dot_tea/resources/css/hotel/form.css">
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css"
	rel="stylesheet" style="text/css">
<head>

</head>

<div class="row">
	<h1 class="page-header">Review</h1>
	<div style="float: right;">
		<a href="#this" class="button" id="Main">Main</a>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">Review 입니다.</div>

			<div id="dataTables-example_wrapper" class="panel-body">
				<table class="table  table-bordered table-hover dataTable no-footer"
					id="dataTables-example" role="grid"
					aria-describedby="dataTables-example_info">
					<thead>
						<tr style="vertical-align: middle; border: 1px solid lightgray;">
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">번호</th>
							<th
								style="width: 20%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">후기평</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">작성자</th>
							<th
								style="width: 7%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">제품번호</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">별점</th>
							<th
								style="width: 7%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">날짜</th>
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
</div>
</div>



<%@ include file="/WEB-INF/include/include-bodyAdmin.jspf"%>
<script type="text/javascript">
	var count = 10;
	$(document).ready(function() {
		fn_selectBoardList(1);

		$("a[name='admin']").on("click", function(e) { //제목
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		$("#search").on("click", function(e) {
			e.preventDefault();
			fn_searchKeyword($(this));
		});
		
		$("#Main").on("click", function(e){ 
            e.preventDefault();
            fn_Main();
        });
	});
	
	function fn_Main(){
       var comSubmit = new ComSubmit();
       comSubmit.setUrl("<c:url value='/admin/Main.tea' />");
       comSubmit.submit();
   }

	function fn_searchKeyword(obj) {
		/* 		var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/selectBoardList.do'/>");
				comSubmit.addParam("searchType", obj.parent().find("#searchType").val() );
				comSubmit.addParam("keyword",obj.parent().find("#keyword").val() );
				comSubmit.submit();
		 */
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/ReviewList.tea'/>");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX", 1);
		comAjax.addParam("PAGE_ROW", count);
		comAjax.addParam("searchType", obj.parent().find("#searchType").val());
		comAjax.addParam("keyword", obj.parent().find("#keyword").val());
		comAjax.ajax();

	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/ReviewView.tea' />");
		comSubmit.addParam("RE_NO", obj.parent().find("#RE_NO").val());
		comSubmit.submit();
	}

	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectReviewList.tea' />");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", count);
		comAjax.ajax();
	}

	function fn_selectBoardListCallback(data) {
		var total = data.TOTAL;
		var body = $("table>tbody");
		body.empty();
		if (total == 0) {
			var str = "<tr>" + "<td colspan='6'>조회된 결과가 없습니다.</td>" + "</tr>";
			body.append(str);
		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectBoardList",
				recordCount : count
			};
			gfn_renderPaging(params);
			var str = "";

			$
					.each(
							data.list,
							function(key, value) {
								str += "<tr>" + "<td align=center>"
										+ value.RE_NO
										+ "</td>"
										+ "<td align=center>"
										+ value.RE_SUBJECT
										+ "</td>"
										+ "<td align=center>"
										+ value.MEM_USER_USERID
										+ "</td>"
										+ "<td align=center>"
										+ value.DEAL_NO
										+ "</td>"
										+ "<td align=center>"
										+ value.RE_STAR
										+ "</td>"
										+ "<td align=center>"
										+ value.RE_DATE
										+ "</td>"
										+ "</tr>";
							});
			body.append(str);

			$("a[name='admin']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

		}
	}
</script>
</body>
</html>

