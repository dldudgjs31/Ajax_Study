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
	$("#btnSend").click(function(){
		var query = $("form[name=myForm]").serialize();
		
		$.ajax({
			type : "get",
			url : "ex6_ok.jsp",
			data : query,
			dataType : "xml",
			success : function(data){
				printData(data);
			},
			error : function(e){
				console.log(e.responseText);
			},
		});
	});
	
	function printData(data){
		var out = "데이터 개수  :"+ $(data).find("dataCount").text();
		$(data).find("record").each(function(){
			var item = $(this);
			var num = item.attr("num");
			var name = item.find("name").text();
			var content = item.find("content").text();
			
			out+="<br>번호 : "+num+", 이름"+name;
			out+="<br>내용 : "+content+"<hr>";
		});
		$("#resultLayout").html(out);
	}
});
</script>

</head>
<body>

<h3>AJAX : XML </h3>

<form name="myForm">
<p> <input type="text" name="name" id="name"> </p>
<p> <textarea rows="5" cols="50" name="content" id="content"></textarea> </p>
<p> <button type="button" id="btnSend">등록하기</button> </p>
</form>
<hr>
<div id="resultLayout"></div>
</body>
</html>