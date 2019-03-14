var count = 0;
var idCk = 0;
var pwCk = 0;
var resiCk = 0;
var sellnumCk = 0;
var com_email = 0;
var Man_email = 0;
var addCk = 0;

// 회원 가입하기 누른후 마지막
function chkForm(a) {

	if (document.MemberComJoin.MEM_COM_ID.value == "") {
		alert("ID를 적어 주세요");
		document.MemberComJoin.MEM_COM_ID.focus();
		return false;
	} else if (idCk == 0) {
		alert("ID중복을 확인해 주세요");
		document.MemberComJoin.MEM_COM_ID.focus();
		return false;
	}
	if (document.MemberComJoin.MEM_COM_PASSWORD.value == "") {
		alert("비밀 번호를 적어 주세요");
		document.MemberComJoin.MEM_COM_PASSWORD.focus();
		return false;
	} else if (pwCk == 0) {
		alert("비밀 번호가 동일 하지 않습니다. ");
		document.MemberComJoin.password2.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_MANAGER_PHONE.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		document.MemberComJoin.account1.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_MANAGER_EMAIL.value != "") {
		if (Man_email == 0) {
			alert("관리자 이메일중복 확인을 해주세요.");
			document.MemberComJoin.MEM_COM_MANAGER_EMAIL.focus();
			return false;
		}
	}

	if (document.MemberComJoin.MEM_COM_COMPANY_EMAIL.value == "") {
		alert("사업자 이메일을 입력해주세요.");
		document.MemberComJoin.MEM_COM_COMPANY_EMAIL.focus();
		return false;
	} else if (com_email == 0) {
		alert("이메일중복 확인을 해주세요.");
		document.MemberComJoin.MEM_COM_COMPANY_EMAIL.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_NAME.value == "") {
		alert("사업자명을 입력해주세요.");
		document.MemberComJoin.MEM_COM_NAME.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_RESI.value == "") {
		alert("사업자 번호를 입력해주세요.");
		document.MemberComJoin.MEM_COM_RESI.focus();
		return false;
	} else if (resiCk == 0) {
		alert("사업자 번호를 확인 해주세요.");
		document.MemberComJoin.MEM_COM_RESI.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_COMNUM.value == "") {
		alert(" 통신 판매 번호를 입력해주세요.");
		document.MemberComJoin.MEM_COM_COMNUM.focus();
		return false;
	} else if (sellnumCk == 0) {
		alert("통신판매 번호를 확인 해주세요.");
		document.MemberComJoin.MEM_COM_COMNUM.focus();
		return false;
	}

	if (document.MemberComJoin.MEM_COM_ZIBUNADDR.value == "") {
		alert("주소를 입력해주세요.");
		document.MemberComJoin.MEM_COM_ZIBUNADDR.focus();
		return false;
	}

	if (document.MemberComJoin.account1.value == "") {
		alert("은행을 입력해주세요.");
		document.MemberComJoin.account1.focus();
		return false;
	} else if (document.MemberComJoin.account2.value == "") {
		alert("계좌번호를 입력해주세요.");
		document.MemberComJoin.account2.focus();
		return false;
	}

	if ($("input[name=cked]").prop("checked") != true) {
		alert("약관에 동의해 주세요.");
		document.MemberComJoin.agree_allcheck.focus();
		return false;
	}

}

// ----------------------------ID 확인 -------------------------
// jQuery를 가져온 후 실행한다.
//
// function chk_id(inputID) {
// var comAjax = new ComAjax();
// comAjax.setUrl("<c:url value='/join/chkId.tea'/>");
// comAjax.setCallback("ck_Id_Callback");
// comAjax.addParam("inputID", inputID);
// comAjax.ajax();
// }

function ck_Id_Callback(data) {
	var body = document.getElementById("ch_id_div");
	body.innerHTML = "";
	if (data == null) {
		var str = "<tr><td>*아이디는 3자 이상 가능 합니다.</td></tr>";
		idCk = 0;
		body.innerHTML = str;
	} else {
		var total = data.TOTAL;
		if (total == 0) {
			var str = "<tr><td>*사용 가능한 아이디 입니다.</td></tr>";
			idCk = 1;
			body.innerHTML = str;
		} else {
			var str = "<tr><td>*이미 사용 중인 아이디 입니다.</td></tr>";
			idCk = 0;
			body.innerHTML = str;
		}
	}
}
// ----------------------------ID 확인 end -------------------------

// ----------------------------PW 확인 -------------------------
function pwPress() {
	var body = document.getElementById("ch_pw_div");
	var pw1 = document.MemberComJoin.MEM_COM_PASSWORD.value;
	var pw2 = document.MemberComJoin.password2.value;
	body.innerHTML = "";
	if (pw1 == pw2 && pw1.length != 0) {
		var str = "<tr><td>*비밀번호가 일치합니다.</td></tr>";
		pwCk = 1;
		body.innerHTML = str;
	} else if (pw2.length == 0) {
		var str = "<tr><td> </td></tr>";
		pwCk = 0;
		body.innerHTML = str;
	} else {
		var str = "<tr><td>*입력하신 비밀번호가 일치하지 않습니다. </td></tr>";
		pwCk = 0;
		body.innerHTML = str;
	}
}
// ----------------------------PW 확인 end -------------------------

// ----------------------------MANAGER email 확인 -------------------------
// function chk_email(inputEmail) {
// var comAjax = new ComAjax();
// comAjax.setUrl("<c:url value='/join/chkMenEmail.tea'/>");
// comAjax.setCallback("ck_Email_Callback");
// comAjax.addParam("inputEmail", inputEmail);
// comAjax.ajax();
// }

// 중복 확인
function ck_Email_Callback(data2) {
	var body = document.getElementById("ch_email_div");
	body.innerHTML = " ";
	
	if (data2.BLACK == 1) {
		alert("회원 가입을 하실수 없습니다.");
		joinLoginOpen();

	} else {
		if (data2 == null) {
			var str = "<tr><td>*이메일을 입력해주세요.</tr></td>";
			body.innerHTML = str;
		} else {
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (exptext
					.test(document.MemberComJoin.MEM_COM_MANAGER_EMAIL.value) == false) {
				// alert(document.MemberComJoin.MEM_COM_MANAGER_EMAIL.value);
				Man_email = 0;
				var str = "<tr><td>*이메일 형식이 올바르지 않습니다.<tr><td>";
				body.innerHTML = str;
			} else {
				var total = data2.TOTAL2;
				if (total == 1) {
					var str = "<tr><td>*이미 사용 중인 이메일입니다.</tr></td>";
					Man_email = 0;
					body.innerHTML = str;
				} else {
					var str = "<tr><td>*사용 가능한 이메일입니다.</tr></td>";
					Man_email = 1;
					body.innerHTML = str;
				}
			}
		}
	}
}
// ----------------------------MANAGER email 확인 end -------------------------

// ----------------------------COMPANY email 확인 -------------------------
// function chk_com_email(inputEmail2) {
// var comAjax = new ComAjax();
// comAjax.setUrl("<c:url value='/join/chkComEmail.tea'/>");
// comAjax.setCallback("ck_Email_Callback2");
// comAjax.addParam("inputEmail2", inputEmail2);
// comAjax.ajax();
// }

var aaa = "";
/* COMPANY 회사 대표 이메일주소 검증식 */
function ck_Email_Callback2(data3) {
	var body = document.getElementById("ch_email_div2");
	body.innerHTML = "";

	if (data3.BLACK == 1) {
		alert("회원 가입을 하실수 없습니다.");
		//window.exit();
		joinLoginOpen();

	} else {
		if (data3 == null) {
			var str = "<tr><td>*이메일을 입력해주세요.</tr></td>";
			body.innerHTML = str;
		} else {
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (exptext
					.test(document.MemberComJoin.MEM_COM_COMPANY_EMAIL.value) == false) {
				var str = "<tr><td>*이메일 형식이 올바르지 않습니다.<tr><td>";
				com_email = 0;
				body.innerHTML = str;
			} else {
				var total = data3.TOTAL3;
				if (total == 1) {
					var str = "<tr><td>*이미 사용 중인 이메일입니다.</tr></td>";
					com_email = 0;
					body.innerHTML = str;
				} else {
					var cf_em = data3.keySet;
					aaa = cf_em
					var str = "<br><input type='text'"
							+ "name='comfirm_em_input' id='comfirm_em_input' maxlength='16'"
							+ "placeholder='인증 번호를 입력하세요.' /> <a href='#this'"
							+ " id='comfirm_e' name = 'comfirm_e' "
							+ "'><span class='bhs_button'>인증확인</span></a>";
					body.innerHTML = str;

					$("#comfirm_e")
							.on(
									"click",
									function(e) {
										e.preventDefault();
										var body = document
												.getElementById("ch_email_div2");
										var temp = document.MemberComJoin.comfirm_em_input.value;

										if (temp == aaa) {
											com_email = 1;
											alert("인증 번호가 일치 합니다.");
											body.innerHTML = "";
										} else {
											alert("인증 번호가 일치 하지 않습니다." + aaa);
											alert("인증 번호가 일치 하지 않습니다.");
										}
									});
				}
			}
		}
	}
}

// ----------------------------COMPANY email 확인 end -------------------------

// ----------------------------COMPANY sellingNumber 확인
// -------------------------

// function companySellNumber() {
// var name = document.MemberComJoin.MEM_COM_OWNER.value;
// var number = document.MemberComJoin.MEM_COM_RESI.value;
//
// if (document.MemberComJoin.MEM_COM_RESI.value == null
// || document.MemberComJoin.MEM_COM_RESI.value.length != 10) {
// alert("사업자번호를 입력후 통신판매 검사를 해주세요. ");
// document.MemberComJoin.MEM_COM_RESI.focus();
// } else {
// var body = document.getElementById("ch_sellNumber_div");
// body.innerHTML = "<input type='hidden' name='name' id='name' value="
// + name + ">"
// body.innerHTML = "<input type='hidden' name='number' id='number' value="
// + number + ">"
//
// var comAjax = new ComAjax();
// comAjax
// .setUrl("<c:url value='/join/companyJoinForm.tea/findSellingNumber.tea'/>");
// comAjax.setCallback("ck_sellingNumber_Callback");
// comAjax.addParam("name", name);
// comAjax.addParam("number", number);
// comAjax.ajax();
// }
// }

function ck_sellingNumber_Callback(data) {

	var list = data.ResiList;
	var body = $("table>tfoot");

	if (data.TOTAL > 0) {

		for (var i = 0; i < data.TOTAL; i++) {
			var ct = i + 1;
			var obj = list[i];
			// 2208162517
			/*
			 * document.MemberComJoin.MEM_COM_NAME.value = obj["bupNm"];
			 * document.MemberComJoin.MEM_COM_COMNUM.value =
			 * obj["apvPermMgtNo"]; document.MemberComJoin.MEM_COM_OWNER.value =
			 * obj["repsntNm"];
			 */
			//s[start:end]
			var com_ComNum = document.MemberComJoin.MEM_COM_COMNUM.value;

			if (obj["repsntNm"] != document.MemberComJoin.MEM_COM_OWNER.value) {
				alert("대표자 명이 다릅니다.");
			} else if (com_ComNum!=(obj["apvPermMgtNo"])) {
				alert("통신 판매 번호가 다릅니다.");
			} else if (document.MemberComJoin.MEM_COM_NAME.value != obj["bupNm"]) {
				alert("사업자 명이 다릅니다.");
			} else {
				alert("확인되셨습니다. ");
			}
		}

	} else {
		body
				.append("<tr><td colspan='1'></td><td align='left' colspan='2'>*없는 통신판매 번호 입니다.</td></tr>");
	}
}

// ----------------------------COMPANY sellingNumber 확인
// end-------------------------

// ----------------------------COMPANY RESI 사업자 확인 -------------------------
// function companyResi() {
// var name = document.MemberComJoin.MEM_COM_NAME.value;
// var number = document.MemberComJoin.MEM_COM_RESI.value.substr(0, 6);
// if (document.MemberComJoin.MEM_COM_RESI.value == null
// || document.MemberComJoin.MEM_COM_RESI.value.length != 10) {
// alert("올바르지 않은 사업자번호 입니다.");
// document.MemberComJoin.MEM_COM_RESI.focus();
// } else {
// var body = document.getElementById("ch_resi_div");
// body.innerHTML = "<input type='hidden' name='name' id='name' value="
// + name + ">"
// body.innerHTML = "<input type='hidden' name='number' id='number' value="
// + number + ">"
//
// var comAjax = new ComAjax();
// comAjax
// .setUrl("<c:url value='/join/companyJoinForm.tea/findResi.tea'/>");
// comAjax.setCallback("ck_resi_Callback");
// comAjax.addParam("name", name);
// comAjax.addParam("number", number);
// comAjax.ajax();
// }
// }

function ck_resi_Callback(data) {

	var list = data.ResiList;
	var body = $("table>thead");

	if (data.TOTAL > 0) {
		var str = "<tr>" + "" + "<th scope='col' align='center'>사업자 발행일</th>"
				+ "<th scope='col' colspan='2' align='center'>사업장명 </th>"
				+ "<th scope='col' >&nbsp;</th>"
				+ "<th scope='col' align='center'>사업장 도로명상세 주소 </th>" + "</tr>";
		body.append(str);

		for (var i = 0; i < data.TOTAL; i++) {
			var ct = i + 1;
			var obj = list[i];
			if (obj["wkplJnngStcd" + ct] == 1) {
				str = "<tr>"
						+ "<td align='center'> "
						+ obj["dataCrtYm" + ct]
						+ " </td>"
						+ "<td colspan='3' align='center' width='200'> <a href='#this' name='title'>"
						+ obj["wkplNm" + ct]
						+ "<input type='hidden' id='reName' name='reName' value='"
						+ obj["wkplNm" + ct]
						+ "'>"
						+ "<input type='hidden' id='reNumber' name='reNumber' value='"
						+ obj["bzowrRgstNo" + ct] + "'>" + "</a></td>"
						+ " <td align='center'>"
						+ obj["wkplRoadNmDtlAddr" + ct] + " </td>" + "</tr>";

				body.append(str);
			}
		}

		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			setwkplNm($(this));
			resiCk = 1;
			// alert(this.parent().find("#reName").val());
		});
	} else {
		resiCk = 0;
		body
				.append("<tr><td colspan='1'><td<td colspan='1'>*없는 사업자 번호 입니다.</tr></td>");
	}

}
// 사업자 번호 세팅
function setwkplNm(obj) {
	document.MemberComJoin.MEM_COM_NAME.value = obj.parent().find("#reName")
			.val();
	/*
	 * document.MemberComJoin.MEM_COM_RESI.value = obj.parent().find(
	 * "#reNumber").val().split("*", 1);
	 */
	var body = document.getElementById("ch_resi_div");
	body.innerHTML = "";

}
// ----------------------------COMPANY sellingNumber 확인
// end-------------------------

// function setSellNumber(obj) {
// document.MemberComJoin.MEM_COM_OWNER.value = obj.parent().find("#sellName")
// .val();
// document.MemberComJoin.MEM_COM_COMNUM.value = obj.parent().find(
// "#sellNumber").val();
// document.MemberComJoin.MEM_COM_RESI.value = obj.parent().find("#reNumber")
// .val();
// var body = document.getElementById("ch_sellNumber_div");
// body.innerHTML = "";
//
// }

