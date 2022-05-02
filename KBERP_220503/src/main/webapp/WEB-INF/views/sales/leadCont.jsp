`<%@ page language="java" contentType="text/html; charset=UTF-8"
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
input[type="text"], #ccGrade, #rp, #psNum {
	font-size: 9pt;
}
/* 개인 작업 영역 */
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
table{
	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(11) > td:nth-child(1){
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.btn{
	width : 90px;
	height: 40px;
}
.address{
	width : 90px;
	height: 100px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}
.btnImg:hover{
	cursor: pointer;
}
.txt{
	height: 33px;
	width: 90%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.txt_in{
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
}
.btnImg_in{
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	cursor: pointer;
	margin-right: 5px;
}
.imgPos{
	text-align: right;
}
.imgPos_in{
	text-align: right;
	background-color: #f2f2f2;
}
/* 의견, 히스토리 */
.mgtop {
	margin-top: 50px;
}
hr { /* 구분선 */
	margin-bottom: 10px;
}
.bot_title { 
	font-size: 11pt;
}
.bx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.OpinionBox {
	width: 830px;
	height: 70px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.name {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 20px;
}
#scName {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 5px;	
}
#scName:hover {
	color: #4b94f2;
	cursor: pointer;
	text-decoration: underline;
}
.txtOp, .dt, .del {
	padding-left: 20px;
}
.dt {
	padding-right: 590px;
}
.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}
.del:hover {
	cursor: pointer;
	color: #F2CB05;
}
.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}
textarea {
	width: 757px;
	height: 52px;
	font-size: 10.5pt;
	white-space: pre-wrap;
	resize: none;
	font-family: "맑은 고딕";
	display: inline-block;
	vertical-align: top;
	outline: none;
}
.subm {
	margin-left: 14px;
	width: 35px;
	height: 56px;
	line-height: 56px;
}
.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.drop_btn:hover, .plus_btn:hover, .up_btn:hover {
	cursor: pointer;
}
/* 예정된 일정  */
.sche {
	display: inline-block;
	width: 696.5px;
}
.sch_re, .sch_del {
	font-size: 9pt;
	color: gray;
}
.sch_re:hover, .sch_del:hover {
	cursor: pointer;
	color: #F2CB05;
}
/* 전환 */
.next_bot {
	margin-top: 20px;
	width: 100%;
	height: 30px;
}
.next_stage {
	font-size: 13pt;
	color: #2E83F2;
}
.popup_cont2 {
	/* 내용 변경용 */
	font-size: 13pt;
	font-weight: 600;
	text-align: center;
	line-height: 100px;
}
.nb {
	font-size: 14px;
	float: right;
	display: none;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.rvn_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}
.plus_btn_bot {
	position: absolute;
	top: 7px;
	left: 884px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
/* 의견 박스 */
.opbx{
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto; 
}

.op_title {
 font-size: 11pt;
}

/* 예정된 일정 */
.schdl_title {
	position: relative;
	font-size: 11pt;
}

.sbx { 
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}

.drop_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.up_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
}
.drop_btn_bot:hover, .up_btn_bot:hover {
	cursor: pointer;
}
.popup_table {
	border-collapse: collapse;
	display: table-cell;
	margin: 0px;
	table-layout: fixed;
}
.pop_cntrct_box_in {
    width: 538px;
    height: 50px;
    border: 1px solid #d7d7d7;
    border-radius: 7px;
    font-size: 10pt;
}
.pop_rvn_txt {
    height: 25px;
    width: 538px;
    padding: 0 15px;
    font-size: 14px;
    color: black;
    box-sizing: border-box;
    outline: none;
    border-radius: 3px;
    line-height: 25px;
    border: 1px solid #d7d7d7;
    background-color: #F2F2F2;
    text-align: left;
    font-weight: bold;
	margin-top: 10px;
    margin-bottom: 5px;
}
#fileName, #popFileName {
	border: hidden;
	outline: none;
	font-size: 10pt;
}
#attFileName {
	font-size: 10pt;
}
.popBtn{
	width: 80px;
	height: 40px;
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	border: none;
	text-align: center;
}
.pop_txt{
	height: 30px;
	width: 420px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.pop_txt_in{
	height: 30px;
	width: 420px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.pop_dt_txt{
	height: 30px;
	width: 195px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.imgP{
	position: relative;
}
.ta_box {
    width: 450px;
    height: 52px;
    font-size: 10.5pt;
    white-space: pre-wrap;
    resize: none;
    font-family: "맑은 고딕";
    display: inline-block;
    vertical-align: top;
    outline: none;
    border-color: #d7d7d7;
}
.wave {
	display: inline-block;
	padding-left: 20px;
	padding-right: 27px;
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
.popup_title_mid {
	width: calc(100% + 20px);
    height: 70px;
    margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
}
.popup_box_in {
   width: calc(100% - 4px);
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
/* 팝업 내용 */
.popup_lead_box{
   display: inline-block;
   width: 558px;
   height: 50px;
   margin-left : 135px;
}
.boldname{
	font-weight: bold;
	margin-left : 15px;
}
.prgrs {
	font-weight : bold;
	color : #2E83F2;
	margin-left : 15px;
}
#att{
	display: none;
}
#percent {
	font-size: 10pt;
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
	margin-bottom: 5px;
	/* margin-left: 25px; */
}
.mngTxt {
	height: 33px;
	width: 85%;
	padding: 0 5px;
	font-size: 12px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;	
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

[href] {
	color: black;
	text-decoration: none;
}
</style>
<!-- popup css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/common_sales.css?version=${version}" />
<!-- popup javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	/* 목록버튼 선택 시 */
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadList");
		$("#actionForm").submit();
	});
	/* 수정버튼 선택 시 */
	$("#updateBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadUpdate");
		$("#actionForm").submit();
	});
	/* 삭제버튼 선택 시 */
	$("#deleteBtn").on("click", function() {
		
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "알림",
			width : 400,
			height : 200,
			contents : popContOneLine("삭제하시겠습니까?"),
			contentsEvent : function() {					
			},
			buttons : [{
				name : "삭제",
				func:function() {
					
					makePopup({
						depth : 2,
						bg : true,
						bgClose : false,
						title : popContOneLine("삭제되었습니다."),
						contents : html,
						width : 400,
						height : 180,
						buttons : {
							name : "확인",
							func:function() {
								// 삭제
								var params = $("#actionForm").serialize();
								
								$.ajax({
									type : "post", 
									url : "leadAction/delete", 
									dataType : "json", 
									data : params, 
									success : function(res) { 
										if(res.res == "success") {
											$("#actionForm").attr("action", "leadList");
											$("#actionForm").submit();
										} else {
											makeAlert("알림", popContOneLine("삭제중 문제가 발생하였습니다."));
										}
									},
									error : function(request, status, error) {
										console.log(request.responseText);
									}
								}); //ajax end	
							}					
						} // buttons1 end
					}) // 삭제 완료 popup end
				console.log("One!");
				closePopup();
				} // 저장 func end
			}, {
				name : "취소"
			}] 
		}); // makePopup end	
	});
	/* 고객사 등급 선택되게 */
	$("#ccGrade").val(${data.GRADE_NUM}).prop("selected", this.selected);
	
	/* 인지경로 선택 되게 */
	$("#rp").val(${data.RCGNTN_PATH_NUM}).prop("selected", this.selected);
	
	/* 진행상태 선택 되게 */
	$("#psNum").val(${data.PRGRS_STS_NUM}).prop("selected", this.selected);
	
	
	/* 리드 상세보기 실행될 시 비동기로 의견 목록 그리기 위해 선언  */
	reloadOpList();
	
	// 진행상태 - 전환 성공시 목록버튼,수정버튼 숨김
	if($("#psNum").val() == 2) {
		$("#updateBtn").hide();	
		$("#deleteBtn").hide();	
	} 
	/* 진행중일때만 전환하기 버튼 생성  */
	if($("#psNum").val() == 1) {
		$(".nb").show();		
		/* 영업기회 전환 버튼 */
		$("#leadToSales_btn").on("click", function() {
			var html = "";
			
			html += "<div class=\"popup_cont2\">";
			html += "<span class=\"next_stage\">영업기회</span>로 전환하시겠습니까?</div>";
			
			makePopup({
				depth : 1,
				bg : false,
				bgClose : false,
				title : "영업기회로 전환",
				contents : html,
				draggable : false,
				buttons : [{
					name : "확인",
					func:function() {
						var ltshtml = "";
						
						ltshtml += "<div class=\"popup_cont2\">해당 리드가 영업기회로 전환되었습니다.</div>";
						
						makePopup({
							depth : 2,
							bg : true,
							width : 400,
							height : 180,
							title : "전환 완료",
							draggable : true,
							contents : ltshtml,
							buttons : {
								name : "확인",
								func:function() {
									$("#salesForm").attr("action", "sales1SalesChncReg");
									$("#salesForm").submit(); 
									console.log("One!");
									closePopup(2);
								}
							}
						});
						closePopup(1);
					}
				}, {
					name : "취소"
				}]
			});
		});	
	}
	/* 의견등록 start */
	$(".subm").on("click", function() {

		if(checkEmpty("#tatacont")) {
			
			makePopup({
				depth : 1,
				bg : true,
				width : 400,
				height : 200,
				title : "알림",
				contents :  popContOneLine("의견 내용 입력 후, 등록버튼을 눌러주세요."),
				buttons : {
					name : "확인",
					func:function() {
						console.log("One!");
						closePopup();
					}
				}
			});
			("#tatacont").focus();
		} else {
			var params = $("#botOpActionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "llBotActionAjax/insert",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "success"){
						$("#tatacont").val("");
						reloadOpList();
					} else {
						makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
					}
				}, error : function(request,status, error) {
					console.log(request.responseText);
				}
			});
		}
	});
	/* 의견등록 end */
	
	/* 의견 삭제 버튼 start */
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;

		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : popContOneLine("삭제하시겠습니까?"),
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func : function() {
					
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "llBotActionAjax/update",
						data : params,
						dataType : "json",
						success : function(res) {
							if(res.res == "success"){
								reloadOpList();
							} else {
								makeAlert("알림", popContOneLine("삭제중 문제가 발생하였습니다."));
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					closePopup();
				}
			}, {
				name : "아니오"
			}]
		});
	});
	/* 의견 삭제 버튼 end */
	
	/* 예정된 일정 영역 */
	
	$(".schdl_title").on("click", ".drop_btn_bot", function() {
		$(".sbx").hide();
		html = "<div class=\"up_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	$(".schdl_title").on("click", ".up_btn_bot", function() {
		$(".sbx").show();
		html = "<div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	// 상세보기 하단 예정된 일정 실행
	reloadSCList();
	
	/* 예정된 일정 등록 팝업 */
	$(".plus_btn_bot").show();
	
	$(".schdl_title").on("click", ".plus_btn_bot", function() {
	
		var html = "";
			
		html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
		html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
		html += "<table class=\"popup_table\">";
		html += "	<tbody>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"리드\" readonly=\"readonly\"/></td>";
		html += "			<td>";
		html += "				<div class=\"imgP\">";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" value=\"${data.LEAD_NAME}\" />";
		html += "					<input type=\"hidden\" id=\"lNum\" name=\"lNum\" value=\"${param.leadNum}\"/>";
		html += "				</div>";
		html += "			</td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\" value=\"${data.CLNT_NAME}\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\"  value=\"${data.CLNT_CMPNY_NAME}\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\"/></td>";
		html += "			<td><select class=\"pop_txt_in\" id=\"ssactvtyclsfy\" name=\"ssactvtyclsfy\">";
		html += "					<optgroup>";
		html += "						<option value=\"9\">선택하세요</option>";
		html += "						<option value=\"0\">전화</option>";
		html += "						<option value=\"1\">메일</option>";
		html += "						<option value=\"2\">방문</option>";
		html += "						<option value=\"3\">기타</option>";
		html += "					</optgroup>";
		html += "			</select></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\"/>";
		html += "				<div class=\"wave\">" + " ~ "  + "</div>";
		html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\"/></td>";
		html += "			<td style=\"border-bottom: none\"><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\"></textarea></td>";
		html += "		</tr>";
		html += "	</tbody>";
		html += "</table>";				
		html += "<div class=\"pop_rvn_txt\"> 첨부파일  ";
		html += "	<img class=\"plus_btn aff_btn\"  src=\"resources/images/sales/plus.png\"/>"; 
		html += "</div>";
		html += "<div class=\"pop_cntrct_box_in\">";
		html += "	<input type=\"text\" id=\"popFileName\" name=\"fileName\" readonly=\"readonly\">";
		html += "</div>";
		html += "<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadName(this)\"/>";
		html += "<input type=\"hidden\" id=\"schdlAttFile\" name=\"schdlAttFile\" />";	
		html += "</form>";
	
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "예정된 일정 등록",
			contents : html,
			contentsEvent : function() {
				$(".aff_btn").on("click", function() {
					$("#att").click();
				});
				
			},
			width : 600,
			height : 520,
			buttons : [{
				name : "등록",
				func : function() {
						if(checkEmpty("#ssname")){
							makeAlert("필수입력", popContOneLine("일정명을 입력하세요"), function() {
								$("#ssname").focus();								
							});
						} else if($("#ssactvtyclsfy").val() == 9){
							makeAlert("필수입력", popContOneLine("활동분류를 입력하세요"), function() {
								$("#ssactvtyclsfy").focus();
							});
						} else if(checkEmpty("#sdt")){
							makeAlert("필수입력", popContOneLine("시작일을 입력하세요"), function() {
								$("#sdt").focus();								
							});
						} else if(checkEmpty("#ssactvtycont")){
							makeAlert("필수입력", popContOneLine("활동내용을 입력하세요"), function() {
								$("#ssactvtycont").focus();								
							});
						} else {							
							console.log(${sEmpNum});
							var RegForm = $("#RegForm");
										
							RegForm.ajaxForm({
							success: function(res) {
									if(res.fileName.length > 0) {
										$("#schdlAttFile").val(res.fileName[0]);
									}		
									var params = $("#RegForm").serialize();
												
									$.ajax({
									type  : "post",
									url : "salesSchdlAction/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success"){
											reloadSCList();								
										} else {
											makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
												}
										},
										error : function(request, status, error) {
											console.log(request.responseTxt);
										}
									});
								},
							error : function(req) {
									console.log(req.responseTxt);
							}
						});				
						RegForm.submit();
						closePopup(1);
						reloadSCList();
						} //if else문 end
					}
				}, {
					name : "취소"
				}]// button 함수 end						
			});
		});		
	
	/* 예정된 일정 상세 팝업 */
	$(".sbx").on("click","#scName", function() {
		var snum = $(this).children("#schdlListNumber").val();
		var lnum = $(this).children("#leadListNumber").val();
		document.getElementById("schdlNumber").value = snum;
		document.getElementById("leadNumber").value = lnum;
		
		
		var params = $("#lsForm").serialize();
		
		$.ajax({
			type  : "post",
			url : "leadSchdlAjax",
			dataType : "json",
			data : params,
			success : function(lsData) {	
				var html = "";
				
				$.each(lsData, function(index, data) {
					
					html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
					html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
					html += "<table class=\"popup_table\">";
					html += "	<tbody>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\" value=\"" + data.SCHDL_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"리드\" readonly=\"readonly\"/></td>";
					html += "			<td>";
					html += "				<div class=\"imgP\">";
					html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" value=\"" + data.LEAD_NAME + "\" />";
					html += "					<input type=\"hidden\" id=\"lNum\" name=\"lNum\" value=\"${param.leadNum}\"/>";
					html += "				</div>";
					html += "			</td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\" value=\"" + data.LEAD_CLNT_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\"  value=\"" + data.LEAD_CLNT_CMPNY_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\"/></td>";
					html += "			<td><select class=\"pop_txt_in\" id=\"ssactvtyclsfy\" name=\"ssactvtyclsfy\" >";
					html += "					<optgroup>";
					html += "						<option value=\"9\">선택하세요</option>";
					if(data.ACTVTY_CLSFY_NUM == 0) {
						html += "						<option value=\"0\" selected=\"selected\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 1) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\" selected=\"selected\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 2) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\" selected=\"selected\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 3) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\" selected=\"selected\">기타</option>";
					}
					html += "					</optgroup>";
					html += "			</select></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\" value=\"" + data.START_DATE_HR + "\"/>";
					html += "				<div class=\"wave\">" + " ~ "  + "</div>";
					if(data.END_DATE_HR == null) {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" /></td>";
					} else {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" value=\"" + data.END_DATE_HR + "\"/></td>";
					}
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\"/></td>";
					html += "			<td style=\"border-bottom: none\"><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\">" + data.ACTVTY_CONT + "</textarea></td>";
					html += "		</tr>";
					html += "	</tbody>";
					html += "</table>";
					if(data.ATT_FILE_NAME != null) {
						var fileLength = data.ATT_FILE_NAME.length;
						var fileName = data.ATT_FILE_NAME.substring(20, fileLength);
					}
					html += "<div class=\"pop_rvn_txt\"> 첨부파일";
					html += "<span id=\"uploadBtn\">";
					if(data.ATT_FILE_NAME == null) {
						html += "	<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
					}
					html += "</span>";
					html += "</div>";
					html += "<div class=\"pop_cntrct_box_in\">";
					if(data.ATT_FILE_NAME != null) {
						html += "<a href=\"resources/upload/" + data.ATT_FILE_NAME + "\" download=\"" + fileName + "\"><span id=\"file_name\">" + fileName + "</span></a>";
					}
					html += "<input type=\"text\" id=\"fileName\" readonly=\"readonly\" />";
					html += "	<input type=\"text\" id=\"popFileName\" readonly=\"readonly\" />                 ";
					html += "	<input type=\"hidden\" id=\"schdlAttFile\" name=\"schdlAttFile\" value=\"" + data.ATT_FILE_NAME +"\"/>           ";
					html += "	<input type=\"hidden\" id=\"schdlnum\" name=\"schdlnum\" />           ";
					html += "</div>                                                                     ";
					html += "</form>";
					
				});	
				
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "예정된 일정 상세보기",
			contents : html,
			width : 600,
			height : 520,
			buttons : [{
				name : "확인",
				func : function() {
						closePopup();
						}
					}]// button 함수 end
			});
			},	
			error : function(request) {
				console.log(request.responseTxt);
			}
		});
	});
	/* 예정된 일정 수정 팝업 */
	$(".sbx").on("click", ".sch_re", function() {
		var snum = $(this).children("#schdlListNumber").val();
		var lnum = $(this).children("#leadListNumber").val();
		document.getElementById("schdlNumber").value = snum;
		document.getElementById("leadNumber").value = lnum;
		
		
		var params = $("#lsForm").serialize();
		
		$.ajax({
			type  : "post",
			url : "leadSchdlAjax",
			dataType : "json",
			data : params,
			success : function(lsData) {	
				var html = "";
				
				$.each(lsData, function(index, data) {
					
					html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
					html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
					html += "<table class=\"popup_table\">";
					html += "	<tbody>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\" value=\"" + data.SCHDL_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"리드\" readonly=\"readonly\"/></td>";
					html += "			<td>";
					html += "				<div class=\"imgP\">";
					html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" value=\"" + data.LEAD_NAME + "\" />";
					html += "					<input type=\"hidden\" id=\"lNum\" name=\"lNum\" value=\"${param.leadNum}\"/>";
					html += "				</div>";
					html += "			</td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\" value=\"" + data.LEAD_CLNT_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\"  value=\"" + data.LEAD_CLNT_CMPNY_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\"/></td>";
					html += "			<td><select class=\"pop_txt_in\" id=\"ssactvtyclsfy\" name=\"ssactvtyclsfy\" >";
					html += "					<optgroup>";
					html += "						<option value=\"9\">선택하세요</option>";
					if(data.ACTVTY_CLSFY_NUM == 0) {
						html += "						<option value=\"0\" selected=\"selected\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 1) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\" selected=\"selected\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 2) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\" selected=\"selected\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 3) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\" selected=\"selected\">기타</option>";
					}
					html += "					</optgroup>";
					html += "			</select></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\" value=\"" + data.START_DATE_HR + "\"/>";
					html += "				<div class=\"wave\">" + " ~ "  + "</div>";
					if(data.END_DATE_HR == null) {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" /></td>";
					} else {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" value=\"" + data.END_DATE_HR + "\"/></td>";
					}
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\"/></td>";
					html += "			<td style=\"border-bottom: none\"><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\">" + data.ACTVTY_CONT + "</textarea></td>";
					html += "		</tr>";
					html += "	</tbody>";
					html += "</table>";
					if(data.ATT_FILE_NAME != null) {
						var fileLength = data.ATT_FILE_NAME.length;
						var fileName = data.ATT_FILE_NAME.substring(20, fileLength);
					}
					html += "<div class=\"pop_rvn_txt\"> 첨부파일";
					html += "<span id=\"uploadBtn\">";
					if(data.ATT_FILE_NAME == null) {
						html += "	<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
					}
					html += "</span>";
					html += "</div>";
					html += "<div class=\"pop_cntrct_box_in\">";
					if(data.ATT_FILE_NAME != null) {
						html += "<a href=\"resources/upload/" + data.ATT_FILE_NAME + "\" download=\"" + fileName + "\"><span id=\"file_name\">" + fileName + "</span></a>";
						html += "	<input type=\"button\" id=\"fileDelete\" value=\"삭제\" />";
					}
					html += "<input type=\"text\" id=\"fileName\" readonly=\"readonly\" />";
					html += "	<input type=\"text\" id=\"popFileName\" readonly=\"readonly\" />                 ";
					html += "	<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadPopName(this)\" />   ";
					html += "	<input type=\"hidden\" id=\"schdlAttFile\" name=\"schdlAttFile\" value=\"" + data.ATT_FILE_NAME +"\"/>           ";
					html += "	<input type=\"hidden\" id=\"schdlnum\" name=\"schdlnum\" />           ";
					html += "</div>                                                                     ";
					html += "</form>";
					
				});	
				
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "예정된 일정 수정",
			contents : html,
			contentsEvent : function() {
				
				$("#fileDelete").on("click", function() {
					$("#file_name").remove();
					$(this).remove();
					$("#schdlAttFile").val("");
					
					var html = "";
					
					html += "<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
					
					$("#uploadBtn").html(html);
				});
				
				
				$(".pop_rvn_txt").on("click", ".aff_btn", function() {
					$("#att").click();
				});
				
				document.getElementById("schdlnum").value = snum;
			},
			width : 600,
			height : 520,
			buttons : [{
				name : "수정",
				func : function() {
						if(checkEmpty("#ssname")){
							makeAlert("필수입력", popContOneLine("일정명을 입력하세요"), function() {
								$("#ssname").focus();								
							})
						} else if($("#ssactvtyclsfy").val() == 9){
							makeAlert("필수입력", popContOneLine("활동분류를 입력하세요"), function() {
								$("#ssactvtyclsfy").focus();								
							});
						} else if(checkEmpty("#sdt")){
							makeAlert("필수입력", popContOneLine("시작일을 입력하세요"), function() {
								$("#sdt").focus();								
							});
						} else if(checkEmpty("#ssactvtycont")){
							makeAlert("필수입력", popContOneLine("활동내용을 입력하세요"), function() {
								$("#ssactvtycont").focus();								
							});
						} else {					
								
								console.log(${sEmpNum});
								var RegForm = $("#RegForm");
										
								RegForm.ajaxForm({
								success: function(res) {
										if(res.fileName.length > 0) {
											$("#schdlAttFile").val(res.fileName[0]);
										}
										
										var params = $("#RegForm").serialize();
												
										$.ajax({
										type  : "post",
										url : "salesSchdlAction/update",
										dataType : "json",
										data : params,
										success : function(res) {
											if(res.res == "success"){
												reloadSCList();								
											} else {
												makeAlert("알림", popContOneLine("수정중 문제가 발생하였습니다."));
													}
											},
											error : function(request, status, error) {
												console.log(request.responseTxt);
											}
										});
									},
								error : function(req) {
										console.log(req.responseTxt);
								}
							});
								
							RegForm.submit();
							closePopup(1);
							reloadSCList();
							} //if else문 end
						}
					}, {
						name : "취소"
					}]// button 함수 end
										
				});
		
			},
			error : function(request) {
				console.log(request.responseTxt);
			}
		});
		
	}); 
	
	/* 예정된 일정 삭제 */
	$(".sbx").on("click", ".sch_del", function() {
		var snum = $(this).children("#schdlListNumber").val();
		console.log(snum);
		document.getElementById("schdldeletenum").value = snum;
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "삭제",
			contents : popContOneLine("삭제하시겠습니까?"),
			contentsEvent : function() {
				$("#popup").draggable();
				
			},
			draggable : true,
			width : 400,
			height: 180,
			buttons : [{
				name : "확인",
				func:function(){
					
							
							var params = $("#botSchdlActionForm").serialize();
							
							$.ajax({
								type  : "post",
								url : "salesSchdlAction/delete",
								dataType : "json",
								data : params,
								success : function(res) {
									if(res.res == "success"){
										closePopup();
										reloadSCList();
									} else {
										makeAlert("알림", popContOneLine("삭제중 문제가 발생하였습니다."));
									}
								},
								error : function(request, status, error) {
									console.log(request.responseTxt);
								}
							});
						}
					}, {
						name : "취소"
						
					}]
			});
	});
	
});  //Jquery 

/* 의견 영역 */
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "llopBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.opListCnt);
			drawOpList(res.list);
		},
		error : function(request){
			console.log(request.responseText);
		}
	});
}

function drawOpCnt(opListCnt){
	var html = "";
	
	html = "<h3>의견(" + opListCnt + ")</h3>";
	
	$(".op_title").html(html);
}

function drawOpList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"name\">" + data.EMP_NAME + "(" + data.DEPT_NAME + " / " + data.RANK_NAME + ")" + "</div>";
		html += "<div class=\"txtOp\">" + data.CONT + "</div>";
		html += "<div class=\"dt\">" + data.RGSTRTN_DATE + "</div>";
		if(data.EMP_NAME == "${sEmpName}") {
			html += "<div class=\"del\">삭제";			
		} 
		html += "<input type=\"hidden\" id=\"cmntNum\" name=\"cmntNum\" value=\"" + data.CMNT_NUM + "\" />";
		html += "</div>";
		html += "</div>";
	}
	
	$(".opbx").html(html);
	
}

/* 의견 영역 종료 */
 
/* 예정된 일정 영역 */
function reloadSCList(){
	var params = $("#botSchdlActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "shdlBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawScCnt(res.scListCnt);
			drawScList(res.list);
		},
		error : function(request) {
			console.log(request.responseText);
		}
	});
}

function drawScCnt(scListCnt) {
	var html = "";
	
	html += "<h3>예정된 일정(" + scListCnt + ")</h3><div id=\"scListCnt_right\"><div class=\"drop_btn_bot\">";
	if($("#psNum").val() == 1) {
		html += "</div><div class=\"plus_btn_bot\" id=\"plus_btn_bot\"></div>";
	} else {
		$("#plus_btn_bot").hide();
	}
	$(".schdl_title").html(html);
}

function drawScList(list) {
	var html = "";
	
	for(var data of list){
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"schdl_box_in\">";
		html += "";
		html += "";
		html +=	"<div class=\"name\">일정명 :<span id=\"scName\" ><input type=\"hidden\" id=\"schdlListNumber\" value=\"" + data.SCHDL_NUM + "\" /><input type=\"hidden\" id=\"leadListNumber\" value=\"" + ${param.leadNum} + "\" />" + data.SCHDL_NAME + "</span></div>";
		html +=	"<div class=\"txtOp\">기간   " + data.START_DATE_HR +  " ~ " + data.END_DATE_HR + "</div>";
		html +=	"<div class=\"txtOp sche\">담당자   :" + data.EMP_NAME
		if(data.EMP_NAME == "${sEmpName}") {
			html += "</div><span class=\"sch_re\" >수정<input type=\"hidden\" id=\"schdlListNumber\" value=\"" + data.SCHDL_NUM + "\" /><input type=\"hidden\" id=\"leadListNumber\" value=\"" + ${param.leadNum} + "\" /></span><span> | </span><span class=\"sch_del\" >삭제<input type=\"hidden\" id=\"schdlListNumber\" value=\"" + data.SCHDL_NUM + "\" /><input type=\"hidden\" id=\"leadListNumber\" value=\"" + ${param.leadNum} + "\" /></span>";			
		}
		html += "</div>";
		html += "</div>";
	}
	
	$(".sbx").html(html);
}

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#popFileName").val(filename);
}

function uploadPopName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}

</script>
</head>
<body>
<form action="#" id="lsForm" method="post">
	<input type="hidden" id="schdlNumber" name="schdlNum"  />
	<input type="hidden" id="leadNumber" name="leadNum"  />
</form>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />	
	<input type="hidden" name="leadNum" value="${param.leadNum}" />	
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="srchType" value="${param.srchType}" />
	<input type="hidden" name="psNum" value="${param.psNum}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="listSort" value="${param.listSort}" />
	<input type="hidden" name="salesNum" id="salesNum" />																														
</form>
<form action="#" id="salesForm" method="post">
	<input type="hidden" name="leadNum" value="${param.leadNum}" />	
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="61" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="psNum" value="${param.psNum}" />
	<input type="hidden" name="salesNum" id="salesNum" />																														
</form>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">리드 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />			
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">																											
				<div class="bodyWrap">
				<!-- 시작 -->
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="150" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="리드명 *" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="txt" value="${data.LEAD_NAME}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명 *" readonly="readonly"/></td>
								<td colspan="3">
									<input type="text" class="txt" value="${data.CLNT_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly"/></td>
								<td colspan="3">
									<input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/></td>
								<td colspan="3">
									<select class="txt_in" id="ccGrade" name="ccGrade" disabled="disabled">
										<optgroup>
											<option value="0">S</option>										
											<option value="1">A</option>										
											<option value="2">B</option>										
											<option value="3">C</option>										
											<option value="4">D</option>										
										</optgroup>
									</select>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
								<td colspan="3">
									<select class="txt_in" id="rp" name="rp" disabled="disabled" >
										<optgroup>
											<option value="0">자사홈페이지</option>										
											<option value="1">인터넷검색</option>										
											<option value="2">지인소개</option>										
											<option value="3">세미나</option>										
											<option value="4">전화</option>										
											<option value="5">기타</option>										
										</optgroup>
									</select>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="mngTxt" id="mngEmp" name="mngEmp" value="${data.EMP_NAME}" readonly="readonly" />
								</td>
								<td><input type="button" class="btn" value="가능여부 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" id="psblCheck" name="psblCheck" value="${data.PSBL_CHECK}" style="text-align: right;" readonly="readonly"/>
									<div id="percent">%</div>
								</td>
							</tr>							
							<tr>
								<td><input type="button" class="btn" value="진행상태 *" readonly="readonly" /></td>
								<td colspan="3">
									<select class="txt_in" id="psNum" name="psNum" disabled="disabled">
										<option value="0">선택안함</option>
										<option value="1">진행중</option>
										<option value="2">종료(영업기회 전환)</option>
										<option value="3">종료(영업기회 실패)</option>
									</select>
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<c:set var="fileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
					<c:set var="leadFileName" value="${fn:substring(data.ATT_FILE_NAME, 20, fileLength)}"></c:set>
					<div class="rvn_txt">
						첨부파일
					</div>
					<div class="cntrct_box_in">
						<span id="attFileName">
							<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${leadFileName}">${leadFileName}</a>
						</span>
					</div>
					<div class="next_bot">
						<div class="cmn_btn nb" id="leadToSales_btn">영업기회로 전환하기 ▶</div>
					</div>
					<!-- 의견 -->
					<form action="#" id="botOpActionForm" method="post">
						<input type="hidden" name="leadNum" value="${param.leadNum}" />	
						<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
						<input type="hidden" id="cmntNum" name="cmntNum" />
						<div class="mgtop"></div>
						<div class="op_title"></div>
						<hr color="#F2B705" width="925px">
						<div class="opbx"></div>
						<div class="opBox">
							<textarea id="tatacont" name="tacont"></textarea>
							<div class="cmn_btn subm">등록</div>
						</div>
					</form>
					<!-- 예정된 일정 -->
					<form action="#" id="botSchdlActionForm" method="post">
						<input type="hidden" name="leadNum" value="${param.leadNum}" />
						<input type="hidden" name="schdlnum" id="schdldeletenum" />
						<div class="mgtop"></div>
						<div class="schdl_title"></div>
						<hr color="#F2B705" width="925px">
					</form>
					<div class="sbx"></div>
					<!-- 끝 -->
				</div>
			</div>	
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>