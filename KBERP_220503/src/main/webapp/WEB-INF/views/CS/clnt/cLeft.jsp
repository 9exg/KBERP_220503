<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

</script>
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
</form>
	<!-- Left Menu -->
	<div class="left_area">
		<div class="emp_info_area">
			<div class="emp_info">
				<div class="emp_info_wrap">
					<div class="emp_name_txt">${sClntName}<div class="emp_opt_btn"></div></div>
				</div>
			</div>
			<div class="emp_menu_area">
				<div class="emp_menu">내정보</div>
				<div class="emp_menu_last" id="logoutBtn">로그아웃</div>
			</div>
		</div>
		<div class="left_menu_wrap">
		</div>
	</div>
	<!-- Contents -->
	<div class="right_area">
		<div class="right_area_wrap">
		<div class="navi_bar"></div>