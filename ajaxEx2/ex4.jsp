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
$(function(){
	$('#btnSend').click(function(){
		var query, url;

		query=$("form[name=myForm]").serialize(); // name 속성을 이용하여 위의 작업을 일괄처리해줌
		url="ex4_ok.jsp";
		$.ajax({
			type:"post",
			url:url,
			data:query, // data: 키값 키값
			//성공시
			success:function(data){
				$("#resultLayout").html(data);
			},
			//실패시
			error:function(e){
				console.log(e.responseText);
			}
			
		});
	});
});
</script>
</head>
<body>

<h3>AJAX-jQuery.ajax() : GET/POST 방식</h3>
<form name="myForm">

<p>
	<input type="text" name="num1" id="num1">
	<select name="oper" id="oper">
		<option value="+">더하기</option>
		<option value="-">빼기</option>
		<option value="*">곱하기</option>
		<option value="/">나누기</option>
	</select>
	<input type="text" name="num2" id="num2">
	<button type="button" id="btnSend"> = </button>
</p>

</form>

<hr>

<div id="resultLayout"></div>

</body>
</html>