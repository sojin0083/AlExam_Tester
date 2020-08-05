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
<title>검사 로딩중</title>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

function main() {
	var TRGTER = "${TRGTER}";
	if(TRGTER == "M"){
		location.href = "testPage.do?EXAM_ITEM_CD=C&TRGTER=M";
	}else if(TRGTER == "P"){
		location.href = "testPage.do?EXAM_ITEM_CD=C&TRGTER=P";
	}else{
		location.href = "main.do"
	}
	
}
setTimeout(main, 5000);
</script>
</head>
<body>
	<div class="card text-center">
		<div class="card-body">
			<h2>5초뒤에 검사화면으로 이동합니다.</h2>
			<div class="card text-center">
				<div class="card-body">
					<h1>${notice}</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>