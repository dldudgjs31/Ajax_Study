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
function send() {
	var f = document.forms[0];
	
	f.submit();
}
</script>
</head>
<body>
<form action="ex1_ok.jsp" method="post" enctype="application/x-www-form-urlencoded"><!-- enctype : 기본값으로 url방식으로 전송 -->
<p>
	<input type="text" name="num1">
	<select name="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" name="num2">
	<button type="button" onclick="send();"> = </button>
</p>

</form>

</body>
</html>