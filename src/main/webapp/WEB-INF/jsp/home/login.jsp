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
<%
		boolean isLogin = false;
		String orgCd = (String)session.getAttribute("orgCd");
		String orgNm = (String)session.getAttribute("orgNm");

		if (orgCd != null && orgNm != null){
			isLogin = true;
		}
%>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<%	if (isLogin){ %>
	location.href="main.do"
	<% } %>
});
</script>
<script type="text/javaScript" language="javascript" defer="defer">
function login_button() {
	if($('#org_cd').val() == ''){
		alert("기관코드를 입력하세요.");
		return false;
	}
	if($('#org_pw').val() == ''){
		alert("비밀번호를 입력하세요.")
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
					<input type="text" class="form-control" name="ORG_CD" id="org_cd" placeholder="기관코드">
					<input type="password" class="form-control" name="ORG_PW" id="org_pw" placeholder="비밀번호">
					<input class="form-check-input" type="checkbox" name="AUTO_LOGIN" value="yes">자동로그인
					<button type="submit" class="btn btn-success" onclick="return login_button()">로그인</button>
				</form>
			</div>
		</div>
		<div class="card-footer">
		
		</div>
	</div>
</body>
</html>