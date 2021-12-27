<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="_02_validation_정답.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Login Done</title>
</head>
<body>
	<%
		// 사용자에게는 보이지 않는 페이지 (데이터 처리)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		// 로그인 처리
		UserDTO user = null;
		if(user != null){
		session.setAttribute("log", user.getId());
		System.out.println("session : " + session.getAttribute("log"));
		System.out.println(user.getId() + " 로그인 성공");
		%>
		<h1><%=session.getAttribute("log") %> 님 로그인 중</h1>
		<button onclick="moveLogin()">로그아웃 하기</button>
	<%
		}
		else {
			session.removeAttribute("log");
			System.out.println("session : " + session.getAttribute("log"));
			System.out.println(" 로그인 실패");
	%>
	<script>moveLogin()</script>
	<%
		}
	%>

	<%  %>
</body>
</html>