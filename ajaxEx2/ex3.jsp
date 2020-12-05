<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head >
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js">
</script>
<script type="text/javascript">
$(function(){
	$('#btnSend').click(function(){
		var url;
		var n1=$("#num1").val();
		var n2=$("#num2").val();
		var o=$("#oper").val();
		
		url="ex3_ok.jsp";
		
		//AJAX-POST 방식 //
		$.post(url, {num1:n1, num2:n2, oper:o}, function(data){
			$("#resultLayout").html(data);
		});
	});
});
</script>
</head>
<body>

<h3>AJAX-jQuery.post() : POST 방식</h3>
<form name="myForm" method="post">

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