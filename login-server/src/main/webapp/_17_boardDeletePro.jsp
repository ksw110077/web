<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(session.getAttribute("log") == null){
		response.sendRedirect("_05_login.jsp");
	}
	else {
		request.setCharacterEncoding("UTF-8");
		int code = Integer.parseInt(request.getParameter("code"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.delContent(code);
		response.sendRedirect("_10_boradList.jsp");
	}
	%>
</body>
</html>