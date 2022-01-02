<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 비밀번호 확인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
	String id = (String) session.getAttribute("log");
	request.setCharacterEncoding("UTF-8");
	int code = Integer.parseInt(request.getParameter("code"));
	int revision = Integer.parseInt(request.getParameter("revision"));
	int delete = Integer.parseInt(request.getParameter("delete"));
	
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO temp = dao.searchDTO(code);
	
	if(id.equals(temp.getId())){
		%>
		<form method = "post" action="_16_checkPassPro.jsp">		
		<input name="password"  type="text" placeholder="게시물 비밀번호 입력">
		<input name="code" type="hidden" value="<%=code %>">
		<input name="revision" type="hidden" value="<%=revision %>">
		<input name="delete" type="hidden" value="<%=delete %>">
		<input type="button" onclick="checkPw(form)" value="입력완료">
		</form>
		<%
	}
	else {
		%>
		<script type="text/javascript">
			alert("회원님의 게시글이 아닙니다.");
			<%
			System.out.print("회원님의 게시글이 아닙니다.");
			%>
		</script>
		<%
			response.sendRedirect(String.format("_18_boardView.jsp?code=%d",code));
	}
	%>
	<script type="text/javascript">
	
	function checkPw(form){
		const password = form.password.value;
		if(password == ""){
			<%
			System.out.print("비밀번호를 입력해주세요");
			%>
			alert("비밀번호를 입력해주세요");
		}
		else {
			form.submit();
		}
	}
	
	</script>
</body>
</html>