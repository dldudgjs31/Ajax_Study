<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String oper = request.getParameter("oper");
	String result="";
	
	switch(oper){
	case "add" : result=String.format("%d+%d=%d", num1,num2, num1+num2); break;
	case "sub" : result=String.format("%d-%d=%d", num1,num2, num1-num2); break;
	case "mul" : result=String.format("%d*%d=%d", num1,num2, num1*num2); break;
	case "div" : result=String.format("%d/%d=%d", num1,num2, num1/num2); break;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
	수1: <%=num1 %>, 수2: <%=num2 %>
</p>
<p> 결과 : <%=result %></p>

</body>
</html>