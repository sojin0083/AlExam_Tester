<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="main_top.jsp"%>
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
	/* 역점수 문제 확인용 */
	var examItemRe = document.getElementById("examItemRe1").value;
	
	noTR.style.display = 'inline';
	examItemTR.style.display = 'inline';
	no.style.display = 'inline';
	examItem.style.display = 'inline';
	
	/* 역점수 문제 버튼전환 */
	if(examItemRe == "Y"){
		document.getElementById('buttonA').setAttribute('onclick','buttonA_click(0)');
		document.getElementById('buttonB').setAttribute('onclick','buttonA_click(1)');
	}else{
		document.getElementById('buttonA').setAttribute('onclick','buttonA_click(1)');
		document.getElementById('buttonB').setAttribute('onclick','buttonA_click(0)');
	}
});

/* type P 결과처리*/
function buttonA_click(res) {
	res_process(res);
	item_process();
}

function buttonB_click(res) {
	res_process(res);
	item_process();
}

/* 리셋 key:m/109 */
function button3_click() {
	location.href = "main.do";
}

/* 문제 전환*/
function item_process() {
	var resCnt = document.getElementById("resCnt").value;
	var examCnt = ${examCnt}+1
	if(parseInt(resCnt) < examCnt){
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
		/* 역점수 문제 확인용 */
		var examItemRe = document.getElementById("examItemRe" + resCnt).value;
		
		noTR.style.display = 'inline';
		examItemTR.style.display = 'inline';
		no.style.display = 'inline';
		examItem.style.display = 'inline';
		
		/* 역점수 문제 버튼전환 */
		if(examItemRe == "Y"){
			document.getElementById('buttonA').setAttribute('onclick','buttonA_click(0)');
			document.getElementById('buttonB').setAttribute('onclick','buttonA_click(1)');
		}else{
			document.getElementById('buttonA').setAttribute('onclick','buttonA_click(1)');
			document.getElementById('buttonB').setAttribute('onclick','buttonA_click(0)');
		}
	}
}

/* 결과 처리*/
function res_process(res) {
	var resCnt = document.getElementById("resCnt").value;
	var examCnt = ${examCnt}+1
	if(parseInt(resCnt) < examCnt){
		document.getElementById("resCnt").value = parseInt(resCnt) + 1;
		/* $('#an' + resCnt).text(res); */
		$('#an' + resCnt).text('O'); 
		document.getElementById("res" + resCnt).value = res; 
	}
	resCnt = document.getElementById("resCnt").value;
	if(resCnt == examCnt){
		document.result_load.submit();
	}
} 

/* 키입력 수신 */
/* 방향키 좌  방향키 우 */
/* window.onkeydown = function()	{	
	
	var resCnt = document.getElementById("resCnt").value;
	var examItemRe = document.getElementById("examItemRe" + resCnt).value;
 	if(event.keyCode == 65){
 		if(examItemRe == "Y"){
 			buttonA_click(0);
		}else{
			buttonA_click(1);
		}
	}else if(event.keyCode == 83){
		if(examItemRe == "Y"){
 			buttonB_click(1);
		}else{
			buttonB_click(0);
		}
	} */
	
	/* 방향키 상*/
/* 	else if(event.keyCode == 38){
		button3_click();
	}
}; */
</script>
</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
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
						<!-- 역점수 확인 -->
						<input type="hidden" id="examItemRe<%=cnt%>" value="${loadExamItem.ckRe}">
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
			<button type="button" class="btn btn-primary btn-lg" 
					id="buttonA"
					style="font-size:80px; width: 300px; height: 150px;"
					onclick="buttonA_click('1');">예</button>
			<button type="button" class="btn btn-success btn-lg" 
					id="buttonB"
					style="font-size:80px; width: 300px; height: 150px;"
					onclick="buttonA_click('0');">아니오</button>
		</div>
		<div class="card-footer text-center">
		<input type="hidden" id="resCnt" value="1">
			<table class="table" style="font-size:30px">
			<thead class="thead-light">
				<tr>
					<c:forEach var="loadExamItem" items="${loadExamItem}">
						<td width="${tableWidth}%">${loadExamItem.no}</td>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%-- <form class="form-inline" method="post" action="<c:url value='/result_load.do'/>"> --%>
					<form name="result_load" id="result_load" class="form-inline" method="post" action="<c:url value='/result_load.do'/>">
					<%
						cnt = 1; 
					%>
					<c:forEach var="loadExamItem" items="${loadExamItem}">
						<td><label id="an<%=cnt%>" name="res<%=cnt%>"></label></td>
						<input type="hidden" name="res" id="res<%=cnt%>" value="">
						<%
							cnt = cnt + 1;
						%>
					</c:forEach>
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