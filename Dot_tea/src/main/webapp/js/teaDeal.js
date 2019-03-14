/*
 * divId : 페이징 태그가 그려질 div pageIndx : 현재 페이지 위치가 저장될 input 태그 id recordCount :
 * 페이지당 레코드 수 totalCount : 전체 조회 건수 eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수
 * 이름
 */
var gfv_pageIndex = null;
var gfv_eventName = null;
function teaDealListPaging(params){
    var divId = params.divId; // 페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; // 현재 위치가 저장될 input 태그
    var totalCount = params.totalCount; // 전체 조회 건수
    var pageRow = 10;
    
    var currentIndex = $("#"+params.pageIndex).val(); // 현재 위치
    if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
        currentIndex = 1;
    }
     
    var recordCount = params.recordCount; // 페이지당 레코드 수
    if(gfn_isNull(recordCount) == true){
        recordCount = 20;
    }
    var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
   // alert(params.recordCount);
    gfv_eventName = params.eventName;
    var type = params.type;
    var DealType = params.DealType;
    
     
    $("#"+divId).empty();
    var preStr = "";
    var postStr = "";
    var str = "";
     
  // << 이 사이 순서 >>
    var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
    var last = (parseInt(totalIndexCount/10) < parseInt(currentIndex)/10) ? totalIndexCount%10 : 10;
    
    
    var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1;
    var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
     
    if(totalIndexCount > 10){ // 전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
        preStr += "<a href='#this' class='layout-pagination-button layout-pagination-first-page' onclick='_movePage(1,"+type+","+DealType+")'></a>" +
                "<a href='#this' class='layout-pagination-button layout-pagination-prev-page' onclick='_movePage("+prev+","+type+","+DealType+")'></a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ // 전체 인덱스가 10보다
															// 작을경우, 맨앞 태그 작성
        preStr += "<a href='#this' class='layout-pagination-button layout-pagination-first-page' onclick='_movePage(1,"+type+","+DealType+")'></a>";
    }
     
    if(totalIndexCount > 10){ // 전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
        postStr += "<a href='#this' class='layout-pagination-button layout-pagination-next-page' onclick='_movePage("+next+","+type+","+DealType+")'></a>" +
                    "<a href='#this' class='layout-pagination-button layout-pagination-last-page' onclick='_movePage("+totalIndexCount+","+type+","+DealType+")'></a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ // 전체 인덱스가 10보다
															// 작을경우, 맨뒤 태그 작성
        postStr += "<a href='#this' class='layout-pagination-button layout-pagination-last-page' onclick='_movePage("+totalIndexCount+","+type+","+DealType+")'></a>";
    }
  
    for(var i=first; i<(first+last); i++){
        if(i != currentIndex){
            str += " <a href='#this' class='layout-pagination-button layout-pagination-number' onclick='_movePage("+i+","+type+","+DealType+")'>"+i+" </a>";
        }
        else{
            str += "<b> <a href='#this' class='layout-pagination-button layout-pagination-number' onclick='_movePage("+i+","+type+","+DealType+")'>"+i+"</a> </b>";
        }
    }
    $("#"+divId).append(preStr + str + postStr);
}
 
function _movePage(value,type,DealType){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value,type,DealType);
    }
    else {
        eval(gfv_eventName + "(value,type,DealType);");
    }
}


function TeaListAjaxCallback(data) {

	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<li><div class='item'><span class='name'>"
				+ "상품이 없습니다.</span>";
		body.append(str);

	} else {
		
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "TeaListAjax",
			recordCount : count,
			type : types
			
		};
		teaDealListPaging(params);
		
		var str = "";

		$
				.each(
						data.list,
						function(key, value) {
							str += "<li><div class='item'>"
									+ "<div class='thumb'><input type='hidden' name='NO' id='NO' value='"+value.DEAL_NO+"'>"
									+ "<a class='img'  name='title'>"
									+ "<img src='../images/"+value.DEAL_IMGSV+"' width='308' height='396'>"
									+ "</a></div>"
									+ "<a class='info'  name='title'><span class='name'>"
									+ "["+value.MEM_COM_NAME+"]"
									+ value.DEAL_TITLE
									+ "</span>"
									+ "<span class='cost'><span class='price'>"
									+ value.DEAL_PRICE + "</span>"
									+ "</span>" + "</div></li>"
						});

		body.append(str);
		selectSetting(data.type,data.typeCount,data.teaShopType);

		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			teaDealDetail($(this));
		});
	}
}


function TeaTotalListAjaxCallback(data) {

	var total = data.TOTAL;
	var body = $("table>tbody");
	var DealType =  data.DealType;
	body.empty();
	if (total == 0) {
		var str = "<li><div class='item'><span class='name'>"
				+ "상품이 없습니다.</span>";
		body.append(str);

	} else {
		
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "TeaTotalListAjax",
			recordCount : count,
			type : types,
			DealType :DealType
		};
		teaDealListPaging(params);
		
		var str = "";

		$
				.each(
						data.list,
						function(key, value) {
							str += "<li><div class='item'>"
									+ "<div class='thumb'><input type='hidden' name='NO' id='NO' value='"+value.DEAL_NO+"'>"
									+ "<a class='img' name='title'>"
									+ "<img src='../images/"+value.DEAL_IMGSV+"' width='308' height='396'>"
									+ "</a></div>"
									+ "<a class='info' name='title'><span class='name'>"
									+ "["+value.MEM_COM_NAME+"]"
									+ value.DEAL_TITLE
									+ "</span>"
									+ "<span class='cost'><span class='price'>"
									+ value.DEAL_PRICE + "</span>"
									+ "</span>" + "</div></li>"
						});

		body.append(str);
		selectSetting(data.type,data.typeCount,data.teaShopType,data.DealType);
		categorySetting(2,data.DealType);

		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			teaDealDetail($(this));
		});
	}
}

function TeaAccListAjaxCallback(data) {

	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<li><div class='item'><span class='name'>"
				+ "상품이 없습니다.</span>";
		body.append(str);

	} else {
		
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "TeaAccListAjax",
			recordCount : count,
			type : types
		};
		teaDealListPaging(params);
		
		var str = "";

		$
				.each(
						data.list,
						function(key, value) {
							str += "<li><div class='item'>"
									+ "<div class='thumb'><input type='hidden' name='NO' id='NO' value='"+value.DEAL_NO+"'>"
									+ "<a class='img'  name='title'>"
									+ "<img src='../images/"+value.DEAL_IMGSV+"' width='308' height='396'>"
									+ "</a></div>"
									+ "<a class='info'  name='title'><span class='name'>"
									+ "["+value.MEM_COM_NAME+"]"
									+ value.DEAL_TITLE
									+ "</span>"
									+ "<span class='cost'><span class='price'>"
									+ value.DEAL_PRICE + "</span>"
									+ "</span>" + "</div></li>"
						});

		body.append(str);
		selectSetting(data.type,data.typeCount,data.teaShopType);
		categorySetting(5,data.DealType);
		
		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			teaDealDetail($(this));
		});
	}
}


function TeaEventListAjaxCallback(data) {

	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<li><div class='item'><span class='name'>"
				+ "상품이 없습니다.</span>";
		body.append(str);

	} else {
		
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "TeaEventListAjax",
			recordCount : count,
			type : types
		};
		teaDealListPaging(params);
		
		var str = "";

		$
				.each(
						data.list,
						function(key, value) {
							str += "<li><div class='item'>"
									+ "<div class='thumb'><input type='hidden' name='NO' id='NO' value='"+value.DEAL_NO+"'>"
									+ "<a class='img' name='title'>"
									+ "<img src='../images/"+value.DEAL_IMGSV+"' width='308' height='396'>"
									+ "</a></div>"
									+ "<a class='info'  name='title'><span class='name'>"
									+ "["+value.MEM_COM_NAME+"]"
									+ value.DEAL_TITLE
									+ "</span>"
									+ "<span class='cost'><span class='price'>"
									+ value.DEAL_PRICE + "</span>"
									+ "</span>" + "</div></li>"
						});

		body.append(str);
		selectSetting(data.type,data.typeCount,data.teaShopType);
		categorySetting(6,data.DealType);
		
		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			teaDealDetail($(this));
		});
	}
}




// selectTypeSetting
function selectSetting(type,typeCount,teaShopType,DealType) {
	var body = document.getElementById("setting_Type");

	var str = 	"<div class='sort_menu'>"
			+ "<div class=''>"
			+ "<div class='select_type user_sort' id='select_typeListTotal'>"
			+ "<a href='#this' id='select_type' class='name_select'>"
			+ type
			+ "</a>"
			+ "<ul class='list' id='select_typeList'>"
			+ "<li><a href='#this' name='type1' class='";
			if(typeCount==1){
				str+="on";
			}
			str+="'>신상품순</a></li>"
			+ "<li><a href='#this' name='type2' class='";
			if(typeCount==2){
				str+="on";
			}
			str+="'>인기상품순</a></li>"
			+ "<li><a href='#this' name='type3' class='";
			if(typeCount==3){
				str+="on";
			}
			str+="'>낮은 가격순</a></li>"
			+ "<li><a href='#this' name='type4' class='";
			if(typeCount==4){
				str+="on";
			}
			str+="'>높은 가격순</a></li>"
			+ "</ul>" + "</div>" + "</div>" + "</div>";
			
			body.innerHTML = str;
	$("#select_type")
			.on(
					"click",
					function(e) {
						if (ckSelectButton == 0) {
							document
									.getElementById('select_typeListTotal').classList
									.add('checked');
							ckSelectButton = 1;
						} else {
							document
									.getElementById('select_typeListTotal').classList
									.remove('checked');
							ckSelectButton = 0;
						}
					});

	$("a[name='type1']").on("click", function(e) {
		e.preventDefault();
		ckSelectButton = 0;
		if(DealType==null){
			if(teaShopType=="1"){
				TeaListAjax(1, "1");
			}else if(teaShopType=="5"){
				TeaAccListAjax(1, "1");
			}else if(teaShopType=="6"){
				TeaEventListAjax(1, "1");
			}
			
		}else{ 
			TeaTotalListAjax(1, "1",DealType);
		}
	});
	$("a[name='type2']").on("click", function(e) {
		e.preventDefault();
		ckSelectButton = 0;
		if(DealType==null){
			if(teaShopType=="1"){
				TeaListAjax(1, "2");
			}else if(teaShopType=="5"){
				TeaAccListAjax(1, "2");
			}else if(teaShopType=="6"){
				TeaEventListAjax(1, "2");
			}
		}else 
			TeaTotalListAjax(1, "2",DealType);
	});
	$("a[name='type3']").on("click", function(e) {
		e.preventDefault();
		ckSelectButton = 0;
		if(DealType==null){
			if(teaShopType=="1"){
				TeaListAjax(1, "3");
			}else if(teaShopType=="5"){
				TeaAccListAjax(1, "3");
			}else if(teaShopType=="6"){
				TeaEventListAjax(1, "3");
			}
		}else 
			TeaTotalListAjax(1, "3",DealType);
	});
	$("a[name='type4']").on("click", function(e) {
		e.preventDefault();
		ckSelectButton = 0;
		if(DealType==null)
			{
			if(teaShopType=="1"){
				TeaListAjax(1, "4");
			}else if(teaShopType=="5"){
				TeaAccListAjax(1, "4");
			}else if(teaShopType=="6"){
				TeaEventListAjax(1, "4");
			}
		}else 
			TeaTotalListAjax(1, "4",DealType);
	});

}

// categorySetting
function categorySetting(type,DealType){
	if(type==1){
		var category = document.getElementById("category_List");
		category.innerHTML="<ul class='list'><li data-start='17' data-end='76'>"
		+"<a class='on'>전체보기</a></li><li class='bg'"
		+"style='top: 78px; width: 68px; left: 29px; opacity: 1;'></li></ul>"
	}else if(type==2){
		var width = 68;
		var left = 29;
		
		var category = document.getElementById("category_List");
		var str ="<ul class='list'><li data-start='17' data-end='76'>"
		+"<a class='";
		if(DealType==0){str+="on";}
		str +="' name='category1'>전체보기</a></li>"
		+"<li data-start='17' data-end='76'>"
		+"<a class='";
		if(DealType==2){
			str+="on";
			width = 48;
			left = 29+68;
		}
		str +="'' name='category2'>티 팟</a></li>"
		+"<li data-start='17' data-end='76'>"
		+"<a class='";
		if(DealType==3){
			str+="on";
			width = 48;
			left = 29+68+48;	
		}
		str +="'' name='category3'>티 컵</a></li>"
		+"<li data-start='17' data-end='76'>"
		+"<a class='";
		if(DealType==4){
			str+="on";
			width = 48;
			left = 29+68+48+48;		
		}
		str +="'' name='category4'>세 트</a></li>"
		+"<li class='bg'"
		+"style='top: 78px; width: "+width+"px; left: "+left+"px; opacity: 1;'></li></ul>"
	
		
		
		category.innerHTML= str;
		
		$("a[name='category1']").on("click", function(e) {
			e.preventDefault();
			TeaTotalListAjax(1, "1",0);
		});
		$("a[name='category2']").on("click", function(e) {
			e.preventDefault();
			TeaTotalListAjax(1, "1",2);
		});
		$("a[name='category3']").on("click", function(e) {
			e.preventDefault();
			TeaTotalListAjax(1, "1",3);
		});
		$("a[name='category4']").on("click", function(e) {
			e.preventDefault();
			TeaTotalListAjax(1, "1",4);
		});
	
	}
}

