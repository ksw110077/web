<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수강신청 내역</h1>
	<p>
	<%
		// 동일한 이름의 파라미터명의 값을 (여러개) 가져올 때에는
		// request.getParameterValues
		
		String [] values = request.getParameterValues("subjects");
		for(int i=0; i<values.length; i++){
	%>
	<p><%=values[i] %></p>
	<%
		}
	%>
	</p>
</body>
</html>