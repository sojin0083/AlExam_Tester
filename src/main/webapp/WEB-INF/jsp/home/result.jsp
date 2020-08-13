<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="main_top.jsp"%>
<title>검사 결과</title>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

window.onkeydown = function(){
	button_click();
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
			<!-- 결과 -->
			<table class="table">
				<thead>
					<tr>
						<td>
							<h1>점수 : ${resScore}점</h1>
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
				onclick="button_click();">돌아가기</button>
			</div>
			<h3>아무버튼이나 눌러주세요.</h3>
		</div>
	</div>
</body>
</html>