<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MAIN</h1>
	<%
	String id  = session.getAttribute("log").toString();
	%>
	<h3><%=id %>님 로그인중 ...</h3>
	<button onclick="location.href='index.jsp'">logout</button>
	<a href="_10_boradList.jsp">게시판</a>
</body>
</html>