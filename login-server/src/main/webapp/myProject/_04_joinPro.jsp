<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 데이터</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id_input");
		String pw = request.getParameter("password");
		String pwRe = request.getParameter("passwordRe");
		String name = request.getParameter("user_name");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		String  gender= request.getParameter("gender");
		String  eMail= request.getParameter("eMail");
		int conNum = Integer.parseInt(request.getParameter("conNum"));
		int number = Integer.parseInt(request.getParameter("number"));
	%>
	
	<p>회원가입 정보</p>
	<p>ID : <%=id %></p>
	<p>PW : <%=pw %></p>
	<p>NAME : <%=name %></p>
	<p>생년월일 : <%=year %>년 <%=month %>월 <%=date %>일</p>
	<p>성별 : <%=gender %></p>
	<p>이메일 : <%=eMail %></p>
	<p>전화 번호 : +<%=conNum %> <%=number %></p>
</body>
</html>