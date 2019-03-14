function calculationListCallback(data) {

	var total = data.TOTAL;
	var body = $("table>tfoot");
	body.empty();
	alert("asdfasfd");
	if (total == 0) {
		var str = "<tr><td align='center' colspan='4'><span class='name'>"
				+ "정산 할 기업이 존재하지 않습니다.</span></td></tr>";
		body.append(str);

	} else {

		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "ComAjax"
		};

		var str = "";

		$
				.each(
						data.list,
						function(key, value) {
							str += "<tr style='vertical-align: middle; border: 1px solid lightgray;'>"
									+ "<td align='center'>"
									+ value.YM
									+ "</td>"
									+ "<td align='center'><a href='#this' name='MEM_COM_ID'>"
									+ value.MEM_COM_NO
									+ "<input type='hidden' id='MEM_COM_NO' name='MEM_COM_NO' value='"
									+ value.MEM_COM_NO
									+ "'> </a></td>"
									+ "<td align='center'><a href='#this' name='MEM_COM_ID'>"
									+ value.MEM_COM_NAME
									+ "<input type='hidden' id='MEM_COM_NO' name='MEM_COM_NO' value='"
									+ value.MEM_COM_NO
									+ "'> </a></td>"
									+ "<td align='center'>"
									+ value.CALCULATION
									+ "</td>" + "</tr>"

						});

		body.append(str);

		$("a[name='MEM_COM_ID']").on("click", function(e) { // 제목
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	}

}