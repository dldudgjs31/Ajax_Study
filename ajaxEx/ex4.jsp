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
	var name=document.getElementById("name").value;
	var content=document.getElementById("content").value;
	
	query="content="+content+"&name="+name;
	var url = "ex4_ok.jsp";
	
	// AJAX 객체 생성
	httpReq = createXMLHttpRequest();
	
	// 서버에서 처리한 결과를 전송 할 자바스크립트 함수 지정
	httpReq.onreadystatechange = callback;
	
	// post 방식으로 서버에 전송
	httpReq.open("POST", url, true);
	//form 태그에서 기본적으로 설정되어있는 값 여기서는 form을 사용하지 않았기 때문에 encode 방식을 세팅해줘야 한다.
	httpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	httpReq.send(query);
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
	
	// 서버에서 전달 받은 데이터(xml)
	var xmlDoc = httpReq.responseXML;
	
	//console.log(xmlDoc)
	
	var root = xmlDoc.getElementsByTagName("guest")[0];
	var dataCount = root.getElementsByTagName("dataCount")[0].firstChild.nodeValue;
	
	var out="전체개수:"+dataCount+"<br>";
	
	var record = xmlDoc.getElementsByTagName("record");
	for(var i = 0; i<record.length; i++){
		var item=record[i];
		out+="게시물번호"+item.getAttribute("num")+"<br>";
		out+="이름"+item.getElementsByTagName("name")[0].firstChild.nodeValue+"<br>";
		out+="내용"+item.getElementsByTagName("content")[0].firstChild.nodeValue+"<br>";
		out+="<hr>";
	}
	box.innerHTML=out;
}
</script>

</head>
<body>

<h3> AJAX 예제 -POST : XML 방식</h3>

<div>
	<p> <input type="text" id="name"> </p>
	<p> <textarea rows="3" cols="60" id="content"></textarea> </p>
	<p> <button type="button" onclick="send();">등록</button> </p>
</div>
<hr>
<div id="box"></div>

</body>
</html>