<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 급여명세서조회(관리자)</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */

.srch_month {
	height: 27px;
}

.srch_month:focus {
	outline: 2px solid #F2CB05; 
}

.board_table tbody td {
	color: black;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});
	});
	
	
	reloadList();
	
	$("#srchMonth").on("change", function() {
		$("#mon").val($("#srchMonth").val());
		$("#searchTxt").val(null);
		$("#txt").val(null);
		reloadList();
	});
	
	$("#pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	
	$("#txt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			
			$("#srchBtn").click();
			
			return false;
		}
	});
	
	$("#srchBtn").on("click", function() {
		$("#page").val("1");
		$("#searchTxt").val($("#txt").val());
		reloadList();
	});
	
	$("#aprvlBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "결재",
			contents : "결재를 요청하시겠습니까?",
			buttons : [{
				name : "요청",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$("tbody").on("click", "#empName", function() {
		$("#empNum").val($(this).attr("empNum"));
		$("#stndrYearMonth").val($(this).attr("stndrYearMonth"));
		
		$("#actionForm").attr("action", "slrSpcfctnViewMng");
		$("#actionForm").submit();
	});
	
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "slrSpcfctnListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});	
}

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.DEPT_NAME + "</td>";
		html += "<td>" + data.RANK_NAME + "</td>";
		html += "<td class=\"board_table_hover\" id=\"empName\" stndrYearMonth=\"" + data.STNDR_YEAR_MONTH + "\"  empNum=\"" + data.EMP_NUM + "\">" + data.EMP_NAME + "</td>";
		html += "<td>" + data.SLRY + "원</td>";
		html += "<td>" + data.BNFT + "원</td>";
		html += "<td>" + data.WH + "원</td>";
		html += "<td>" + data.RESULT + "원</td>";
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$("#pgn_area").html(html);
}


</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${mon}">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="searchTxt" name="searchTxt">
		<input type="hidden" id="empNum" name="empNum">
		<input type="hidden" id="stndrYearMonth" name="stndrYearMonth">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">급여명세서조회(관리자)</div>
			<div class="page_srch_area">
				<input type="month" class="srch_month" id="srchMonth" value="${mon}">

				<div class="srch_text_wrap">
					<input type="text" id="txt" placeholder="사원명" />
				</div>
				<div class="cmn_btn_ml" id="srchBtn">검색</div>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<table class="board_table">
			<colgroup>
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
			</colgroup>
			<thead>
				<tr>
					<th>부서</th>
					<th>직급</th>
					<th>사원명</th>
					<th>급여</th>
					<th>수당합계액</th>
					<th>공제합계액</th>
					<th>실지급액</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="board_bottom">
			<div class="pgn_area" id="pgn_area">
			</div>
			<div class="cmn_btn_ml" id="aprvlBtn">결재</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>