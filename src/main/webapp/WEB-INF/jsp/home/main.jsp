<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="main_top.jsp"%>
<title>치매진단 검사도구</title>
<script type="text/javaScript" language="javascript" defer="defer">
function button1_click() {
	location.href = "loading.do?TRGTER=M";
}
function button2_click() {
	location.href = "loading.do?TRGTER=P";
}
function logout_click() {
	location.href = "logout.do";
}

/* 키입력 수신 */
/* 방향키 좌/우 */
/* window.onkeydown = function()	{
	if(event.keyCode == 37){
		button1_click();
	}
	if(event.keyCode == 39){
		button2_click();
	}
}; */
</script>
</head>
<body>
	<div class="card text-center">
		<div class="card-body">
			<h1>온라인 치매검사</h1>
			<div class="card-body align-self-center">
			<button type="button" class="btn btn-success btn-lg" 
				id="button1"
				style="font-size:40px; width: 500px; height: 200px;"
				onclick="button1_click();">인지기능장애 평가도구</button>
			<button type="button" class="btn btn-info btn-lg" 
				id="button2"
				style="font-size:40px; width: 500px; height: 200px;"
				onclick="button2_click();">우울증 평가도구</button>
			</div>
			<h3>버튼을 눌러주세요.</h3>
		</div>
		<div class="card-footer">
			<h3>${ORG_NM}</h3>
			<button type="button" class="btn btn-danger btn-lg" onclick="logout_click();">로그아웃</button>
		</div>
	</div>
</body>
</html>