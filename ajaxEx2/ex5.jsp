<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js">
</script>

<script type="text/javascript">
function send(){
	var query = $("form[name=myForm]").serialize();
	var url = "ex5_ok.jsp";
	
	$.ajax({
		type : "post",
		url : url,
		data : query,
		dataType : "json", // 서버에서 전송받는 데이터 타입 (기본값은 text)
		success:function(data){
			printData(data);
		},
		beforeSend:check, // 서버에서 전송되기 전에 실행, return false; 이면 서버에서 전송하지 않음
		error:function(e) {
			console.log(e.responseText);
		}
	});
}

function check(){
	if(!$("#name").val()){
		$("#name").focus();
		return false;
	}
	if(!$("#content").val()){
		$("#content").focus();
		return false;
	}
	return true;
}

function printData(data){
	var out="데이터 개수: " + data.count;
	
/* 	for(var i=0;i<data.list.length; i++){
		var num = data.list[i].num;
		var name = data.list[i].name;
		var content = data.list[i].content;
		out+="<br>번호 : "+num+", 이름  : "+name;
		out+="<br>내용 : "+content+"<hr>";
		
	} */
	
	$.each(data.list, function(index, item){
		var num = item.num;
		var name = item.name;
		var content = item.content;
		out+="<br>번호 : "+num+", 이름 : "+name;
		out+="<br>내용: "+content+"<hr>";
		
	});
	$("#resultLayout").html(out);
}
</script>
</head>
<body>

<h3>AJAX : JSON </h3>

<form name="myForm">
<p> <input type="text" name="name" id="name"> </p>
<p> <textarea rows="5" cols="50" name="content" id="content"></textarea> </p>
<p> <button type="button" onclick="send()">등록하기</button> </p>
</form>
<hr>
<div id="resultLayout"></div>
</body>
</html>