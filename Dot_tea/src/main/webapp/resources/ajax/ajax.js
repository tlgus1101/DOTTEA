
//jQuery 에서 Null값 확인 종류 (Null, "Nan", "undefined") 모두 널을 확인한다
function gfn_isNull(str) {
	
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
   
	var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}


// 내 자신으로 aJax를 걸기위해 콜백 함수가 필요함.
var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
    this.url = "";    
    
    // aJax에서는 필요없지만 최대한 위에것과 변경하지 않기위해 넣어둠.
   this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.param = "";
     
    //commonForm으로 됬다면 초기화 시켜주고 body에 넣어줌
    if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
            frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
    }
     
    // jsp에서 보내준 url 주소
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    
    this.setCallback = function setCallback(callBack){
        gfv_ajaxCallback = callBack;
    };
    
    // url에다가 값을 같이 넘겨주기 위한 로직
    this.addParam = function addParam(key,value){
        this.param = this.param + "&" + key + "=" + value;
    };
    
 // List를 뽑을때 자기자신으로 콜백 하기위한 ajax
    this.ajax = function ajax(){ 
    
       if(this.formId != "commonForm"){
            this.param += "&" + $("#" + this.formId).serialize();
        }
        $.ajax({
            url : this.url,   
            type : "POST",  
            data : this.param,
            success : function(data, status) {
                if(typeof(gfv_ajaxCallback) == "function"){
                    gfv_ajaxCallback(data);
                }
                else {
                    eval(gfv_ajaxCallback + "(data);");
                }
            }
        });
    };
    
 // 다른 페이지를 가져오는 ajax
    this.ajax1 = function ajax1(){ 
    	
        $.ajax({
            url : this.url,   
            type : "POST",  
            data : this.param,
            async : false,
            success : function(data) {
            	$("body").html(data); // 가져온 jsp 를 넣어줄 영역을 표시 <div id="list"> 가져온 jsp <div>
    		},error: function(data){ // 실패 할경우
    			alert("실패"); // 실패 alert문구 발생
    		}   		
        });
    };
}

/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/
var gfv_pageIndex = null;
var gfv_eventName = null;
var recordCount = null;
function gfn_renderPaging(params){
    var divId = params.divId; //페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; //초기값은 1 이되지만 페이지 이동시 jsp 에서 그값을 다시 반환해서 넘겨줌
    var totalCount = params.totalCount; //총 게시글 수  
    var currentIndex = $("#"+params.pageIndex).val(); // 초기값 1 제외후 jsp 에서 반환된 값을 넣어줌  
    if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){ // 초기 값을 1로 지정해 주는 로직
        currentIndex = 1;
    }
 
    recordCount = params.pageRow //페이지당 레코드 수
    
 // 페이지의 보여줄 게시글 수를 넘겨받지 않았다면 기본값을 15로 줌.(변경시 jsp에서 comAjax.addParam("PAGE_ROW", 20) 숫자와 맞춰서 변경해야함)
    if(gfn_isNull(recordCount) == true){ 
        recordCount = 10; // 
    }
    
 // 전체 게시글 수 / 페에지에서 보여줄 게시글 수를 나눠서 페이지 수를 구해냄.(소수점 자리는 무조건 반올림 한다)
    var totalIndexCount = Math.ceil(totalCount / recordCount); 
  
    gfv_eventName = params.eventName; // jsp 에서 실행될 펑션 함수 fn_selectBoardList 
     
    $("#"+divId).empty(); // jsp 에서 div태그로 쓸 PAGE_NAVI 를 초기화 시켜준다.
    var preStr = ""; // 처음 / 이전 10개페이지 를 담을 함수
    var postStr = ""; // 마지막 / 다음 10개 페이지를 담을 함수
    var str = ""; // 이동한 페이지 값을 넣어준다 (예: 25페이지로 이동시 25가 담김)
     
    alert(totalCount);
 // (((1 - 1) / 10) * 10) + 1 = 1;
 // (((11 - 1) / 10) * 10) + 1 = 11;
 // (((21 - 1) / 10) * 10) + 1 = 21;
    var first = (parseInt((currentIndex-1) / 10) * 10) + 1; 

    var last = (parseInt(totalIndexCount/10) < parseInt(currentIndex)/10) ? totalIndexCount%10 : 10; 
    var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1;
    var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;

    // 현재 페이지가 1이면 나타나지 않는다.
    if(currentIndex != 1){
    	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
    		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
    		"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
    	}
    	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
    		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
    	}
    }
    
    // 현재페이지가 마지막 페이지라면 나타나지 않는다.
    if(currentIndex != totalIndexCount) {
    	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
    		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
    		"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    	}
    	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
    		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    	}
    }
    
    // 위에서 계산한 first 부터 last 페이지 까지 나타나게 함 
    // 클릭시 onclick='_movePage 라는 밑에 function으로 이동하게 되면서 페이지이동 하게됨.
    for(var i=first; i<(first+last); i++){
        if(i != currentIndex){
            str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
        }
        else{
            str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
        }
    }
    $("#"+divId).append(preStr + str + postStr);
   /* alert(str);*/
}
 
function _movePage(value){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value);
    }
    else {
        eval(gfv_eventName + "(value);");
    }
}