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
<title>검사 결과</title>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

window.onkeydown = function()	{
	/* 방향키 좌  방향키 우 방향키 상*/
	/*  	if(event.keyCode == 107){
			button1_click();
		}
	 	if(event.keyCode == 106){
			button2_click();
		} 
	 	if(event.keyCode == 109){
			button2_click();
		} */
		
		/* 방향키 좌  방향키 우 방향키 상*/
	 	if(event.keyCode == 37){
			button_click();
		}
		
		else if(event.keyCode == 39){
			button_click();
		}
		
		else if(event.keyCode == 38){
			button_click();
		}
};

function button_click() {
	location.href = "main.do";
}
</script>
</head>
<body>
	<div class="card text-center">
		<div class="card-header">
			검사결과~~~~~
		</div>
		<div class="card-body">
			<h1>검사결과</h1>
			<!-- 문제 + 결과 -->
			<%-- <table class="table">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="80%">문제</th>
						<th width="10%">결과</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="loadExamItem" items="${loadExamItem}" varStatus="status">
					<tr>
						<td>
							${loadExamItem.no}
						</td>
						<td>
							${loadExamItem.examItem}
						</td>
						<td>
							${loadExamRes[status.index].resOx} 
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="3">
							<h1>'O'갯수 : ${resCnt}개</h1>
							<h2>상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명</h2>
						</td>
					</tr>
				</tbody>
			</table> --%>
			
			<!-- 결과 -->
			<table class="table">
				<thead>
					<tr>
						<td>
							<h1>'O'갯수 : ${resCnt}개</h1>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<h2>상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명</h2>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="card-body align-self-center">
			<button type="button" class="btn btn-success btn-lg" 
				id="button1"
				style="font-size:30px; width: 200px; height: 100px;"
				onclick="button1_click();">돌아가기</button>
			</div>
			<h3>아무버튼이나 눌러주세요.</h3>
		</div>
	</div>
</body>
</html>