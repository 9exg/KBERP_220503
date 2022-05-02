<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 보고서</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
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

/********** div 큰 영역  **********/
.new_sales_actvty {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 260px;
	margin-bottom: 30px; 
}
.sales_text_bot{
	width: 428px;
	height: 200px;
	/* border: 1px solid #000; */
	border: none;
	margin-top: 10px;
	font-size: 11pt;
	position: relative;
}
.sales_text_bot2{
	width: 927px;
	height: 240px;
	/* border: 1px solid #000; */
	border: none;
	margin-top: 10px;
	font-size: 11pt;
	position: relative;
}
/* ************* 신규고객 CSS ************* */
.mhPos {
	display: inline-block;
	vertical-align: top;	
	width: 428px;
	height: 30px;
	margin-top: 5px;
}
.mhTxt {
	display: inline-block;
	vertical-align: top;
	width: 80px;
	height: 30px;
	font-size: 9pt;
	font-weight: bold;
	text-align: center;
	color: #7b7b7b;
}
.cc {
	position: absolute;
	top: 35px;
	left: 10px;
	background-color: #F2B705;
}
.clnt {
	position: absolute;
	top: 90px;
	left: 10px;
	background-color: #F2CB05;
}
.ccTxt {
	display: inline-block;
	vertical-align: top;
	width: 60px;
	height: 30px;
	font-size: 10pt;
	font-weight: bold;
	color: white; 
	text-align: center;
	line-height: 30px;
	border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	margin: 10px 0px 10px 5px;
}
.chartData {
	width: 375px;
	height: 50px;
	display: inline-block;
	vertical-align: top;
	background-color: #F2F2F2;
	margin: 0px 10px 5px 0px;
	float: right; 
}
.ccMonth {
	display: inline-block;
	vertical-align: middle;
	height: 50px;
	line-height: 50px;
	font-size: 12pt;
	font-weight: bold;
	color: #7b7b7b;
	text-align: center;
}
.ago {
	width: 80px;
	margin-left: 42px;
}
.mon {
	width: 84px;
}
.all {
	width: 65px;
}
/* ************* 신규고객 CSS 끝 ************* */
.cont_right {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-right: 33.5px;	
}
.cont_left {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-left: 33.5px;	
}
/********** 검색 영역 **********/
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 50px 0;
	border-top: 1.5px solid #4B94F2;
}
.srch_table tr:nth-child(2) {
	border-bottom: 2.5px solid #d7d7d7;
}
.srch_table tr {
	height: 40px;
}
.srch_table td {
	padding: 10px 0px;
}
select {
	height: 24px;
	width: 150px;
	font-size: 12px;
}

.srch_name {
	margin: 0px 10px 0px 10px;
	font-weight: bold;
}
td:nth-child(1), td:nth-child(3), td:nth-child(5) {
	text-align: center;
}
.date {
	width: 180px;
	height: 20px;
	font-family: "맑은 고딕";
}
.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
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
.userIcon{
	width: 18px;
	height: 18px;
	display: inline-block;
	vertical-align: middle;
	background-size: 18px 18px;
	background-repeat: no-repeat;
	padding-bottom: 5px;
}
.asc_btn {
	width: 30px;
	height: 25px;
}
.asc_btn:hover {
	cursor: pointer;
}
/********** 제목 영역 **********/
.sales_text, .img_rect {
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	font-weight: bold;
	color: #7b7b7b;
}

.sales_text {
	width: 100%;
}

.sales_text_top {
	display: inline-block;
	padding: 5px 0px;
}

/* 파란 줄 */
.actvty_tLine1 {
	background-color: #4B94F2;
	width: 100%;
	height: 2px;
}
.actvty_tLine2 {
	background-color: #4B94F2;
	width: 927px;
	height: 2px;
}
/* 네모 이미지 */
.img_rect {
	width: 12px;
	height: 12px;
	padding-top: 4px;
	margin-right: 10px;
	margin-left: 10px;
}
#pie-chart {
	width: 428px;
	height: 250px;
}
#bar-chart {
	width: 927px;
	height: 260px;
}
#datatable {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

#datatable caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

#datatable th {
    font-weight: 600;
    padding: 0.5em;
}

#datatable td,
#datatable th,
#datatable caption {
    padding: 0.5em;
}

#datatable thead tr,
#datatable tr:nth-child(even) {
    background: #f8f8f8;
}

#datatable tr:hover {
    background: #f1f7ff;
}
</style>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src=" https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	getData();
	
	if('${param.deptNum}' != '') {
		$("#deptNum").val('${param.deptNum}');
	}
	
	$(".cmn_btn").on("click", function() {
		
		$("#actionForm").attr("action", "clntChart");
		$("#actionForm").submit();
	});
	
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
	
	/* 차트에 데이터 가져오기 */
	function getData() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "clntRprtDataAjax",
			dataType : "json",
			data: params,
			success : function(res) {
				clntMakeChart(res.list);
			},
			error : function(request, status, error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	/* 차트 그리기 */
	function clntMakeChart(list) {
		console.log(list);
		//고객등급 차트
		$('#pie-chart').highcharts({
			chart: {
				type: 'pie',
				zoomType: 'x'
			},
			title: {
				text: ''
			},
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '{point.percentage:.1f} %({point.y}명)'
		            },
		            showInLegend: true
		        }
		    },
			colors: ['#FF6384', '#ffd950', '#02bc77', '#28c3d7','#4169e1'],
 	        series : [{
        		name: '고객사',
        		data : list
        	}],
            credits: {
                enabled: false
            }
		});
		//영업부서 차트
		$('#bar-chart').highcharts({
		    data: {
		        table: 'datatable'
		    },
			chart: {
				type: 'column',
			},
			title: {
				text: ''
			},
		    yAxis: {
		        title: {
		            text: ''
		        }
		    },
			legend: {
				enabled: true
			},
		    xAxis: {
		        type: 'category'
		    },
		    tooltip: {
		    },
            credits: { //워터마크 숨김
                enabled: false
            },
            colors: ["#F2B705", "#F2CB05"],
            series: [{
            	pointWidth: 50 // bar 너비 지정
            }, {
            	pointWidth: 50 // bar 너비 지정
            }]
		});
	}
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
</script>
</head>
<body>
<input type="hidden" id="olddeptNum" value="${param.deptNum}" />
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />

	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">고객 차트</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
					<!-- 검색창 -->
					<table class="srch_table">
						<colgroup>
							<col width="84" />
							<col width="154" />
							<col width="100" />
							<col width="186" />
							<col width="110" />
							<col width="297" />
						</colgroup>
						<tbody>
							<!-- col=4 -->
							<tr>
								<td>
									<span class="srch_name">부서</span>
								</td>
								<td>
									<select id="deptNum" name="deptNum">
										<option value="0">영업부</option>
										<option value="1">영업1팀</option>
										<option value="2">영업2팀</option>										
									</select>
								</td>
								<td>
									<span class="srch_name">담당자</span>
								</td>
								<td>
									<div class="findEmp_box">
										<input type="text" maxlength="20" class="findEmp_box2" id="mngEmp" name="mngEmp" value ="${param.mngEmp}" style="border:0 solid black" />
										<input type="hidden" id="mngNum" name="mngNum" />
										<span><img alt="담당자이미지" class="userIcon" src="resources/images/sales/usericon.png"> </span>
									</div>								
								</td>
								<td>
									<span class="srch_name">내영업 조회</span>
								</td>
								<td colspan="3">
									<input type="checkbox"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">기간</span>
								</td>
								<td colspan="4">
									<input type="date" class="date" /> ~ <input type="date" class="date" />
								</td>
								<td>
									<span class="cmn_btn">검색</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="cont_right">
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />신규고객 (${tMonth})
									<input type="hidden" id="tMonth" name="tMonth" value="${startDate}">
								</div>
								<div class="actvty_tLine1"></div>
							</div>
						<div class="sales_text_bot">
							<div class="mhPos">
								<div class="mhTxt"></div>
								<div class="mhTxt">전월</div>
								<div class="mhTxt">당월</div>
								<div class="mhTxt">평균(3개월)</div>
								<div class="mhTxt">전체</div>
							</div>
							<span class="ccTxt cc">고객사</span>
							<div class="chartData">
								<span class="ccMonth ago">${cc.LAST}</span>	
								<span class="ccMonth mon">${cc.THAT}</span>	
								<span class="ccMonth mon">${cc.AVG}</span>	
								<span class="ccMonth all">${cc.CNT}</span>	
							</div>
							<span class="ccTxt clnt">고객</span>
							<div class="chartData">
								<span class="ccMonth ago">${ec.LAST}</span>	
								<span class="ccMonth mon">${ec.THAT}</span>	
								<span class="ccMonth mon">${ec.AVG}</span>	
								<span class="ccMonth all">${ec.CNT}</span>	
							</div>
						</div>
					</div>
					<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />부서
							</div>
							<div class="actvty_tLine2"></div>
						</div>
						<div class="sales_text_bot2">
							<div class="pie-bot">
								<div id="bar-chart">
								    <table id="datatable">
							        <thead>
							            <tr>
							                <th></th>
							                <th>고객사</th>
							                <th>고객</th>
							            </tr>
							        </thead>
							        <tbody>
							            <tr>
							                <th>영업부</th>
							                <td>${clntCmpnyCnt.CNT}</td>
							                <td>${clntCnt.CNT}</td>
							            </tr>
							            <tr>
							                <th>영업1팀</th>
							                <td>${clntCmpnyCnt.CNT1}</td>
							                <td>${clntCnt.CNT1}</td>
							            </tr>
							            <tr>
							                <th>영업2팀</th>
							                <td>${clntCmpnyCnt.CNT2}</td>
							                <td>${clntCnt.CNT2}</td>
							            </tr>
							        </tbody>
							    </table>									
								</div>
							</div>							
						</div>
					</div>
				</div>
				<div class="cont_left">
					<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />고객 등급
							</div>
							<div class="actvty_tLine1"></div>
						</div>
						<div class="sales_text_bot">
							<div class="pie-bot">
								<input type="hidden" name="clntsize" value="5" />
								<div id="pie-chart"></div>
							</div>	
						</div>
					</div> 
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