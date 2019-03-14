<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header-Umypage.jspf"%>
<meta charset="UTF-8">
</head>
<body>
	<h2 style="padding: 20px; font-weight: bold">전체 문의 사항 목록</h2>
	<div>
		<form name="searchForm" id="searchForm">
		<span style="float: right">
		<input type="text" name="tkeyword" id="tkeyword"
		style="text-align:left; width:200px; height:25px"
		value="${tkeyword}" placeholder="제품명을 입력해주세요.">
		<a href="#this" name="searchKey" id="searchKey">
		<img src="../css/icon.jpg" style="width: 20px; height: 20px;" alt="검색" />
		검색</a>
		</span>
		</form>
	</div>
	<br><br><br>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="*" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">QnA 번호</th>
				<th scope="col">제품 번호</th>
				<th scope="col">제품 이름</th>
				<th scope="col">QnA 제목</th>
				<th scope="col">등록일</th>
				<th scope="col">답변</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_qnaBoardList(1);
			
			$("#searchKey").on("click", function(e) {
				var tkeyword = document.searchForm.tkeyword.value;
				e.preventDefault();
				fn_search();
			});
		});
		
		
		function fn_search(){
			var comAjax = new ComAjax();
			var tkeyword = document.searchForm.tkeyword.value;
			alert("들어와?" + tkeyword);
			comAjax.setUrl("<c:url value='/member/qnaboard.tea' />");
			comAjax.setCallback("fn_qnaBoardListCallback");
			comAjax.addParam("tkeyword", tkeyword);
			comAjax.ajax();
		}

		function fn_qnaBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/qnadetail.tea' />");
			comSubmit.addParam("QA_NO", obj.parent().find("#QA_NO").val());
			comSubmit.submit();
		}
		
		function fn_qnaBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/member/qnaboard.tea' />");
            comAjax.setCallback("fn_qnaBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 20);
            comAjax.ajax();
        }
         
        function fn_qnaBoardListCallback(data){
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
                    eventName : "fn_qnaBoardList"
                };
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.qna, function(tkeyword, value){
                    str += "<tr>" +
                                "<td>" + value.QA_NO + "</td>" +
                                "<td>" + value.DEAL_NO + "</td>" +
                                "<td>" + value.DEAL_TITLE + "/td" +
                                "<td class='title'>" +
                                    "<a href='#this' name='qna'>" + value.QA_SUBJECT + "</a>" +
                                    "<input type='hidden' name='QA_NO' id='QA_NO' value=" + value.QA_NO + ">" +
                                "</td>" +
                                "<td>" + value.QA_DATE + "</td>" +
                                "<td>" + value.QA_COM_TYPE + "</td>" +
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='qna']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_qnaBoardDetail($(this));
                });
            }
        }
	</script>
</body>
</html>
