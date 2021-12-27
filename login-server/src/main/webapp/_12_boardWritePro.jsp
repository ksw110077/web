<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Login Done</title>
</head>
<body>
	<%
		// 사용자에게는 보이지 않는 페이지 (데이터 처리)
		request.setCharacterEncoding("UTF-8");
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = session.getAttribute("log").toString();
		String password = request.getParameter("password");
		BoardDAO  dao = BoardDAO.getInstance();
		BoardDTO  board = new BoardDTO(title, content, id, password);
		if(dao.addContent(board)){
			response.sendRedirect("_10_boradList.jsp");			
		}
		else {
			System.out.println("게시물 작성 실패");	
		}
		%>		
	<script type="text/javascript">
	</script>
</body>
</html>