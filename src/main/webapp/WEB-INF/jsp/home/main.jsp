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
<script type="text/javaScript" language="javascript" defer="defer">
function button1_click() {
	location.href = "loading.do?TRGTER=M";
}
function button2_click() {
	location.href = "loading.do?TRGTER=P";
}

window.onkeydown = function()	{
	/* 방향키 좌 */
	if(event.keyCode == /* 107 */37){
		button1_click();
	}
	/* 방향키 우 */
	if(event.keyCode == /* 106 */39){
		button2_click();
	}
};
</script>

<!-- <script language="javascript">
var msg = new SpeechSynthesisUtterance();
msg.lang = 'en-US';
    function ttsTest(){

          msg.rate = 1.2; // 0.1 ~ 10      
          msg.pitch = 1.3; // 0 ~ 2
       
        msg.text = "당신의 기억력은 10년 전에 비해 저하되었습니까?";
        speechSynthesis.speak(msg);
        }
    function setLang(langTxt){
        msg.lang = langTxt;
        }
</script>
<button onclick="setLang('euc-kr'); ttsTest();">Click2</button> -->




</head>
<body>
	<div class="card text-center">
		<div class="card-body">
			<h1>온라인 치매검사</h1>
			<div class="card-body align-self-center">
			<button type="button" class="btn btn-success btn-lg" 
				id="button1"
				style="font-size:40px; width: 400px; height: 200px;"
				onclick="button1_click();">본인 치매검사</button>
			<button type="button" class="btn btn-info btn-lg" 
				id="button2"
				style="font-size:40px; width: 400px; height: 200px;"
				onclick="button2_click();">가족 치매검사</button>
			</div>
			<h3>좌우 방향키를 눌러주세요.</h3>
		</div>
		<div class="card-footer">
			<h3>${ORG_NM}</h3>
		</div>
	</div>
</body>
</html>