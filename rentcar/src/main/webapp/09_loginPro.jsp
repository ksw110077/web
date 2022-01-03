<%@page import="rentCar.RentcarDAO"%>
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
		RentcarDAO dao = RentcarDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		
		boolean pass = dao.chkMember(id, pw);
		
		if(pass){
			session.setAttribute("log", id);
			String center = (String)session.getAttribute("centerURL");
			if(center != null){
				response.sendRedirect("01_main.jsp?center=" + center);
			}
			else {
				response.sendRedirect("01_main.jsp?center=03_center.jsp");
			}
		}
	%>
</body>
</html>