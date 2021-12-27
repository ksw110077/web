<%@page import="board.BoardDTO"%>
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateContent(code, title, content, password);
		response.sendRedirect(String.format("_18_boardView.jsp?code=%d", code));
	}
	%>
</body>
</html>