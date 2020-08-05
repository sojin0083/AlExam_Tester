<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치매진단 검사도구</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/css/bootstrap/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

function button1_click() {
	alert("버튼1을 누르셨습니다.");
}
function button2_click() {
	alert("버튼2을 누르셨습니다.");
}
window.onkeydown = function()	{
	/* 방향키 좌 */
	if(event.keyCode == 37){
		button1_click();
	}
	/* 방향키 우 */
	if(event.keyCode == 39){
		button2_click();
	}
};
</script>
</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="board.html">진단하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="board2.html">진단완료목록</a>
    </li>
  </ul>

</nav>
<body>
	<div class="row" style="font-size:30px;"">
		<div class="col-sm-2 text-center">
			${qNo}번
		</div>
		<div class="col-sm-8" id="question">
			${question}
		</div>
	</div>
	<div class="card text-center">
		<div class="card-body align-self-center">
		<button type="button" class="btn btn-primary btn-lg" 
			id="button1"
			style="font-size:100px; width: 200px; height: 200px;"
			onclick="button1_click();">O</button>
		<button type="button" class="btn btn-danger btn-lg" 
			id="button2"
			style="font-size:100px; width: 200px; height: 200px;"
			onclick="button2_click();">X</button>
		</div>
		<div class="card-footer text-center">
			<table class="table" style="font-size:30px">
			<thead class="thead-light">
				<tr>
					<td width="7.14%">1</td>
					<td width="7.14%">2</td>
					<td width="7.14%">3</td>
					<td width="7.14%">4</td>
					<td width="7.14%">5</td>
					<td width="7.14%">6</td>
					<td width="7.14%">7</td>
					<td width="7.14%">8</td>
					<td width="7.14%">9</td>
					<td width="7.14%">10</td>
					<td width="7.14%">11</td>
					<td width="7.14%">12</td>
					<td width="7.14%">13</td>
					<td width="7.14%">14</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label id="a1"></label></td>
					<td><label id="a2"></label></td>
					<td><label id="a3"></label></td>
					<td><label id="a4"></label></td>
					<td><label id="a5"></label></td>
					<td><label id="a6"></label></td>
					<td><label id="a7"></label></td>
					<td><label id="a8"></label></td>
					<td><label id="a9"></label></td>
					<td><label id="a10"></label></td>
					<td><label id="a11"></label></td>
					<td><label id="a12"></label></td>
					<td><label id="a13"></label></td>
					<td><label id="a14"></label></td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>