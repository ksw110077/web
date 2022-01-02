<%@page import="board.CommentsDAO"%>
<%@page import="board.CommentsDTO"%>
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
		request.setCharacterEncoding("UTF-8");
		int parentID = Integer.parseInt(request.getParameter("parentID"));
		String commenter = request.getParameter("commenter");
		String comments = request.getParameter("inputText");
		CommentsDAO dao = CommentsDAO.getInstance();
		CommentsDTO add = new CommentsDTO(parentID, commenter, comments);
		if(dao.addComments(add)){
			response.sendRedirect(String.format("_18_boardView.jsp?code=%d",parentID));		
		}
		else {
			System.out.println("댓글 작성 실패");	
		}
	%>
</body>
</html>