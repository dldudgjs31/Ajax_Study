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
/* 		var num1=$("#num1").val();
		var num2=$("#num2").val();
		var oper=$("#oper").val();
		
		query="num1="+num1+"&num2="+num2+"&oper="+encodeURIComponent(oper);
		 */
		query=$("form[name=myForm]").serialize(); // name 속성을 이용하여 위의 작업을 일괄처리해줌
		 
		url="ex1_ok.jsp?"+query;
		
		$("#resultLayout").load(url);// AJAX-GET 방식
	});
});
</script>
</head>
<body>

<h3>AJAX-jQuery.load() : GET 방식</h3>
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