<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

.aprvl_btun{
	width: 900px;
	display: inline-flex;
	justify-content: flex-end;
	margin-bottom: 20px;
	
}

.aprvl {
	border: 1px solid #000;
	font-size: 14px;
	background-color: #F2B705;
	text-align: center;
	width: 50px;
	height: 30px;
	margin-left: 500px;
	margin-right: 10px;
	line-height: 2;
	
}


.hold {
	border: 1px solid #000;
	font-size: 14px;
	background-color: #F2B705;
	text-align: center;
	width: 50px;
	height: 30px;
	line-height: 2;
}



.aprvl_line {
	font-size: 14px;
	display: inline-block;
	border-collapse: collapse;
	margin-left: 600px;
	height: 100px;
	margin-bottom: 10px;
}

.aprvl_line {
	border: 1px solid #000;
}

.aprvl_line thead{
	border-bottom: 1px solid #000;
}

.aprvl_line th{
	border-right: 1px solid #000;
}

.aprvl_line td{
	border-right: 1px solid #000;
}

.aprvl_line tbody tr:nth-child(1) {
	
	height: 50px;
	text-align: center;
}



.aprvl_line tbody tr:nth-child(2) {
	text-align: center;
}
.container {
	background-color: #b7b7b7;
}

#dcmnt_num{
	margin-left: 20px;
	margin-right: 150px;
	width: 100px;
	height: 25px;
	margin-top: 10px;
	margin-bottom: 20px;
}

#draft_day{
	margin-left: 20px;
	width: 120px;
	height: 25px;
}

#drftr {
	margin-left: 35px;
	margin-right: 150px;
	width: 100px;
	height: 25px;
}

#draft_dept{
	margin-left: 20px;
	width: 100px;
	height: 25px;
}

#crbn_copy {
	margin-top: 20px;
	margin-left: 35px;
	width: 100px;
	height: 25px;
}

#dcmnt_tlte{
	margin-top: 20px;
	margin-left: 20px;
	width: 300px;
	height: 25px;
}

#atchd_file{
	margin-top: 20px;
	margin-left: 20px;
	width: 200px;
	height: 25px;
}

#atchd_file_box{
	width: 200px;
	margin-left: 20px;
	height: 25px;
}

#draft {
	margin-top: 20px;
	margin-left: 35px;
	height: 25px;
}

#cont {
	margin-top: 20px;
	margin-bottom: 10px;
	margin-left: 50px;
	width: 700px;
	height: 100px;
}

.aprvl_cmnt{
	border-collapse: collapse;
	height: 100px;
	font-size: 14px;
	border: 1px solid #000;
}


.aprvl_cmnt tbody tr {
	border-top: 1px solid #000;
	text-align: center;
}

.aprvl_cmnt th {
	border-right: 1px solid #000;
}

.aprvl_cmnt td {
	border-right: 1px solid #000;
}
span {
	font-size: 14px;
	text-align: right;
}

h3 {
	font-size: 18px;
}

/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	$(".aprvl").on("click", function() {
		
		
		
	/*	html += "<div style=\"margin-top: 20px; font-size: 14px;\">";
		html +=	"<span>결재처리</span>";
		html +=	"<input type = \"radio\" name=\"a\" id=\"r1\"/><label for = \"r1\" >승인</label>";
		html +=	"<input type = \"radio\" name=\"a\" id=\"r2\"/><label for = \"r2\" >반려</label>";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<span>결재의견</span>";
		html +=	"<input type=\"text\" id=\"aprvl_cmnt\">";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<span>파일</span>";
		html +=	"<input type=\"text\" style=\"width: 200px; margin-left: 28px; margin-top: 20px;\">";
		html +=	"<input type=\"file\">";
		html +=	"</div>";
		*/
		
		 var html = "";
		
		
		
		html += "<div style=\"margin-top: 20px; font-size: 14px;\">";
		html += "<span>결재처리</span>";
		html += "<input type = \"radio\" name=\"a\" id=\"r1\"/><label for = \"r1\" >승인</label>";
		html += "<input type = \"radio\" name=\"a\" id=\"r2\"/><label for = \"r2\" >반려</label>";
		html += "</div>";
		html += "<div>";
		html += "<span>결재자</span>";
		html += "<input type=\"text\" name=\"aprvler\" id=\"aprvler\" value=\"" + "${sEmpName}" +"\">";
		html += "</div>";
		html += "<div>";
		html += "<span>부서</span>";
		html += "<input type=\"text\" name=\"dept\" id=\"dept\" value=\"" + "${sDeptName}" +"\">";
		html += "</div>";
		html += "<div>";
		html += "<span>결재일시</span>";
		//html += "<input type=\"text\" name=\"aprvl_date\" id=\"aprvl_date\" value=\"" + data.STS_CHNG_DATE +"\">";
		html += "</div>";
		html += "<div>";
		html += "<span>의견</span>";
		html += "<input type=\"text\" style=\"width: 200px; height: 100px; margin-left: 28px; margin-top: 20px;\">";
		html += "</div>"; 
		
		
	makePopup({
		bg : true,
		bgClose : false,
		width : 600,
		height : 600,
		title : "결재",
		contents : html,
		contentsEvent : function() {
			console.log("????");
			$.ajax({
				type : "post",
				url : "aprvlProcessAjax",
				dataType : "json",
					error : function(req) {
					console.log(req.responseText)	
				}
				
			});
			
			
					
			},
		buttons : [{
			name : "저장",
			func:function() {
				
				/* 여기에 넣기 */
				
				closePopup();
			}
		},//버튼 저장 
		{name : "닫기"
		}] //버튼 닫기
		
		}); //팝업 

	
		});

});

function reloadList() { // 목록 조회용 + 페이징 조회용
	  var params = $("#actionForm").serialize();
  
  $.ajax({
 	 type : "post",
 	 url : "aprvlListsAjax",
 	 dataType : "json",
 	 data : params,
 	 success : function(res) {
 		 	console.log(res);
 		 	console.log("옴?");
 		 	drawList(res.list);
 		 	
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
  });
	
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		
	let time = data.DRAFT_DATE;
	
	html+= "	<div>                                                                            ";
	html+= "	<span>결재번호                                                            ";
	html+= "</span>";
	html+= "	<input type=\"text\" name=\"no\" id=\"no\" value= \"" + data.APRVL_NUM + "\">  ";
	html+= "	<span>기안일자                                                            ";
	html+= "</span>";
	html+= "	<input type=\"text\" name=\"draft_day\" id=\"draft_day\" value=\"" + new Date(time).getFullYear()+'-'+(new Date(time).getMonth()+1)+'-'+ new Date(time).getDate() + "\">                                               ";
	html+= "	</div>                                                                           ";
	html+= "	<div>                                                                            ";
	html+= "	<span>기안자                                                              ";
	html+= "</span>";
	html+= "	<input type= \"text\" id=\"drftr\">                                                  ";
	html+= "	<span>참조자                                                             ";
	html+= "</span>";
	html+= "	<input type=\"text\" id=\"crbn_copy\">                                               ";
	html+= "	</div>                                                                           ";
	html+= "	<div>                                                                            ";
	html+= "	<span>문서제목                                                            ";
	html+= "</span>";
	html+= "	<input type=\"text\" name=\"dcmnt_tlte\" id=\"dcmnt_tlte\" value= \"" + data.TITLE + "\">    ";
	html+= "	</div>                                                                           ";
	html+= "	<div>                                                                            ";
	html+= "	<span>첨부파일                                                            ";
	html+= "</span>";
	html+= "	<input type=\"text\" id=\"atchd_file_box\">                                          ";
	html+= "	<input type=\"file\" id=\"atchd_file\">                                              ";
	html+= "	</div>                                                                           ";
	html+= "	<div>                                                                            ";
	html+= "	<span>내용                                                                ";
	html+= "</span>";
	html+= "	<input type=\"text\" id=\"cont\" name=\"cont\" value= \"" + data.CONT + "\">                 ";
	html+= "	</div>                                                                           ";
	
	}                                                                                        
	$(".container").html(html);
}

	





</script>
</head>
<body>
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
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->
	<form action="aprvlTmpltBox" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					<input type="hidden" id="no" name="no" value = "${param.no}"/>
									
		</form>
	
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
						<div class="aprvl_btun">
				<div class="aprvl" id = "aprvl">결재</div>
				<span class="hold">보류</span>
			</div>
			<div>
			<table class="aprvl_line">
				<colgroup>
					<col width="20">
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>기안</th>
						<th>팀장</th>
						<th>사장</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>결<br/>재</td>
						<td>홍길동 <br/>승인</td>
						<td>김팀장<br/>승인</td>
						<td>이사장</td>
					</tr>
					<tr>
						<td></td>
						<td>2021.12.24</td>
						<td>2021.12.24</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
				<div class="container">
				
				</div>
			<div class="container_1">
				<div>
					<h3>결재의견</h3>
				</div>
				<div>
					<table class="aprvl_cmnt">
						<colgroup>
							<col width="50">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="550">
						</colgroup>
						<thead>
							<tr>
								<th>결재</th>
								<th>결재자</th>
								<th>부서</th>
								<th>결재일시</th>
								<th>의견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>승인</td>
								<td>김팀장</td>
								<td>그룹웨어</td>
								<td>2021.12.24</td>
								<td>관련서류 이상 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
				
			</div>                                                                                     
			
		
		
		</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>

</body>
</html>