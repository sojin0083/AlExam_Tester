<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<!-- 문자셋 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/css/bootstrap/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<meta charset="UTF-8">
<title>치매진단 검사도구</title>
<script type="text/javaScript" language="javascript" defer="defer">
function login_button() {
	if($('#login_id').val() == ''){
		alert("ID를 입력하세요.");
		return false;
	}
	if($('#login_password').val() == ''){
		alert("PASSWORD를 입력하세요.")
		return false;
	}
	return true;
}

</script>
</head>
<body>
	<div class="card text-center">
		<div class="card-body">
			<h1>온라인 치매검사</h1>
			<div class="card-body">
				<form name="login" class="form-group" method="post" action="<c:url value='/login.do'/>">
					<input type="text" class="form-control" name="id" id="login_id" placeholder="ID">
					<input type="password" class="form-control" name="password" id="login_password" placeholder="PASSWORD">
					<button type="submit" class="btn btn-success" onclick="return login_button()">로그인</button>
				</form>
			</div>
		</div>
		<div class="card-footer">
		
		</div>
	</div>
</body>
</html>