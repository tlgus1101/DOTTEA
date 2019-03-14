<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/include/include-headerAdmin.jspf"%>
<link rel="stylesheet" href="/Dot_tea/resources/css/hotel/form.css">
<link href="/Dot_tea/resources/css/adminItem/bootstrapadmin.min.css"
	rel="stylesheet" style="text/css">

<head>

</head>


<script type="text/javascript">
	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		http: //jsfiddle.net/composite/3n74v/?utm_source=website&utm_medium=embed&utm_campaign=3n74v#
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

	});
</script>

<div class="row">
	<h1 class="page-header">신고 게시판(후기)</h1>
	<div style="float: right;">
		<a href="#this" class="button" id="Main">Main</a>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">신고 게시판(후기) 입니다.</div>
			<div id="container">
				<ul class="tabs">
					<li class="active" rel="tab1"><a
						href="<c:url value='/admin/ReportUserList.tea'/>">전체</a></li>
					<li class="active" rel="tab2"><a
						href="<c:url value='/admin/ReportUserList1.tea'/>">신고 접수</a></li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">

						<div id="dataTables-example_wrapper" class="panel-body">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr
										style="vertical-align: middle; border: 1px solid lightgray;">
										<th
											style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">번호</th>
										<th
											style="width: 10%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">제목</th>
										<th
											style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">신고자</th>
										<th
											style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">신고일자</th>
										<th
											style="width: 5%; text-align: center; vertical-align: middle; border: 1px solid lightgray;">상태</th>
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
				comAjax.setUrl("<c:url value='/admin/ReportUserList.tea'/>");
				comAjax.setCallback("fn_selectBoardListCallback");
				comAjax.addParam("PAGE_INDEX", 1);
				comAjax.addParam("PAGE_ROW", count);
				comAjax.addParam("searchType", obj.parent().find("#searchType")
						.val());
				comAjax
						.addParam("keyword", obj.parent().find("#keyword")
								.val());
				comAjax.ajax();

			}
			
			function fn_Main(){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/Main.tea' />");
	            comSubmit.submit();
	        }

			function fn_openBoardDetail(obj) {
				var comSubmit = new ComSubmit();
				var P_USER_NO = obj.parent().find("#P_USER_NO").val();
				var MEM_USER_NO = obj.parent().find("#MEM_USER_NO").val();
				var url = "http://localhost:8080/Dot_tea/admin/ReportUserView.tea?P_USER_NO="
						+ P_USER_NO + "&MEM_USER_NO=" + MEM_USER_NO;
				var popOption = "width=1000, height=500, resizable=no, scrollbars=yes, status=no;";

				window.open(url, "", popOption);

				/*   comSubmit.setUrl("<c:url value='/admin/ReportUserView.tea' />");
				  comSubmit.addParam("P_USER_NO", obj.parent().find("#P_USER_NO").val());
				  comSubmit.addParam("MEM_USER_NO", obj.parent().find("#MEM_USER_NO").val()); */
				comSubmit.submit();
			}

			function fn_selectBoardList(pageNo) {
				var comAjax = new ComAjax();
				comAjax
						.setUrl("<c:url value='/admin/selectReportUserList.tea' />");
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
					var str = "<tr>" + "<td colspan='6'>조회된 결과가 없습니다.</td>"
							+ "</tr>";
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
												+ value.P_USER_NO + "</td>"
												+ "<td align=center>"
												+ value.P_USER_SUBJECT
												+ "</td>" + "<td align=center>"
												+ value.P_REPORTER_ID + "</td>"
												+ "<td align=center>"
												+ value.P_USER_DATE + "</td>";
										if (value.P_USER_STATUS == 1) {
											str += "<td align=center>미확인</td>";
										} else if (value.P_USER_STATUS == 2) {
											str += "<td align=center>승인</td>";
										} else if (value.P_USER_STATUS == 3) {
											str += "<td align=center>거절</td>";
										}
										str += "<td class='admin'  style='text-align:center;vertical-align:middle;'>"
												+ "<a href='#this' name='admin'>"
												+ "<input type='image' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png'>"
												+ "</a>"
												+ "&nbsp;&nbsp;"
												+ "<input type='hidden' name='P_USER_NO' id='P_USER_NO' value=" + value.P_USER_NO + ">"
												+ "<input type='hidden' name='MEM_USER_NO' id='MEM_USER_NO' value=" + value.MEM_USER_NO + ">"
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
	</div>
</div>
</div>
</body>
</html>

