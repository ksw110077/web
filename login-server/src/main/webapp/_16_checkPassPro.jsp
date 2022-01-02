<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
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
	
	int code = Integer.parseInt(request.getParameter("code"));
	int revision = Integer.parseInt(request.getParameter("revision"));
	int delete = Integer.parseInt(request.getParameter("delete"));
	String password = request.getParameter("password");

	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO temp = dao.searchDTO(code);

	if (password.equals(temp.getPassword())) {
		if (revision == 1) {
			// 수정
			System.out.println("revision");
			response.sendRedirect(String.format("_13_boardUpdateForm.jsp?code=%d", code));
		}
		if (delete == 1) {
			// 삭제
			System.out.println("delete");
			response.sendRedirect(String.format("_17_boardDeletePro.jsp?code=%d", code));
		}
	} else {
	%>
	<script type="text/javascript">
		alert("게시물 비밀번호가 틀립니다.");
	</script>
	<%
	response.sendRedirect(String.format("_18_boardView.jsp?code=%d", code));
	}
	%>
</body>
</html>