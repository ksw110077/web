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
<title>JoinPro</title>
</head>
<body>
	<%
		// 사용자에게는 보이지 않는 페이지 (데이터 처리)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO user = new UserDTO(id, pw);
		// 회원가입 처리
		dao.addUser(user);
		
		ArrayList<UserDTO> users =  dao.getUsers();
		UserDTO last = users.get(users.size() - 1);
	%>
	<h1><%=last.toString() %></h1>
	<div>
		<button onclick = "moveLogin()"> 로그인 화면</button>
	</div>
</body>
</html>