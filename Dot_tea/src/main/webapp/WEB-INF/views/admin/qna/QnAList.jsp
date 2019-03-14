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
	<h1 class="page-header">Q&A</h1>
	<div style="float: right;">
		<a href="#this" class="button" id="Main">Main</a>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">Q&A 입니다.</div>

			<div id="dataTables-example_wrapper" class="panel-body">
				<table class="table  table-bordered table-hover dataTable no-footer"
					id="dataTables-example" role="grid"
					aria-describedby="dataTables-example_info">
					<thead>
						<tr style="vertical-align: middle; border: 1px solid lightgray;">
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">번호</th>
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">제목</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">작성자</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">제품번호</th>
							<th
								style="width: 7%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">답변
								상태</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">날짜</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">관리</th>
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
		comAjax.setUrl("<c:url value='/admin/QnAList.tea'/>");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX", 1);
		comAjax.addParam("PAGE_ROW", count);
		comAjax.addParam("searchType", obj.parent().find("#searchType").val());
		comAjax.addParam("keyword", obj.parent().find("#keyword").val());
		comAjax.ajax();

	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/QnAView.tea' />");
		comSubmit.addParam("QA_NO", obj.parent().find("#QA_NO").val());
		comSubmit.submit();
	}

	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectQnAList.tea' />");
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
			var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
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
										+ value.QA_NO + "</td>"
										+ "<td align=center>"
										+ value.QA_SUBJECT + "</td>"
										+ "<td align=center>"
										+ value.MEM_USER_USERID + "</td>"
										+ "<td align=center>" + value.DEAL_NO
										+ "</td>";
								if (value.QA_TYPE == 1) {
									str += "<td align=center>미확인</td>";
								} else if (value.QA_TYPE == 2) {
									str += "<td align=center>답변완료</td>";
								}
								str += "<td align=center>"
										+ value.QA_DATE
										+ "</td>"
										+ "<td class='admin' style='text-align:center;vertical-align:middle;'>"
										+ "<a href='#this' name='admin'>"
										+ "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png'>"
										+ "</a>"
										+ "&nbsp;&nbsp;"
										+ "<input type='hidden' name='QA_NO' id='QA_NO' value=" + value.QA_NO + ">"
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

