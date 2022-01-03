<%@page import="rentCar.Member"%>
<%@page import="rentCar.RentcarDAO"%>
<%@page import="rentCar.Rentcar"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("memberName");
		String email = request.getParameter("eMail");
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		RentcarDAO dao = RentcarDAO.getInstance();
		Member temp = new Member(id,pw,name,email,gender);
		if(dao.addMember(temp)){
			session.setAttribute("log", id);
			String center = (String)session.getAttribute("centerURL");
			if(center.equals("") || center == null){
				response.sendRedirect("01_main.jsp?center=03_center.jsp");
			}
			else {
				response.sendRedirect("01_main.jsp?center=" + center);
			}
		}
		else {
			%>
			<script type="text/javascript">
				alert("회원가입에 실패했습니다. 잠시 후 다시 시도해주세요");
			</script>
			<%
		}
	%>
</body>
</html>