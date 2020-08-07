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
	
	var noTR = document.getElementById("noTR1");
	var examItemTR = document.getElementById("examItemTR1");
	var examItemCdTR = document.getElementById("examItemCdTR1");
	
	var no = document.getElementById("no1");
	var examItem = document.getElementById("examItem1");
	
	
	noTR.style.display = 'inline';
	examItemTR.style.display = 'inline';
	no.style.display = 'inline';
	examItem.style.display = 'inline';
});

/* O key:k 마우스*/
function button1_click() {
	res_process("O");
	item_process();
}

/* X key:j 마우스*/
function button2_click() {
	res_process("X");
	item_process();
}

/* 리셋 key:m/109 */
function button3_click() {
	location.href = "main.do";
}

/* 문제 전환*/
function item_process() {
	var resCnt = document.getElementById("resCnt").value;
	if(parseInt(resCnt) < 15){
		/* 이전문제 */
		var noTR = document.getElementById("noTR" + (parseInt(resCnt) - 1));
		var examItemTR = document.getElementById("examItemTR" + (parseInt(resCnt) - 1));
		var examItemCdTR = document.getElementById("examItemCdTR" + (parseInt(resCnt) - 1));
		
		var no = document.getElementById("no" + (parseInt(resCnt) - 1));
		var examItem = document.getElementById("examItem" + (parseInt(resCnt) - 1));
		
		noTR.style.display = 'none';
		examItemTR.style.display = 'none';
		no.style.display = 'none';
		examItem.style.display = 'none';
		
		/* 다음문제 */	
		var noTR = document.getElementById("noTR" + resCnt);
		var examItemTR = document.getElementById("examItemTR" + resCnt);
		var examItemCdTR = document.getElementById("examItemCdTR" + resCnt);
		
		var no = document.getElementById("no" + resCnt);
		var examItem = document.getElementById("examItem" + resCnt);
		
		noTR.style.display = 'inline';
		examItemTR.style.display = 'inline';
		no.style.display = 'inline';
		examItem.style.display = 'inline';
	}
} 

/* 결과 처리*/
function res_process(res) {
	var resCnt = document.getElementById("resCnt").value;
	if(parseInt(resCnt) < 15){
		document.getElementById("resCnt").value = parseInt(resCnt) + 1;
		$('#an' + resCnt).text(res);
		document.getElementById("res" + resCnt).value = res; 
	}
	resCnt = document.getElementById("resCnt").value;
	if(resCnt == '15'){
		document.result_load.submit();
	}
} 

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
		button1_click();
	}
	
	else if(event.keyCode == 39){
		button2_click();
	}
	
	else if(event.keyCode == 38){
		button3_click();
	}
};
</script>
</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

  <!-- Links -->
<!--   <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="board.html">진단하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="board2.html">진단완료목록</a>
    </li>
  </ul> -->
  
  <ul class="navbar-nav">
  	<li class="nav-item">
      <a class="nav-link" href="#">치매검사</a>
    </li>
  </ul>

</nav>
<body>
	<div class="row text-center" style="font-size:40px;"">
	<!-- ID 카운터 -->
	<%!
		int cnt = 1;
	%>
	<%
		cnt = 1; 
	%>
		<table class="table">
		<c:forEach var="loadExamItem" items="${loadExamItem}">
			<tbody>
				<tr>
					<td id="examItemCdTR<%=cnt%>" style="display:none;">
						<!-- 문제코드 -->
						<input type="hidden" id="examItemCd<%=cnt%>" value="${loadExamItem.examItemCd}">
					</td>
					<td id="noTR<%=cnt%>" style="display:none;">
						<!-- 문제번호 -->
						<!-- display:inline / display:none -->
						<label id="no<%=cnt%>" style="display:none;">${loadExamItem.no}</label>번.
						<input type="hidden" id="no<%=cnt%>" value="${loadExamItem.no}">
					</td>
					<td id="examItemTR<%=cnt%>" style="display:none;">
						<!-- 문제 -->
						<label id="examItem<%=cnt%>" style="display:none;">${loadExamItem.examItem}</label>
						<input type="hidden" id="examItem<%=cnt%>" value="${loadExamItem.examItem}">
					</td>
				</tr>
			</tbody>
			<%
				cnt = cnt + 1;
			%>
		</c:forEach>
		</table>
	</div>
	<div class="card text-center">
		<div class="card-body align-self-center">
		<button type="button" class="btn btn-danger btn-lg" 
			id="button2"
			style="font-size:100px; width: 200px; height: 200px;"
			onclick="button1_click();">O</button>
		<button type="button" class="btn btn-primary btn-lg" 
			id="button1"
			style="font-size:100px; width: 200px; height: 200px;"
			onclick="button2_click();">X</button>
		</div>
		<div class="card-footer text-center">
		<input type="hidden" id="resCnt" value="1">
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
					<%-- <form class="form-inline" method="post" action="<c:url value='/result_load.do'/>"> --%>
					<form name="result_load" id="result_load" class="form-inline" method="post" action="<c:url value='/result_load.do'/>">
					<td><label id="an1" name="res1"></label></td>
					<td><label id="an2" name="res2"></label></td>
					<td><label id="an3" name="res3"></label></td>
					<td><label id="an4" name="res4"></label></td>
					<td><label id="an5" name="res5"></label></td>
					<td><label id="an6" name="res6"></label></td>
					<td><label id="an7" name="res7"></label></td>
					<td><label id="an8" name="res8"></label></td>
					<td><label id="an9" name="res9"></label></td>
					<td><label id="an10" name="res10"></label></td>
					<td><label id="an11" name="res11"></label></td>
					<td><label id="an12" name="res12"></label></td>
					<td><label id="an13" name="res13"></label></td>
					<td><label id="an14" name="res14"></label></td>
					<input type="hidden" name="res" id="res1" value="">
					<input type="hidden" name="res" id="res2" value="">
					<input type="hidden" name="res" id="res3" value="">
					<input type="hidden" name="res" id="res4" value="">
					<input type="hidden" name="res" id="res5" value="">
					<input type="hidden" name="res" id="res6" value="">
					<input type="hidden" name="res" id="res7" value=""> 
					<input type="hidden" name="res" id="res8" value="">
					<input type="hidden" name="res" id="res9" value="">
					<input type="hidden" name="res" id="res10" value="">
					<input type="hidden" name="res" id="res11" value="">
					<input type="hidden" name="res" id="res12" value="">
					<input type="hidden" name="res" id="res13" value="">
					<input type="hidden" name="res" id="res14" value="">
					<input type="hidden" name="TRGTER" value="${trgter}">
					<c:forEach var="loadExamItem" items="${loadExamItem}">
						<!-- 문제코드 --> 
						<input type="hidden" name="examItemCd"value="${loadExamItem.examItemCd}">		
					</c:forEach>
					</form>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>