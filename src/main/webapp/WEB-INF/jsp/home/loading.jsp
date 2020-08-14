<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="main_top.jsp"%>
<title>검사 로딩중</title>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

function main() {
	var EXAM_TYPE = "${EXAM_TYPE}";
	if(EXAM_TYPE == "KDSQC"){
		location.href = "testPage.do?EXAM_TYPE=KDSQC";
	}else if(EXAM_TYPE == "GDS"){
		location.href = "testPage.do?EXAM_TYPE=GDS";
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