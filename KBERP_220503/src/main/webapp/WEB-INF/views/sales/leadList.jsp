<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */

/* 팝업 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
    height: 70px;
    margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}
.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 240px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 240px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size {
	width: 200px;
	height: 19px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}
.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}
.ptm_right_bot {
	width: 94px;
	height: 32px;
	margin-top: 5px;
	text-align: center;
}
/* 팝업 내용 */
.popup_cc_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 300px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 25px;
   height: 25px;
   background-size: 25px 25px;
   background-repeat: no-repeat;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
/* 팝업 내용 배경색 */
.pc_back {
	background-color: #fff;
}

/* 팝업 페이징 */
.board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding: 5px 0px;
}
/*----- 팝업 CSS 끝 ----- */
.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}

.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 40px auto;
}

/* sts */
.sts {
	display: inline-block;
	width: 100%;
	height: 30px;
	text-align: center;
	margin-top: 10px;
}

.sts_list {
	display: inline-block;
	vertical-align: middle;
	width: 150px;
	margin: 0 30px;
	padding: 8px 5px;
	font-size: 10pt;
	text-align: center;
	background-color: #f2f2f2;
	border-radius: 5px;
	border: none;
}
.sts_list_on {
	display: inline-block;
	vertical-align: middle;
	width: 150px;
	margin: 0 30px;
	padding: 8px 5px;
	font-size: 10pt;
	text-align: center;
	background-color: #F2B705;
	border-radius: 5px;
	border: none;
}
.sts_list:hover {
	font-weight: bold;
	cursor: pointer;
	background-color: #F2B705;
}
.sts_list:active {
   background-color: #F2CB05;
}
.tLine{
	background-color: #4B94F2;
	width: 927px;
	height: 3px;
	margin: 10px auto;
}
/********** srch_table **********/
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px;
}

.srch_table tr {
	height: 40px;
}

.srch_table tr:nth-child(6) {
	height: 41.5px;
	border-top: 1.5px solid #d7d7d7;
}

.asc_btn {
	width: 30px;
	height: 25px;
}
.asc_btn:hover {
	cursor: pointer;
}
select {
	height: 23px;
	width: 150px;
	font-size: 12px;
}

.srch_name {
	margin: 0px 10px 0px 20px;
	font-weight: bold;
}

.srch_name_noMgn {
	margin: 0px 0px;
	font-weight: bold;	
}

.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
.attImage {
	width : 12px;
}
/* 직원검색 */
.findEmp_box {
	background-color: white;
	border : 1px solid #858585;
	height: 18px;
	width: 180px;
	border-radius : 1px;
	padding: 2px;
}
.findEmp_box2 {
	background-color: white;
	display:inline-block;
	vertical-align:top;
	height: 18px;
	width: 150px;
	margin: 0px;
	padding: 0px;	
}
input:focus {
	outline:none;
}
.findEmp_box:hover {
	cursor: pointer;
}
/* .findEmp_box:active {
	background-color : white;
	outline : 1.5px solid #222222;
} */
.userIcon{
	width: 18px;
	height: 18px;
	display: inline-block;
	vertical-align: middle;
	background-size: 18px 18px;
	background-repeat: no-repeat;
	padding-bottom: 5px;
}
/*---------  검색결과 : n건 --------- */
.SearchResult { /* 영업기회 검색결과 */
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
/********** list_table **********/
.list_table {
	border-collapse: collapse;
	background-color: #FFF;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 40px 0px;
}

.list_table thead th {
	height: 25px;
	font-size: 10pt;
	font-weight: bold;
	/* border-top: 2px solid gray; */
}

.list_table thead tr:nth-child(1) {
	border-top: 2px solid gray;
}

.list_table thead tr:nth-child(3) {
	border-bottom: 1.5px solid #d7d7d7;
}
.list_table thead tr {
	border-bottom: none;
}

.list_table tbody td {
	height: 30px;
	font-size: 10pt;
}

.list_table tbody tr:nth-child(3) {
	border-bottom: 1px solid #d7d7d7;
}
/* 글번호 */
.list_table thead tr:nth-child(1) th:nth-child(1), .list_table tbody tr:nth-child(1) td:nth-child(1)
	{
	text-align: center;
}
/* 상품명 */
.list_table tbody tr:nth-child(2) td:nth-child(2) {
	font-weight: 700;
	font-size: 10pt;
}
.list_table tbody tr:nth-child(2) td:nth-child(2):hover {
	color: #4b94f2;
	cursor: pointer;
	text-decoration: underline;
}
/* 판매 가능 버튼 */
.sales_psbl_btn {
	display: inline-block;
	vertical-align: top;
	padding: 0px 10px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #4b94f2;
	border-radius: 2px;
	color: #f2f2f2;
	cursor: pointer;
}

.sales_psbl_btn:active {
	background-color: #2e83f2;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

	if('${param.psNum}' != '' || '${param.srchType}' != '') {
		$("#psNum").val('${param.psNum}');
		$("#srchType").val('${param.srchType}');
	} else {
		$("#oldPsNum").val("0");
		$("#oldSrchType").val("0");
	}
	
	if('${param.listSort}' != '') {
		$("#listSort").val('${param.listSort}');
	} else {
		$("#oldListSort").val("0");
	}
	reloadList();
	
	// 검색버튼
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldPsNum").val($("#psNum").val());
		$("#oldSrchType").val($("#srchType").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldMngEmp").val($("#mngEmp").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	// 정렬버튼
	$("#soltBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldPsNum").val($("#psNum").val());
		$("#oldSrchType").val($("#srchType").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldMngEmp").val($("#mngEmp").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	//리드 상세보기
	$(".list_table").on("click", ".leadName", function() {
		$("#leadNum").val($(this).attr("leadNum"));
		
		$("#psNum").val($("#oldPsNum").val());
		$("#srchType").val($("#oldSrchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		$("#mngEmp").val($("#oldMngEmp").val());
		$("#listSort").val($("#oldListSort").val());
		
		$("#actionForm").attr("action", "leadCont");
		$("#actionForm").submit();
	});

	// 리드목록 페이징
	$(".pgn_area").on("click", "div", function() {
		
		$("#page").val($(this).attr("page"));
		
		$("#psNum").val($("#oldPsNum").val());
 		$("#srchType").val($("#oldSrchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		$("#mngEmp").val($("#oldMngEmp").val()); 
		$("#listSort").val($("#oldListSort").val());
		
		console.log(oldPsNum);
		
		reloadList();
	});
	
	//진행상태 색표시 
	$(".sts").on("click", ".sts_list", function() {
		if($(this).attr("num") != "0") {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
			$(this).removeClass();
			$(this).addClass("sts_list_on");	
		} else {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
		}
		
		$("#page").val("1");
		
		$("#psNum").val($(this).attr("num"));
		$("#oldPsNum").val($(this).attr("num"));
		$("#srchType").val("0"); // 진행상태버튼 클릭시 검색어 초기화
		$("#listSort").val("0"); // 진행상태버튼 클릭시 정렬 초기화

		$("[name='sales_sts']").prop("checked", false);	
		$("#sales_sts").prop("checked", true);
		
		$("#startDate").val('${startDate}');
		
 		if($("#searchTxt").val() != "" || $("mngEmp").val != "") { // 담당자, 검색어 txt가 비어있지 않으면 초기화
			var txt = document.getElementById("searchTxt");
			var mngrTxt = document.getElementById("mngEmp");
			
			txt.value = "";
			mngrTxt.value = "";
			
		} 
		reloadList();		
	});
	
	/* 검색 어제버튼 클릭 */
	$("#yesterday").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 1);
		var yesterday = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(yesterday);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 오늘버튼 */
	$("#today").on("click", function() {
		var a = new Date();
		var today = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(today);
		$("#endDate").val(today);
	});
	/* 검색 일주일전 버튼 */
	$("#aWeekAgo").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 7);
		var aWeekAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(aWeekAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 1개월전 버튼 */
	$("#oneMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 1);
		var oneMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(oneMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 3개월전 버튼 */
	$("#threeMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 3);
		var threeMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(threeMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	
	// 리드등록
	$("#writeBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadReg")
		$("#actionForm").submit();
	});

/* 리드 리스트 */
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "leadListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawTotal(res.cnt);
			drawList(res.list);
			drawPaging(res.pb, ".pgn_area");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}
//리스트
function drawList(list) {
	var html = "";
	
	html += "<colgroup>";
	html += "<col width=\"70\">";
	html += "<col width=\"100\">";
	html += "<col width=\"290\">";
	html += "<col width=\"80\">";
	html += "</colgroup>";
	html += "<thead>";
	html += "<tr>";
	html += "<th rowspan=\"3\">글번호</th>";
	html += "<th>리드번호</th>";
	html += "<th>고객사명 / 고객명</th>";
	html += "<th></th>";
	html += "</tr>";
	html += "<tr>";
	html += "<th>담당자</th>";
	html += "<th>리드명</th>";
	html += "<th>가능 여부</th>";
	html += "</tr>";
	html += "<tr>";
	html += "<th>진행상태</th>";
	html += "<th>등록일</th>";
	html += "<th></th>";
	html += "</tr>";
	html += "</thead>";
		
	for(var data of list) {
		html += "<tbody>";
		html += "<tr>";
		html += "<td rowspan=\"3\">" + data.LEAD_NUM + "</td>";
		html += "<td> LD" + data.LEAD_NUM + "</td>";
		html += "<td>" + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td class=\"leadName\" leadNum=\"" + data.LEAD_NUM + "\">" + data.LEAD_NAME + "</td>";
		html += "<td><span class=\"sales_psbl_btn\">" + data.PSBL_CHECK + "%</span></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.PSNUM + "</td>";		
		html += "<td>" + data.RGSTRTN_DATE + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "</tbody>";
	}
		
	$(".list_table").html(html);
}

/* 담당자 팝업  */
	$(".userIcon").on("click", function() {
 		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form action = \"#\" id=\"popupMngrForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
		html +=						"<option value=\"6\">영업부</option>";
		html +=						"<option value=\"7\">영업1팀</option>";
		html +=						"<option value=\"8\">영업2팀</option>";
		html +=					"</select>";
		html +=				"</div>";		
		html +=				"<div class=\"ptm_mid_bot\">";
		html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
		html +=						"<option value=\"0\">사원번호</option>";
		html +=						"<option value=\"1\">사원명</option>";
		html +=					"</select>";
		html +=				"</div>";	
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid_right\">";
		html +=				"<div class=\"ptm_mid_right_top\"></div>";
		html +=				"<div class=\"ptm_mid_right_bot\">";
		html +=					"<input type=\"text\" id=\"searchT\" name=\"searchT\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn\" id=\"mngrBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\" id=\"mngrBox\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\" id=\"mngrpb\"></div>";
		html +=		"</div>"; 
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				mngrList();
				
				$("#mngrBox").on("click", ".popup_box_in", function() {
					var mng = $(this).children("#mng").val();
					var mge = $(this).children("#mge").val();
					document.getElementById("mngEmp").value = mng;
					document.getElementById("mngNum").value = mge;
					closePopup();
				});
				
				$()
				//페이징 
				$("#mngrpb").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					mngrList();
				});
				// 검색버튼
				$("#mngrBtn").on("click", function () {
					$("#page").val("1");
					
					mngrList();	
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#mngrBtn").click();
						
						return false;
					}
				});
			},
			width : 600,
			height : 500,
			buttons : {
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
}); 

/****************** 담당자 조회 팝업 *********************/
function mngrList() {
	var params = $("#popupMngrForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngrListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			mngrDrawList(res.list);
			drawPaging(res.pb, "#mngrpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}
function mngrDrawList(list) {
	var html = "";
	
	for(var data of list) {
		
		html +=	"<div class=\"popup_box_in\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	 data.EMP_NUM + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";	
	}
	
	$("#mngrBox").html(html);
	
}
/****************** 담당자 조회 팝업 끝 *********************/
function drawTotal(cnt) {
	var html = "";
	
	html += "<h3>";
	html += "리드 (검색결과: " + cnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);

}
function drawPaging(pb, sel) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(sel).html(html);
}

/* 체크박스 */
function checkOnly(chk) {
	var obj = document.getElementsByName("sales_sts");
	for(var i = 0; i<obj.length; i++) {
		if(obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}
</script>
</head>
<body>
<!-- 검색 데이터 유지용  -->
<input type="hidden" id="oldPsNum" value="${param.psNum}" />
<input type="hidden" id="oldSrchType" value="${param.srchType}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
<input type="hidden" id="oldMngEmp" value="${param.mngEmp}" />
<input type="hidden" id="oldListSort" value="${param.listSort}" />
<!-- 데이터유지 끝 -->
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" id="leadNum" name="leadNum" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	
	<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">리드 목록</div>
			</div>
			<!-- page_title_bar end -->
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
					<!-- 검색영역 -->
					<div class="bodyWrap">
						<!-- sts : 상품현황 -->
						<div class="sts">
							<div class="sts_list" num="0">전체 : ${listCnt}건</div>
							<div class="sts_list" num="1">진행중 : ${ongoingCnt}건</div>
							<div class="sts_list" num="2">영업기회 전환 : ${rcgntnCnt}건</div>
							<div class="sts_list" num="3">실패 : ${failCnt}건</div>
						</div>
						<div class="tLine"></div>
						<!-- class="sts" end -->

						<!-- srch_table -->
						<table class="srch_table">
							<colgroup>
								<col width="80" />
								<col width="60" />
								<col width="40" />
								<col width="60" />
								<col width="60" />
								<col width="90" />
								<col width="60" />
								<col width="30" />
								<col width="10" />
								<col width="55" />
							</colgroup>
							<tbody>						
								<tr>
									<td>
										<span class="srch_name">가능 여부</span>
									</td>
									<td colspan="9">
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="0" checked="checked" onclick="checkOnly(this)" />전체</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="1" onclick="checkOnly(this)" />0% ~ 20%</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="2" onclick="checkOnly(this)" />21% ~ 40%</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="3" onclick="checkOnly(this)" />41% ~ 60%</label>
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="4" onclick="checkOnly(this)" />61% ~ 80%</label>
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="5" onclick="checkOnly(this)" />81% ~ 100%</label>
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">진행 상태</span>
									</td>
									<td>
										<select id="psNum" name="psNum">
											<option value="0">선택안함</option>
											<option value="1">진행중</option>
											<option value="2">종료(영업기회 전환)</option>
											<option value="3">종료(영업기회 실패)</option>
										</select>
									</td>
									<td>
										<span class="srch_name_noMgn">담당자</span>
									</td>
									<td colspan="7">
										<div class="findEmp_box">
											<input type="text" maxlength="20" class="findEmp_box2" id="mngEmp" name="mngEmp" style="border:0 solid black" />
											<input type="hidden" id="mngNum" name="mngNum" />
											<span><img alt="담당자이미지" class="userIcon" src="resources/images/sales/usericon.png"> </span>
										</div>										
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">기간</span>
									</td>
									<td>
										<select>
											<option>리드등록일</option>
										</select>
									</td>
									<td colspan="8">
										<input type="button" id="yesterday" value="어제" />
										<input type="button" id="today" value="오늘" />
										<input type="button" id="aWeekAgo" value="일주일 전" />
										<input type="button" id="oneMonthAgo" value="1개월 전" />
										<input type="button" id="threeMonthAgo" value="3개월 전" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td colspan="8">
										<input type="date" id="startDate" name="startDate" value="${startDate}" style="font-family : 맑은 고딕;" />
										~
										<input type="date" id="endDate" name="endDate" value="${endDate}" style="font-family : 맑은 고딕;" />
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">검색어</span>
									</td>
									<td>
										<select id="srchType" name="srchType">
											<option value="0">선택안함</option>
											<option value="1">리드명</option>
											<option value="2">고객사명</option>
											<option value="3">고객명</option>
											<option value="4">리드번호</option>
										</select>
									</td>
									<td colspan="4">
										<input type="text" class="srch_msg" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="검색 조건을 선택한 후 입력해주세요." />
									</td>
									<td>
										<span class="cmn_btn" id="searchBtn">검색</span>
									</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">정렬</span>
									</td>
									<td>
										<select id="listSort" name="listSort">
											<option value="0">선택안함</option>
											<option value="1">등록일</option>
											<option value="2">리드명</option>
											<option value="3">고객사명</option>
										</select>
									</td>
									<td>
										<img class="asc_btn cmn_btn" id="soltBtn" alt="정렬버튼" src="resources/images/sales/asc.png" />
									</td>
									<td colspan="7"></td>
								</tr>
							</tbody>
						</table>
					<div class="SearchResult"></div>

				<!-- list_table -->
					<table class="list_table"></table>
					<div class="body_bottom">
					<div class="board_bottom">
						<div class="pgn_area"></div>
						<div class="cmn_btn" id="writeBtn"> 등록</div>								
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>