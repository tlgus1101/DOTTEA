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
	<h1 class="page-header">블랙 회원 목록(Company)</h1>
	<div style="float: right;">
		<a href="#this" class="button" id="Main">Main</a>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">블랙 회원 목록(Company) 입니다.</div>

			<div id="dataTables-example_wrapper" class="panel-body">
				<table class="table  table-bordered table-hover dataTable no-footer"
					id="dataTables-example" role="grid"
					aria-describedby="dataTables-example_info">
					<thead>
						<tr style="vertical-align: middle; border: 1px solid lightgray;">
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">번호</th>
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">아이디</th>
							<th
								style="width: 15%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">기업명</th>
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">사업자<br>번호
							</th>
							<th
								style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">연락처</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">BLACK</th>
							<th
								style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">관리</th>
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

	function fn_searchKeyword(obj) {
		/* 		var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/sample/selectBoardList.do'/>");
				comSubmit.addParam("searchType", obj.parent().find("#searchType").val() );
				comSubmit.addParam("keyword",obj.parent().find("#keyword").val() );
				comSubmit.submit();
		 */
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/BlComList.tea'/>");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX", 1);
		comAjax.addParam("PAGE_ROW", count);
		comAjax.addParam("searchType", obj.parent().find("#searchType").val());
		comAjax.addParam("keyword", obj.parent().find("#keyword").val());
		comAjax.ajax();

	}
	
	function fn_Main(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/Main.tea' />");
        comSubmit.submit();
    }

	function fn_policeList(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/BlComPoliceList.tea' />");
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();
	}

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/BlComView.tea' />");
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();
	}

	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectBlComList.tea' />");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", count);
		comAjax.ajax();
	}

	function fn_deleteBoard(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/BlComDelete.tea' />");
		comSubmit
				.addParam("MEM_COM_NO", obj.parent().find("#MEM_COM_NO").val());
		comSubmit.submit();

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
										+ value.MEM_COM_NO
										+ "</td>"
										+ "<td align=center>"
										+ value.MEM_COM_ID
										+ "</td>"
										+ "<td align=center>"
										+ value.MEM_COM_NAME
										+ "</td>"
										+ "<td align=center>"
										+ value.MEM_COM_RESI
										+ "</td>"
										+ "<td align=center>"
										+ value.MEM_COM_MANAGER_PHONE
										+ "</td>"
										+ "<td class= 'black' align=center>"
										+ "<a href='#this' name='black'>"
										+ value.MEM_COM_BLACK
										+ "</a>"
										+ "<input type='hidden' name='MEM_COM_NO' id='MEM_COM_NO' value=" + value.MEM_COM_NO + ">"
										+ "</td>"
										+ "<td class='admin' style='text-align:center;vertical-align:middle;'>"
										+ "<a href='#this' name='admin'>"
										+ "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png'>"
										+ "</a>"
										+ "&nbsp;&nbsp;"
										+ "<input type='hidden' name='MEM_COM_NO' id='MEM_COM_NO' value=" + value.MEM_COM_NO + ">"
										+

										"</tr>";
							});
			body.append(str);

			$("a[name='black']").on("click", function(e) { //제목
				e.preventDefault();
				fn_policeList($(this));
			});

			$("a[name='admin']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		}
	}
</script>
</body>
</html>
