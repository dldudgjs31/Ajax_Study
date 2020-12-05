<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	
	JSONObject job = new JSONObject();
	job.put("count", 5);
	
	JSONArray jarr = new JSONArray();
	for(int i = 201; i<=205; i++){
		JSONObject ob = new JSONObject();
		ob.put("num", i);
		ob.put("name",name+"-"+i);
		ob.put("content",content+"-"+i);
		jarr.put(ob);
	}
	job.put("list", jarr);
	// System.out.println(job.toString());
	//클라이언트에게 json 데이터 전송
	out.println(job.toString());
	
/*
	- JSON : 데이터 교환방식중 하나
		하나의 데이터  - {"이름1":값1, "이름1":값2}
		여러개의 데이터 - [{"이름1":값1, "이름1":값2},{"이름1":값1, "이름1":값2},{"이름1":값1, "이름1":값2}]
	
*/
/*
<dataCount>5</dataCount> => xml 방식
"dataCount":5 => JSON 방식
*/
/*	Map과 유사하게 json 값을 넘기는데 이때 아래와 같이 \를 넣어서 넘겨야한다.
	StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"dataCount\":5");
	sb.append(", \"name\":\"홍길동\"");
	sb.append("}");
*/
%>

