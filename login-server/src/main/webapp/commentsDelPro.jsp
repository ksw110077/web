<%@page import="board.CommentsDAO"%>
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
		CommentsDAO  dao = CommentsDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("log");
		String code = request.getParameter("parentID");
		int no = Integer.parseInt(request.getParameter("no"));
		if(!dao.delComments(no)){
			%>
			<script type="text/javascript">
			alert("댓글 작성자가 아닙니다.");
			</script>
			<%	
		}
		response.sendRedirect(String.format("_18_boardView.jsp?code=%s", code));
	%>
</body>
</html>