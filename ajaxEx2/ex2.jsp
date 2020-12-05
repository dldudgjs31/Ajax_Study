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
		var url;
		var n1=$("#num1").val();
		var n2=$("#num2").val();
		var o=encodeURIComponent($("#oper").val());
		
		url="ex2_ok.jsp";
		/*
			-$.get(), $.post(), $.ajax() 함수를 이용하여 파라미터를 전송할시 주의사항
			파라미터를 {이름:값 , 이름:값} 형식으로 보내면서
			값을 encodeURIComponent() 해서 보내면
			서버측에서는 반드시 URLDecoder.decode()로 디코딩해야한다.
			
			-$.ajax() 에서 값을
				이름1=값&이름2=값 으로 전송하면서 값을 encodeURIComponent() 해서 보내면
				서버측에서는 반드시 URLDecoder.decode()로 디코딩하지 않는다.
		*/
		//AJAX-GET 방식 // {서버가 받는 이름 : 보내는 값}
		$.get(url, {num1:n1, num2:n2, oper:o}, function(data){
			$("#resultLayout").html(data);
		});
	});
});
</script>
</head>
<body>

<h3>AJAX-jQuery.get() : GET 방식</h3>
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