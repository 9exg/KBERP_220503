<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 공용 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<link rel="icon" href="resources/favicon/favi.gif" />
<style type="text/css">
html, body {
    height: 100%;
    min-height: 100%;
}

body {
    background-color: #ececee;
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-family: '맑은 고딕';
}

.login_bg {
	width: 100%;
	height: 100%;
}

.kabang_wrap {
	max-width: 700px;
    min-height: 100%;
    margin: 0 auto;
    background: #fff;
    text-align: center;
}

.login_logo {
    padding-top: 310px;
    margin-bottom: 30px;
}

.kabang_icon {
	display: inline-block;
}

.kabang_icon img {
	display: block;
	margin: 0 auto;
	width: 30px;
	height: 30px;
	
}

.kabang_black{
	display: inline-block;
}

.kabang_black img {
	display: block;
	margin: 0 auto;
	width: 100px;
	height: 30px;
	margin-left: 5px;
}

#findHead {
	display: inline-block;
	padding-top: 250px;
}

.findPwLogo {
    display: block;
    width: 210px;
    height: 40px;
    margin: 0px auto; 
    background: url(https://t1.daumcdn.net/id/member/2014/img_logo_find_140905.gif) no-repeat 0 0;
    background-size: 210px;
    background-position: 0 -40px;
}

.login_area {
	max-width: 420px;
    padding-top: 40px;
    margin: 0 auto;
}

.input_id input {
	display: block;
    width: 413px;
    height: 42px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 10px;
    margin-top: 10px;
    font-size: 12pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
}

.input_id input::placeholder {
	color: #BDBDBD;
}

.country_code select {
	display: inline-block;
    width: 120px;
    height: 46px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 10px;
    padding: 0px;
    margin-top: 10px;
    font-size: 10pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
    text-align: left;
}

.country_code select option {
	height: 30px;
}

#phone_num1 {
    width: 289px;
	display: inline-block;
}

.login_Btn {
	display: block;
    width: 420px;
    height: 50px;
    border: 1px solid #F2B705;
    border-radius: 2px;
    background-color: #F2B705;
    line-height: 55px;
    font-size: 11pt;
    font-weight: bold;
    margin-top: 15px;
    cursor: pointer;
    -ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}


</style>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 팝업 js 파일 -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!-- Util js 파일 -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".login_Btn").on("click", function() {
		if(checkEmpty("#loginId")) {
			makeAlert("로그인 안내", "아이디를 입력해 주세요.", function() {
				$("#loginId").focus();
			});
		} else if(checkEmpty("#loginPw")) {
			makeAlert("로그인 안내", "비밀번호를 입력해 주세요.", function() {
				$("#loginPw").focus();
			});
		} else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type : "post",
				url : "indvdlLoginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "cmbnInfo";
					} else if(result.res == "FAILED") {
						makeAlert("로그인 실패", "아이디나 비밀번호가 틀렸습니다.");
					} else {
						makeAlert("로그인 경고", "로그인 중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
			
		}
	}); // login_Btn END
	
		$("#sign").on("click", function() {
			$("#signForm").attr("action", "signUp");
			$("#signForm").submit();
		});
		
		$("#center").on("click", function() {
			$("#centerForm").attr("action", "clientCenter");
			$("#centerForm").submit();
		});
		
}); // document.ready END
</script>
</head>
<body>
<div class="login_bg">
	<div class="kabang_wrap">
		<div class="login_middle">
			<div id="findHead">
	            <div class="findPwLogo"></div>
		    </div>
			<div class="login_area">
				<div class="input_id">
					<input type="text" placeholder="아이디">
					<input type="text" placeholder="이름">
					<div class="country_code">
						<select id="internationalCode" name="internationalCode" title="국가코드" class="country_sel" >
							<option value="" selected disabled hidden>+82</option>
					  	 	<option value="82">대한민국 +82</option>
						</select>
							<input type="text" id="phone_num1" placeholder="핸드폰번호">
					</div>
				</div>
				<div class="login_Btn">비밀번호 찾기</div>
			</div>
		</div>
		<div class="login_logo">
			<div class="kabang_icon">
				<img alt="카뱅아이콘" src="resources/images/CS/icon_logo.png" />
			</div>
			<div class="kabang_black">
				<img alt="카뱅로고" src="resources/images/CS/logo_black.svg" />
			</div>
		</div>
	</div>
</div>
</body>
</html>