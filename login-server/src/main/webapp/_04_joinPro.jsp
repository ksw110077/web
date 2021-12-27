<%@page import="javax.websocket.Session"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="_02_validation.js"></script>
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
		String url = "";
		if(dao.addUser(user)){
			url = "_05_login.jsp";
		}
		else {
			session.setAttribute("checkId", false);
			url = "_03_join.jsp";
		}
		response.sendRedirect(url);
		
	%>
</body>
</html>