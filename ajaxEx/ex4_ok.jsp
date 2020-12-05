<%@ page contentType="text/xml; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
%>

<guest>
	<dataCount>5</dataCount>
	<% for(int i = 101; i<=105 ; i++){ %>
		<record num="<%=i %>">
			<name><%=i %> : <%=name %></name>
			<content><![CDATA[<%=i%> : <%=content%>]]></content>
		</record>
	<% } %> 
</guest>
