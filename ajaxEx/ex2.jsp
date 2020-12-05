<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
// AJAX 객체 생성
function createXMLHttpRequest() {
	var req = null;
	
	if(window.XMLHttpRequest) { // IE 7.0 이상, Non-Microsoft browsers
		req = new XMLHttpRequest();
	} else if(window.ActiveXObject) { // IE 7 미만
		req = new ActiveXObject("Msxml2.XMLHTTP");
	}
	
	return req;
}

var httpReq = null;
function send() {
	var query;
	var num1=document.getElementById("num1").value;
	var num2=document.getElementById("num2").value;
	var oper=document.getElementById("oper").value;
	
	query="num1="+num1+"&num2="+num2+"&oper="+oper;
	var url = "ex2_ok.jsp?"+query;
	
	// AJAX 객체 생성
	httpReq = createXMLHttpRequest();
	
	// 서버에서 처리한 결과를 전송 할 자바스크립트 함수 지정
	httpReq.onreadystatechange = callback;
	
	// GET 방식으로 서버에 전송
	httpReq.open("GET", url, true);
	httpReq.send(null);
}

// 서버에서 처리한 결과를 넘겨 받는 함수
function callback() {
	if(httpReq.readyState == 4) { // 요청상태(4:모든 요청 및 응답 완료)
		if(httpReq.status == 200) { // 서버로 부터 넘겨 받은 상태코드(200:성공)
			printData();
		}
	}
}

function printData() {
	var box = document.getElementById("box");
	
	// 서버에서 전달 받은 데이터(html)
	var result = httpReq.responseText;
	
	box.innerHTML = result;
}
</script>

</head>
<body>

<h3> AJAX 예제 - GET 방식 </h3>

<p>
	<input type="text" id="num1">
	<select id="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="num2">
	<button type="button" onclick="send();"> = </button>
</p>
<hr>
<div id="box"></div>

</body>
</html>