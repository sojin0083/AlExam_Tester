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
<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<meta charset="UTF-8">
<title>치매진단 검사도구</title>
<script type="text/javaScript" language="javascript" defer="defer">
window.onkeydown = function()	{
	location.href = "loading.do";
};
</script>
</head>
<body>
	<div class="card text-center">
		<div class="card-body">
			<c:forEach var="infoList" items="${infoList}">
				<%-- <h1>${infoList.Test_Name}</h1> --%>
				<h2>아무키나 눌러주세요.</h2>
				<%-- <h3>${infoList.HP_Name}</h3> --%>
			</c:forEach>
		</div>
	</div>
</body>
</html>