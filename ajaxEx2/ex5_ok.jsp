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
	out.println(job.toString());

%>

